#!/bin/bash
# Usage: bash bootstrap.sh --package /path/to/release.zip
# Online: curl -fsSL HTTPS_RELEASE/bootstrap.sh | bash -s -- --release HTTPS_RELEASE
set -euo pipefail
fail() { echo "$*" >&2; exit 1; }
[[ $(uname -s) == Darwin && $(uname -m) == arm64 ]] || fail 'Apple Silicon macOS required.'
if [[ $# == 0 ]]; then set -- --release "https://github.com/asdfqwer156/macOS-SpaceShare/releases/download/v0.1.0"; fi
[[ $# == 2 ]] || fail 'Usage: --package LOCAL_ZIP | --release HTTPS_RELEASE_ASSET_BASE'
job=$(mktemp -d "${TMPDIR:-/tmp}/macOS-SpaceShare.XXXXXX")
trap 'rm -rf "$job"' EXIT
case "$1" in
 --package) cp "$2" "$job/package.zip" ;;
 --release)
  url=${2%/}
  [[ $url == https://* && $url != *$'\n'* ]] || fail 'HTTPS release URL required.'
  curl --fail --location --proto '=https' --proto-redir '=https' --connect-timeout 15 --max-time 180 "$url/macOS-SpaceShare-0.1.0-arm64.zip" -o "$job/package.zip"
  curl --fail --location --proto '=https' --proto-redir '=https' --connect-timeout 15 --max-time 30 "$url/macOS-SpaceShare-0.1.0-arm64.zip.sha256" -o "$job/package.sha256"
  expected=$(awk 'NR==1 {print $1}' "$job/package.sha256")
  [[ $expected =~ ^[a-fA-F0-9]{64}$ ]] || fail 'Invalid checksum.'
  actual=$(shasum -a 256 "$job/package.zip" | awk '{print $1}')
  [[ $actual == "$expected" ]] || fail 'Checksum mismatch; nothing installed.' ;;
 *) fail 'Unknown option.' ;;
esac
# Reject traversal and symbolic links before extraction.
unzip -Z1 "$job/package.zip" | while IFS= read -r name; do
 [[ $name != /* && $name != ../* && $name != */../* && $name != *$'\r'* ]] || exit 1
done
ditto -x -k "$job/package.zip" "$job/extracted"
[[ -z $(find "$job/extracted" -type l -print -quit) ]] || fail 'Unexpected symbolic link in package.'
bash "$job/extracted/macOS-SpaceShare/install-prebuilt.sh"
