# macOS-SpaceShare

다른 macOS Space의 전체 화면 창을 Discord 화면 공유 목록에 추가하는 실험용 Vencord 사용자 플러그인입니다. 공식 Vencord 플러그인이 아닙니다.

## 한 줄 설치 (Apple Silicon, macOS 14+)

Discord를 설치하고 한 번 실행한 뒤 완전히 종료하고 터미널에서 실행하세요. Vencord가 없으면 공식 설치기를 받아 설치를 시도합니다. macOS 권한에 막히면 공식 설치 안내를 표시합니다.

```sh
curl -fsSL https://github.com/asdfqwer156/macOS-SpaceShare/releases/download/v0.1.2/bootstrap.sh | bash
```

Node·pnpm·Xcode 없이 설치합니다. 설치가 끝나면 보조 프로그램이 자동으로 열려 화면 기록 권한을 요청합니다. 표시되는 창에서 직접 허용하세요. 이미 거부한 경우 시스템 설정 안내를 따르세요. Discord를 재시작하고 **설정 → Vencord → Plugins → macOS-SpaceShare**를 켭니다.

보조 프로그램은 창 목록과 미리보기를 로컬에서 가져옵니다. 선택 후 실제 방송은 Discord가 처리합니다. 화면 기록 권한은 화면 내용에 대한 접근을 허용합니다.

## 제한 및 복구

- Apple Silicon용 미리 빌드한 Vencord를 적용합니다. 기존 Vencord 빌드는 백업하고 사용자 설정은 유지합니다. **다른 사용자 플러그인은 이 빌드에 포함되지 않습니다.** 필요한 경우 소스 빌드 방식을 사용하세요.
- Intel Mac, 모든 게임, 최소화 창, DRM, 소리 공유는 검증하지 않았습니다.
- 실험 구현에서 macOS 15.7.4 / Discord 0.0.424의 다른 Space 전체 화면 테스트 창과 TextEdit 공유를 확인했습니다. 정리된 배포판은 빌드 및 격리된 설치·복구를 검증했고 다른 Mac에서 실제 방송은 미검증입니다.
- 보조 프로그램은 임시 서명이며 Apple 공증 제품이 아닙니다. 시스템 보호 기능을 해제하지 않습니다.
- Vencord 업데이트/재설치는 사용자 빌드를 덮어쓸 수 있습니다.

제거: Discord 종료 후 아래를 실행합니다. 설치 이후 Vencord 파일이 변경됐으면 복구를 중단합니다.

```sh
bash "$HOME/Library/Application Support/Vencord/macOS-SpaceShare/uninstall.command"
```

## 소스와 라이선스

GPL-3.0-or-later. Release의 `macOS-SpaceShare-0.1.2-corresponding-source.zip`에 플러그인·Swift 보조 프로그램·설치 스크립트·대응 Vencord 소스를 포함합니다. 기반 Vencord 커밋: `ff5810de5ac334c912321d7528d6d923d28c2db5` (https://github.com/Vendicated/Vencord).
