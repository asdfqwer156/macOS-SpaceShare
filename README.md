# macOS-SpaceShare

다른 macOS Space의 전체 화면 창을 Discord 화면 공유 목록에 추가하는 실험용 Vencord 사용자 플러그인입니다. 공식 Vencord 플러그인이 아닙니다.

## 한 줄 설치 (Apple Silicon, macOS 14+)

Discord를 설치하고 한 번 실행한 뒤 완전히 종료하고 터미널에서 실행하세요. Vencord가 없으면 공식 설치기를 받아 설치를 시도합니다. macOS 권한에 막히면 공식 설치 안내를 표시합니다.

```sh
curl -fsSL https://github.com/asdfqwer156/macOS-SpaceShare/releases/download/v0.1.5/bootstrap.sh | bash
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

GPL-3.0-or-later. Release의 `macOS-SpaceShare-0.1.5-corresponding-source.zip`에 플러그인·Swift 보조 프로그램·설치 스크립트·대응 Vencord 소스를 포함합니다. 기반 Vencord 커밋: `ff5810de5ac334c912321d7528d6d923d28c2db5` (https://github.com/Vendicated/Vencord).

## 0.1.5 성능 우선

누락된 창의 실시간 미리보기를 만들지 않고 이름과 공통 이미지만 표시합니다. 조회 결과는 2초간 재사용하고 동시 요청은 한 번으로 합칩니다. 창 이름으로 선택하세요. 방송 인코딩/해상도/프레임은 Discord가 처리하며 방송 중 성능 개선은 미검증입니다. 기존 버전은 제거 후 재설치해야 합니다.

## 0.1.5 백그라운드 준비

Discord에서 플러그인이 시작되면 보조 프로그램 하나를 실행합니다. 창 이름 목록만 5초 간격으로 갱신하며 픽커는 준비된 목록을 즉시 사용합니다. 처음 조회가 끝나지 않았으면 기본 Discord 목록을 먼저 표시합니다. 새 창은 다음 갱신 후 표시됩니다. 플러그인을 끄거나 Discord를 종료하면 함께 종료되고 부모 연결이 끊겨도 자동 종료됩니다. 화면 기록 권한이 있어야 다른 Space의 창을 조회할 수 있습니다.

## 0.1.5 업데이트 알림

이 버전부터 Discord 시작 15초 후와 6시간마다 GitHub Release 목록을 확인합니다. 새 공개 배포판(실험판 포함)이 있으면 알림과 업데이트 명령어 복사 버튼을 표시합니다. Plugins → macOS-SpaceShare 설정에서 수동 확인·복사 및 자동 확인 끄기가 가능합니다. 설치 스크립트가 기존 배포판을 검증·백업하고 교체하므로 명령어 하나로 업데이트할 수 있습니다. Discord는 먼저 완전히 종료하세요. 설치 후 파일을 직접 수정했거나 Vencord가 바뀌면 자동 교체를 중단합니다. 새 버전 알림 기능이 없는 0.1.4 이하 사용자는 이 버전을 한 번 직접 설치해야 합니다. 확인 요청은 GitHub로 전송되며 창 목록이나 화면 내용은 보내지 않습니다.
