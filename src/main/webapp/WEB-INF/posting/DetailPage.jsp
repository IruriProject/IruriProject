<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
	<c:set var="root" value="<%=request.getContextPath() %>"/>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	 <link href="${root }/css/postingDetailStyles.css" rel="stylesheet" />
 <style>
    body {
      position: relative;
    }

    .nav-color {
      background-color: #e3f2c9;
      color: #4e9f3d;
      border-radius: 5px;
    }

    .nav-color:hover {
      background-color: white;
      color: #4e9f3d;
      text-decoration: none;
    }

    .navbar-nav .nav-link.active,
    .navbar-nav .show > .nav-link,
    .nav-item.active {
      background-color: #4e9f3d;
      color: white;
      border-radius: 5px;
    }

    .nav-item {
      width: 180px;
      text-align: center;
      font-size: 1.5em;
      font-weight: 600;
      padding-right: 20px;
    }
  </style>
</head>
<body>
    <!-- Page content-->
    <div class="mt-5">
      <div class="row">
        <div>
          <!-- Post content-->
          <article>
            <!-- Post header-->
            <header class="mb-4">
              <!-- Post title-->
              <h1 class="fw-bolder mb-1" style="color: #41644a">공고 제목</h1>
              <!-- Post meta content-->
              <div class="text-muted fst-italic mb-2">
                Posted on January 1, 2023 by Start Bootstrap
              </div>
            </header>
            <!-- Preview image figure-->
            <div
              class="scroll mb-4"
              data-bs-spy="scroll"
              data-bs-target=".navbar"
              data-bs-offset="50"
            >
              <nav class="navbar navbar-expand-sm nav-bg">
                <div class="container-fluid justify-content-center">
                  <ul class="navbar-nav">
                    <li class="nav-item">
                      <a class="nav-link nav-color" href="#section1"
                        >모집조건</a
                      >
                    </li>
                    <li class="nav-item">
                      <a class="nav-link nav-color" href="#section2"
                        >상세내용</a
                      >
                    </li>
                    <li class="nav-item">
                      <a class="nav-link nav-color" href="#section3"
                        >기업정보</a
                      >
                    </li>
                  </ul>
                </div>
              </nav>

              <div id="section1" class="container-fluid" style="padding: 20px">
                <h1>모집조건</h1>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
              </div>

              <div id="section2" class="container-fluid" style="padding: 20px">
                <h1>상세내용</h1>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
              </div>

              <div id="section3" class="container-fluid" style="padding: 20px">
                <h1>기업정보</h1>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
                <p>
                  Try to scroll this section and look at the navigation bar
                  while scrolling! Try to scroll this section and look at the
                  navigation bar while scrolling!
                </p>
              </div>
            </div>
            <!-- Post content-->
            <section class="mb-5">
              <p class="fs-5 mb-4">
                Science is an enterprise that should be cherished as an activity
                of the free human mind. Because it transforms who we are, how we
                live, and it gives us an understanding of our place in the
                universe.
              </p>
              <p class="fs-5 mb-4">
                The universe is large and old, and the ingredients for life as
                we know it are everywhere, so there's no reason to think that
                Earth would be unique in that regard. Whether of not the life
                became intelligent is a different question, and we'll see if we
                find that.
              </p>
              <p class="fs-5 mb-4">
                If you get asteroids about a kilometer in size, those are large
                enough and carry enough energy into our system to disrupt
                transportation, communication, the food chains, and that can be
                a really bad day on Earth.
              </p>
              <h2 class="fw-bolder mb-4 mt-5">
                I have odd cosmic thoughts every day
              </h2>
              <p class="fs-5 mb-4">
                For me, the most fascinating interface is Twitter. I have odd
                cosmic thoughts every day and I realized I could hold them to
                myself or share them with people who might be interested.
              </p>
              <p class="fs-5 mb-4">
                Venus has a runaway greenhouse effect. I kind of want to know
                what happened there because we're twirling knobs here on Earth
                without knowing the consequences of it. Mars once had running
                water. It's bone dry today. Something bad happened there as
                well.
              </p>
            </section>
          </article>
        </div>
      </div>
    </div>
  </body>
</html>