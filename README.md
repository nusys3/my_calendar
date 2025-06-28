# My Calendar App

Flutter 웹 기반 달력 애플리케이션
- 다년도 같은 날짜 기록 조회 기능
- 구글/카카오 로그인 지원
- 50년간의 데이터 관리

## 개발 환경 설정

1. Flutter 설치: `flutter --version`
2. 웹 활성화: `flutter config --enable-web`
3. 의존성 설치: `flutter pub get`
4. 웹에서 실행: `flutter run -d chrome`

## 브랜치 전략

- `main`: 프로덕션 배포용
- `develop`: 개발 통합용
- `feature/*`: 기능 개발용

## 기여 방법

1. develop에서 feature 브랜치 생성
2. 작업 완료 후 Pull Request
3. 코드 리뷰 후 develop으로 머지