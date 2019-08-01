# Login-Register(mvc1)
로그인, 로그아웃, 회원가입, 회원 명단, 정보수정, 회원탈퇴의 기능을 가진 매우 간단한 기본 회원관리 코드입니다.<p>
MVC1을 기반으로 작성 하였습니다.

## 기능

#### 로그인
```
로그인 Form -> 로그인 정보 처리 -> dao(select) -> 메인화면
```

#### 로그아웃
```
메인화면 -> request와 session의 정보들 제거후 로그인 화면으로 이동
```

#### 회원가입
```
회원가입 Form -> 회원정보 처리 -> dao(id중복검사)(select,insert) -> 로그인 화면
```

#### 회원명단
```
메인화면 -> dao의 정보를 꺼내온다(password 제외)(select) -> 화면 출력
```

#### 정보수정
```
메인화면 -> Form에 기존정보 남김 -> 수정 -> dao(update) -> 메인 화면
```

#### 회원탈퇴
```
메인화면 -> password 재입력 -> dao(select,delect) -> 메인화면
```

## Author
#### 정명한
