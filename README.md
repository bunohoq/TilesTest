# Spring MVC with Apache Tiles Project

## 📖 프로젝트 소개 (Introduction)

이 프로젝트는 Spring MVC 환경에서 **Apache Tiles**를 사용하여 웹 애플리케이션의 레이아웃을 효율적으로 구성하고 재사용하는 방법을 보여주는 예제임.
공통된 페이지 요소(메뉴, 푸터 등)를 모듈화하고, 각 페이지의 실제 콘텐츠만 동적으로 삽입하는 템플릿 기법을 학습하는 것을 목표로 함.

## ✨ 핵심 개념 및 동작 원리 (Core Concept)

기존의 JSP `include` 방식과 달리, Tiles는 **정의(Definition)**를 기반으로 페이지를 조합함. Controller는 실제 JSP 파일 경로가 아닌, 미리 정의된 **Tiles Definition 이름**을 반환하여 뷰를 결정함.

1.  **HTTP 요청**: 사용자가 URL('/member/info.do')을 요청.
2.  [cite_start]**Controller 처리**: `MemberController`가 요청을 받아 처리 후, 뷰의 이름으로 `"member.info"`라는 문자열을 반환함. [cite: 5]
3.  **Tiles View Resolver**: Spring의 `TilesViewResolver`는 이 문자열을 JSP 파일 경로가 아닌 Tiles Definition의 이름으로 해석함.
4.  **레이아웃 조합**: Tiles 설정 파일(예: `tiles.xml`)에 정의된 `"member.info"` 규칙을 찾음.
    * [cite_start]해당 규칙은 `member.jsp`를 기본 템플릿(레이아웃)으로 사용하도록 지정함. [cite: 1]
    * [cite_start]템플릿 내의 `<tiles:insertAttribute>` 위치에 `main_menu`, `member_menu`, `content` 등의 조각 페이지(JSP)를 동적으로 삽입함. [cite: 1]
5.  **뷰 렌더링**: 모든 조각이 조합된 완성된 HTML 페이지가 사용자에게 응답으로 전송됨.

[cite_start]이러한 구조를 통해 `member.jsp` [cite: 1][cite_start], `admin.jsp` [cite: 2][cite_start], `main.jsp` [cite: 5] 등 역할에 따라 각기 다른 레이아웃을 적용할 수 있음.

## 📁 주요 파일 및 역할 (Key Files)

* **`*Controller.java` (`MainController`, `MemberController`, `AdminController`)**:
    * 사용자의 요청(URL)을 처리하는 진입점.
    * 비즈니스 로직 처리 후, 뷰를 렌더링하기 위한 Tiles Definition 이름(예: `"index"`, `"member.info"`, `"admin.log"`)을 반환.
* **Layout JSP (`/layouts/*.jsp`)**:
    * [cite_start]`main.jsp` [cite: 5][cite_start], `member.jsp` [cite: 1][cite_start], `admin.jsp` [cite: 2][cite_start], `layout.jsp` [cite: 3] 등 페이지의 전체적인 골격을 정의하는 파일.
    * `<tiles:insertAttribute>` 태그를 사용하여 메뉴, 본문 등 동적으로 변경될 영역을 지정함.
* **Fragment JSP (`/inc/*.jsp` or `/views/**/*.jsp`)**:
    * [cite_start]`info.jsp` [cite: 4] 와 같이 레이아웃에 삽입될 개별 조각 페이지들. 실제 콘텐츠를 담고 있음.
* **`tiles.xml` (가상)**:
    * **(※ 프로젝트에 실제 파일은 없지만 핵심 설정 파일)**
    * Controller가 반환하는 Definition 이름과 실제 JSP 템플릿 및 조각 페이지들을 매핑하는 규칙을 정의함.

## 🛠 기술 스택 (Tech Stack)

* **Language**: Java
* **Framework**: Spring MVC
* [cite_start]**View Technology**: JSP, JSTL [cite: 1][cite_start], Apache Tiles [cite: 1, 2, 3, 5, 6]
* **Build Tool**: Maven/Gradle (추정)
* **Server**: Apache Tomcat (추정)
