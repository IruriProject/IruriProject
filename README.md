![header](https://capsule-render.vercel.app/api?type=transparent&color=auto&height=300&section=header&text=IRURI&fontSize=70&animation=fadeIn)

```
쌍용교육센터 파이널 프로젝트 3조 (삼삼오오) 
최보현(조장), 박예은, 박재승, 안정빈, 장환라
(2023.05.02 ~ 2023.05.26)
```
<br><br>

# content
1. 프로젝트 배경 및 목적
4. 역할 분담
3. 이용 api
2. 개발환경 및 협업 툴
3. ERD
5. 주요 기능

<br><br>

## 프로젝트 배경 및 목적
```
고령화라는 사회적 배경을 고려하여 
노인들도 쉽게 일자리 정보를 찾고 경력을 살릴 수 있는 기회를 제공하는 플랫폼인
이루리 프로젝트를 기획하게 되었습니다.
```
<br>
<img alt="image" src="https://github.com/IruriProject/IruriProject/assets/126458406/6f19a300-f30c-4e25-b907-1e9e6a1d7fde">

<br><br>

## 역할 분담
<table>
    <tr>
      <td align="center">
      <a href="https://github.com/lambdaramge">
      <img src="https://avatars.githubusercontent.com/u/126458406?v=4" width="140px" />
      <br/>최보현</a>
      </td>
      <td>
        - 회원가입 / 로그인 (카카오로그인) <br>
        - 이력서 지원 기능 <br>
        - 채용공고 검색페이지, 필터링 기능 <br>
        - 인재검색 페이지 <br>
        </td>
        <td align="center"> <a href="https://github.com/028902"><img src="https://avatars.githubusercontent.com/u/123163275?v=4" width="140px" /><br/> 박재승</a></td>
      <td>
        - 마이페이지 및 이력서 관리 기능 전반 <br>
        - 개인정보 수정, 회원 탈퇴 기능 <br>
        - 이력서 등록 페이지 <br>
        - 지원현황 확인 페이지 <br>
        </td>
    </tr>
    <tr>
      <td align="center"> <a href="https://github.com/silverstarlulu"><img src="https://avatars.githubusercontent.com/silverstarlulu?v=4" width="140px" /><br/>박예은</a></td>
      <td>
        - 기업페이지 및 기업관리 기능 전반 <br>
        - 공고 등록 및 공고 상세페이지 <br>
        - 사업자등록번호 기반 기업인증 기능 <br>
        - 쪽지 전송 및 확인 기능 <br>
      </td>
        <td align="center"> <a href="https://github.com/jungbee2"><img src="https://avatars.githubusercontent.com/u/8851063?v=4" width="140px" /><br/>안정빈</a></td>
      <td>
        - 메인페이지 및 로고 디자인 <br>
        - 메인페이지 내 전체검색 기능 <br>
        - 일자리이야기 커뮤니티 게시판 <br>
        - 1:1 문의 게시판 <br>
        - 관리자 페이지
        </td>
    </tr>
    <tr>
      <td align="center"> <a href="https://github.com/OrangeflavorFanta"><img src="https://avatars.githubusercontent.com/u/8851063?v=4" width="140px" /><br/>장환라</a></td>
        <td>
        - 맞춤일자리 페이지 <br>
        - 좋아요 및 스크랩 기능 <br>
        - 관심기업 및 스크랩 공고 관리 페이지 <br>
        </td>
    </tr>
</table>

<br><br>

## 이용 api
- 카카오 로그인
- 카카오 지도
- 카카오 주소
- 사업자등록번호
- 구글 차트
- mailsender

<br><br>

## 개발환경 및 협업 툴
<img alt="image" src="https://github.com/IruriProject/IruriProject/assets/126458406/36c96495-2de2-444a-99d5-94bccde628d9">

- 협업 툴: github, flow 사용, 요구사항 정의서 작성
<br><br>

## ERD
<img alt="image" src="https://github.com/IruriProject/IruriProject/assets/126458406/e908d2ef-9d9d-4d86-9428-ed245b75cbe9">

<br><br>

## 주요 기능

### 메인페이지


  |기능|설명|
  |-----|-----------------------------|
  |검색| - 공고명으로 검색시 해당하는 공고를 표출<br> - 자동검색 기능으로 입력한 단어와 일치하는 공고명을 나타냄<br>- 자동검색은 검색어 창에서 on/off 가능<br> - 검색결과 페이지에서는 검색어에 따른  최신순과 급여 높은 순으로 재정렬 가능|
  |메인 화면| - 최상단의 배너를 통해 다른 홈페이지로 이동할 수 있게 함 <br> - 인기공고, 최근공고, 일자리이야기의 게시글 일부를 보여줌 <br> - 인기공고는 조회수 순으로, 최근공고는 작성일 순으로 나열|

<br>

  <details>
  <summary>영상으로 보기</summary>
  <div markdown="1">       
  <img src="https://github.com/IruriProject/IruriProject/assets/126458406/15407df5-8fc7-4215-88c1-787588ec31b0" width="800" height="500"/>
  </div>
  </details>

<br><br>

### 회원가입 및 로그인
- 회원가입:  일반회원과 기업회원의 가입이 구분되어 진행

  |기능|설명|
  |-------|---------------------------|
  |가입조건| - 폼에 입력된 데이터와 db에 저장된 데이터를 비교하여 아이디의 중복 여부를 확인하고, 중복확인 버튼을 클릭해야만 회원가입이 가능함 (버튼 클릭 후 아이디 변경 시 버튼 다시 활성화) <br> - 아이디가 영문, 숫자로 이루어졌는지 확인하고 6~12자에 해당하지 않는 경우 가입이 불가능 <br> - 비밀번호는 두 번을 입력하고 둘이 일치하지 않으면 회원가입 진행이 불가 <br> - 핸드폰번호 입력 시 '-'를 포함한 특수문자가 입력되면 자동으로 삭제됨 <br> - 주소 api를 이용한 주소 입력 기능|

- 로그인

 |기능|설명|
  |-----|---------------------------|
  |일반로그인|- db에 저장된 아이디와 일치하는 경우 로그인 |
  |카카오로그인|- 최초 로그인 시 자동으로 회원가입 <br> - 저장된 개인정보가 없는 가입 직후 정보입력 폼으로 이동 |

<br><br>

### 일반회원 - 마이페이지
|기능|설명|
  |-----------|---------------------------|
  |마이페이지|- 개인정보 수정, 회원탈퇴가 가능 <br> - 개인정보 권한에 접근 시 비밀번호를 재확인하고, 일치하는 경우에만 접근을 허용  <br> - 지원현황을 확인하고 지원을 취소할 수 있음 <br> - 기업으로부터 받은 쪽지를 확인할 수 있음|
  |이력서 등록|- 근무 희망지역을 3개까지 선택하여 입력할 수 있음 <br> - 자기소개서의 1분 자동완성 옵션을 통해 성격, 경력사항, 지원동기에 해당하는 예시 문장을 제공하고 클릭 시 자동으로 입력되며 수정이 가능함 <br> - 저장 시 공개와 비공개 설정 가능
  |이력서관리|- 이력서는 5개까지 등록이 가능하며 초과 시 등록이 불가 <br> - 이력서는 공개/비공개 설정이 가능 <br> - 작성한 이력서 중 하나는 대표 이력서로 지정할 수 있고 대표 이력서로 지정한 이력서는 자동으로 공개 상태로 전환 |
  |좋아요 / 스크랩|- 공고 상세페이지에 나타난 기업 정보를 통해 좋아요를 할 수 있음 <br> - 마음에 드는 공고를 스크랩할 수 있음 <br> - 이미 db에 좋아요, 스크랩 여부가 저장된 경우 alert과 함께 좋아요, 스크랩이 해제됨 <br> - 마이페이지에서 위의 정보를 확인할 수 있음|

  <br>
[이력서 등록 페이지 예시]<br>

 <img src="https://github.com/IruriProject/IruriProject/assets/126458406/ed656520-2504-4802-8070-b667162e649d" width="800" height="500"/>

   <details>
  <summary>영상으로 보기</summary>
  <div markdown="1">       
  <img src="링크" width="800" height="500"/>
  </div>
  </details>

  <br><br>

### 맞춤일자리 페이지
|기능|설명|
|-------|---------------------------|
|검색|- 원하는 직무 카테고리를 checkbox로 선택하고 해당하는 직무에 대한 공고만 표출|

 <br><br>

### 기업회원 - 기업페이지
|기능|설명|
|-------|---------------------------|
|기업페이지|- 기업정보 수정, 회원 탈퇴가 가능 <br> - 일반회원에 보낸 쪽지, 게시한 공고를 확인할 수 있음|
|기업인증|- api를 이용해 사업자등록번호를 검색하고 일치하는 번호가 존재할 경우에 인증이 완료되도록 함 <br> - 인증 페이지 내에서도 사업자등록번호 수정이 가능|
|회원열람|- 본 기업을 관심기업으로 추가하거나 공고를 열람 / 스크랩한 회원의 이력서를 열람하고 쪽지를 보낼 수 있음|
|열람권|- 기업인증이 완료된 회원에 한해 열람권 신청이 가능 <Br> - 열람권 신청 여부를 검사하여 신청이 완료된 경우 취소 페이지가, 신청하지 않은 경우 신청 페이지가 나타남|
|인재검색|- 열람권 신청이 완료된 회원에 한해 인재검색이 가능 <br> - 개인회원이 작성한 공개 이력서 중 희망지역, 직무, 근무형태를 기준으로 검색하여 이력서를 열람할 수 있음|

  <br>
  [기업페이지 예시]
 <img src="https://github.com/IruriProject/IruriProject/assets/126458406/798f0ed8-64da-45ee-887c-1274d96e853e"/>
 
 <br>

### 기업회원 - 공고 등록
|기능|설명|
|-------|---------------------------|
|등록|- 기업인증이 완료된 기업에 한해 공고 등록이 가능|
|상태변경| - 공고 마감일을 지정하고 크론 표현식을 통해 작업 스크줄러 세팅<br>- 실시간으로 1분마다 시간을 체크하여 마감일이 되면 자동으로 지원이 마감되도록 지정 <br>- 마감일과 무관하게 수동으로 지원가능 / 지원마감 여부 변경 가능|
|끌어올리기|- 기존에 작성된 공고를 끌어올리면 현재 날짜를 기준으로 일주일 후로 지원 마감일이 변경됨|
|자주쓰는 문구|- 최대 5개의 자주쓰는 문구를 등록할 수 있음 <br> - 제공된 추천 문구를 이용하거나 직접 입력을 통해 문구를 등록할 수 있음 <br> - 공고 작성 시 등록된 문구를 선택해서 삽입 가능|
|임시저장|- 작성중인 글을 컬럼으로 구분하여 임시저장이 가능 <br> - 기존에 임시저장된 글이 있는 경우 공고 작성 페이지로 이동하면 임시저장한 글을 불러오도록 안내함|
|이전공고 불러오기|- 공고 작성 시 임시저장공고를 제외하고 직전에 작성한 공고가 존재하는 경우 동일한 내용을 불러올 수 있음|


  <br>
  [공고 마감 예시]
 <img src="https://github.com/IruriProject/IruriProject/assets/126458406/37ad18ca-cf27-4e48-bfc5-f3846a12f1ed"/>
  
  <br>

### 기업회원 - 쪽지 발송
|기능|설명|
|-------|---------------------------|
|쪽지 발송|- 제공되는 템플릿에 맞추어 기업 측에서만 개인 회원에게 쪽지를 발송할 수 있음|

  <br>
  [쪽지 발송 화면]
  <img src="https://github.com/IruriProject/IruriProject/assets/126458406/d19d5b5f-1d81-4699-bc3e-9f77c0459f30"/>
  
  <br>

### 채용정보 페이지
|기능|설명|
|-------|---------------------------|
|지역별 검색|- 좌측의 시,도를 클릭 시 우측에 해당하는 구,군명이 표출 <br> - 구, 군 클릭 시 그 지역에 해당하는 채용공고가 ajax로 나타남|
|검색어 검색| - 제목, 내용으로 검색 가능|
  <br>

[채용정보 페이지 지역별 검색 예시]
 <img src="https://github.com/IruriProject/IruriProject/assets/126458406/afa534c0-cb17-48d0-a4a9-6cbc7dc62528"/>

<br>

### 공고 상세페이지
|기능|설명|
|-------|---------------------------|
|열람|로그인한 회원이 공고를 열람한 경우 회원 정보를 저장함|
|위치정보|- 채용공고 하단에 기업이 위치한 곳의 주소와 함께 지도를 보여줌|
|지원자정보|- 구글 차트를 통해 현재까지 공고를 통해 지원한 지원자의 연령 및 성별 정보를 제공|
|지원하기|- 모달을 통해 현재까지 작성한 이력서를 기업에 전달할 수 있음 <br> - 작성된 이력서가 존재하지 않을 경우 이력서 작성 페이지로 이동|

  <br>
  [공고 상세페이지 예시]
 <img src="https://github.com/IruriProject/IruriProject/assets/126458406/61e0acf5-b258-4081-b05e-d8e5292dafcf"/>
 <img src="https://github.com/IruriProject/IruriProject/assets/126458406/970eb91c-4983-49f6-a517-d7551bd1cc5d"/>

  <br>

### 일자리이야기 페이지
|기능|설명|
|-------|---------------------------|
|작성|- 파일을 5개까지 첨부할 수 있고 초과 시 alert을 통해 알림|
|조회|- 검색을 통해 보여지는 게시글을 최신순, 오래된순, 조회순으로 정렬할 수 있음 <br> - 상세페이지에서 이전글, 다음글을 확인하고 이동할 수 있음 <br> - 댓글과 댓댓글이 가능하여 단계별로 댓글 작성 가능|
|공지|- 세션을 통해 관리자를 구분하고 관리자로 로그인 한 경우 공지사항을 게시할 수 있음 <br> - 관리자가 작성한 공지글은 상단에 별도로 표시됨|

<br><br>

### 1대1 문의 페이지
|기능|설명|
|-------|---------------------------|
|문의하기|- 첨부파일 선택 가능 <br> - 개인정보활용에 동의한 사용자만 문의 가능 <br> - 나의문의내역 에서 올린 문의글의 목록과 답변 여부를 확인 가능 <br>
|답변| - 관리자의 답변이 달릴 경우 답변 등록과 동시에 문의 시 입력한 이메일 주소로 답변완료 메일이 전송됨|

<br>
[1:1 문의 답변 완료 시 메일 예시]
 <img src="https://github.com/IruriProject/IruriProject/assets/126458406/fb5ec2db-5e3b-4837-92b6-e7aa1169d196"/>

<br>

### 관리자 - 회원관리 페이지
|기능|설명|
|-------|---------------------------|
|회원관리| - 개인, 기업명단 확인과 삭제 가능|

<br><br>

