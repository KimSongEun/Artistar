<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/insta-nav.css">
<link rel="stylesheet" href="../css/mypost.css">

</head>
<body>
	<div id="nprogress" style="display: none;"></div>

	<!-- navbar -->
	<nav class="nav-insta">
		<div class="nav-container">
			<div class="nav-logo">
				<div>
					<a href="picturelist.html" class="navbar-brand nav-fixed-1"></a> <a
						href="picturelist.html" class="navbar-brand nav-fixed-2"></a>
				</div>
			</div>
			<div class="nav-search">
				<div class="nav-control">
					<input type="text" class="form-control">
					<div class="placeholder">
						<i class="glyphicon glyphicon-search">검색</i>
					</div>
				</div>
			</div>
			<div class="nav-menu">
				<div class="nav-ico-group">
					<a href="javascript:fn_movePage('overview');"
						class="nav-icon nav-icon-overview"></a> <a
						href="javascript:fn_movePage('like');"
						class="nav-icon nav-icon-like"></a> <a
						href="javascript:fn_movePage('mypictures');"
						class="nav-icon nav-icon-mypictures"></a>
				</div>
			</div>
		</div>
	</nav>
	<!-- /navbar -->

	<div class="container">
		<div class="row" style="margin-top: 20px;">
			<div class="col-xs-3 col-xs-offset-1">
				<div id="profileImgs" class="text-center">
					<img id="one" src="../images/멍멍이.jpg" class="rounded" alt="...">
					<img id="one_2" src="../images/멍멍이.jpg" class="rounded" alt="..."
						style="display: none;">
				</div>
			</div>
			<!--col-xs-3-->
			<div class="col-xs-7 text-center">
				<h1 style="font-weight: lighter; display: inline-block;">Acorn</h1>
				<button onclick="fn_movePage('profile')"
					class="btn btn-default btn-xs"
					style="display: inline-block; margin-left: 20px; font-weight: bold; padding-left: 30px; padding-right: 30px; font-size: 15px; margin-top: -12px;">프로필편집</button>
				<span class="glyphicon glyphicon-cog"
					style="font-size: 23px; margin-left: 5px;"></span> <br />
				<div id="profileInfo">
					<div
						style="font-size: 17px; display: inline-block; margin-top: 15px">게시물
						24</div>
					<div id="three">팔로워 5K</div>
					<div id="three">팔로우 163</div>
				</div>
				<br />
				<div style="font-size: 20px; font-weight: bold; margin-top: 15px;">acorn
				</div>
			</div>
			<!--col-xs-9-->
		</div>
		<!-- pro-->

		<!-- 프로필 팔로우/팔로잉 수 -->
		<div class="row" id="profileInfo_2">
			<div class="col-xs-12"
				style="border-bottom: 1px solid #efefef; border-top: 1px solid #efefef;">
				<div class="col-xs-4 text-center" style="height: 60px;">
					<div style="margin-top: 10px;">게시물</div>
					<div>24</div>
				</div>
				<div class="col-xs-4 text-center">
					<div style="margin-top: 10px;">팔로워</div>
					<div>5k</div>
				</div>
				<div class="col-xs-4 text-center">
					<div style="margin-top: 10px;">팔로우</div>
					<div>24</div>
				</div>
			</div>
		</div>
		<!-- //프로필 팔로우/팔로잉 수 -->

		<!--  <div class="row"> 
    <div class="col-xs-12"> 
      <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#a">게시물</a></li>
        <li><a data-toggle="tab" href="#b">저장됨</a></li>
      </ul>
    </div>
  </div> -->


		<!--tab-->
		<div class="row" id="profileInfo_3" style="margin-top: 50px;">
			<div class="col-xs-12" style="border-top: 1px solid #efefef">
				<div class="col-xs-4" style="height: 52px;"></div>
				<div class="col-xs-1 text-center" id="post"
					style="border-top: 1px solid #000; cursor: pointer; padding: 0px;">

					<div class="active postFont"
						style="margin-top: 15px; font-size: 12px;">게시물</div>
				</div>
				<div class="col-xs-1"></div>
				<div class="col-xs-1 text-center" id="save"
					style="border-top: 1px solid #000; cursor: pointer; padding: 0px;">

					<div class="postFont" style="margin-top: 15px; font-size: 12px;">저장됨</div>
				</div>
				<div class="col-xs-1"></div>
				<div class="col-xs-4"></div>
			</div>
		</div>
		<!--tap-->

		<div class="row" id="profileInfo_4">
			<div class="col-xs-12" style="border-top: 1px solid #efefef">
				<div class="col-xs-6 text-center"
					style="height: 44px; cursor: pointer;" id="post2">
					<span class="glyphicon glyphicon-th glyColor"
						style="margin-top: 15px;"></span>
				</div>
				<div class="col-xs-6 text-center" id="save2">
					<span class="glyphicon glyphicon-bookmark glyColor"
						style="margin-top: 15px; cursor: pointer;"></span>
				</div>
			</div>
		</div>


		<div class="postContent">
			<div class="row">
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">2663개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">126개</span>
							</div>
						</div> <img class="img-responsive" src="../images/1.jpg" /></a>

				</div>
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">3563개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">56개</span>
							</div>
						</div> <img class="img-responsive" src="../images/2.jpg" /></a>

				</div>
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">5563개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">201개</span>
							</div>
						</div> <img class="img-responsive" src="../images/3.jpg" /></a>

				</div>
			</div>
			<br /> <br />

			<div class="row">
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">4285개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">321개</span>
							</div>
						</div> <img class="img-responsive" src="../images/4.jpg" /></a>

				</div>
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">5863개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">76개</span>
							</div>
						</div> <img class="img-responsive" src="../images/5.jpg" /></a>

				</div>
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">2853개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">45개</span>
							</div>
						</div> <img class="img-responsive" src="../images/7.jpg" /></a>

				</div>
			</div>
			<br /> <br />
			<div class="row">
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">5667개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">102개</span>
							</div>
						</div> <img class="img-responsive" src="../images/8.jpg" /></a>

				</div>
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">6657개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">267개</span>
							</div>
						</div> <img class="img-responsive" src="../images/9.jpg" /></a>

				</div>
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">2508개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">67개</span>
							</div>
						</div> <img class="img-responsive" src="../images/10.jpg" /></a>

				</div>
			</div>
			<br /> <br />
			<div class="row">
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">2885개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">62개</span>
							</div>
						</div> <img class="img-responsive" src="../images/11.jpg" /></a>

				</div>
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">1699개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">37개</span>
							</div>
						</div> <img class="img-responsive" src="../images/12.jpg" /></a>

				</div>
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">3886개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">157개</span>
							</div>
						</div> <img class="img-responsive" src="../images/13.jpg" /></a>

				</div>
			</div>
			<br /> <br />
			<div class="Hidden">
				<!--Hidden-->
				<div class="row">
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">2730개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">46개</span>
								</div>
							</div> <img class="img-responsive" src="../images/14.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">5656개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">197개</span>
								</div>
							</div> <img class="img-responsive" src="../images/15.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">5371개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">257개</span>
								</div>
							</div> <img class="img-responsive" src="../images/16.jpg" /></a>

					</div>
				</div>

				<br /> <br />

				<div class="row">
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">3127개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">102개</span>
								</div>
							</div> <img class="img-responsive" src="../images/17.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">1682개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">37개</span>
								</div>
							</div> <img class="img-responsive" src="../images/18.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">4651개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">231개</span>
								</div>
							</div> <img class="img-responsive" src="../images/16.jpg" /></a>

					</div>
				</div>

				<br /> <br />

				<div class="row">
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">3021개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">62개</span>
								</div>
							</div> <img class="img-responsive" src="../images/20.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">1658개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">51개</span>
								</div>
							</div> <img class="img-responsive" src="../images/21.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">2337개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">52개</span>
								</div>
							</div> <img class="img-responsive" src="../images/22.jpg" /></a>

					</div>
				</div>

				<br /> <br />

				<div class="row">
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">1693개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">32개</span>
								</div>
							</div> <img class="img-responsive" src="../images/23.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">3257개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">118개</span>
								</div>
							</div> <img class="img-responsive" src="../images/24.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">3886개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">157개</span>
								</div>
							</div> <img class="img-responsive" src="../images/25.jpg" /></a>

					</div>
				</div>
			</div>
			<!-- Hidden-->

			<div class="Hidden1">
				<!-- HIdden1-->
				<br /> <br />
				<div class="row">
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">4453개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">90개</span>
								</div>
							</div> <img class="img-responsive" src="../images/28.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">9623개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">116개</span>
								</div>
							</div> <img class="img-responsive" src="../images/29.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">5847개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">106개</span>
								</div>
							</div> <img class="img-responsive" src="../images/30.jpg" /></a>

					</div>
				</div>

				<br /> <br />

				<div class="row">
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">8543개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">156개</span>
								</div>
							</div> <img class="img-responsive" src="../images/31.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">4853개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">256개</span>
								</div>
							</div> <img class="img-responsive" src="../images/32.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">6524개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">76개</span>
								</div>
							</div> <img class="img-responsive" src="../images/33.jpg" /></a>

					</div>
				</div>

				<br /> <br />

				<div class="row">
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">5574개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">102개</span>
								</div>
							</div> <img class="img-responsive" src="../images/34.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">4485개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">96개</span>
								</div>
							</div> <img class="img-responsive" src="../images/35.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">3755개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">48개</span>
								</div>
							</div> <img class="img-responsive" src="../images/36.jpg" /></a>

					</div>
				</div>

				<br /> <br />

				<div class="row">
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">2285개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">43개</span>
								</div>
							</div> <img class="img-responsive" src="../images/37.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">1864개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">35개</span>
								</div>
							</div> <img class="img-responsive" src="../images/38.jpg" /></a>

					</div>
					<div class="col-xs-4 insList">
						<a href="#"><div class="box">
								<div class="likeBox">
									<span class="glyphicon glyphicon-heart"></span><span id="pfont">824개</span><span
										class="glyphicon glyphicon-pencil"></span><span id="pfont">16개</span>
								</div>
							</div> <img class="img-responsive" src="../images/39.jpg" /></a>

					</div>
				</div>
			</div>
			<!-- Hidden1-->
		</div>
		<!--Blocl-->



		<div class="saveContent" style="display: none;">
			<p
				style="margin-top: 32px; color: #999; font-size: 12px; font-weight: 400; margin-bottom: 16px; margin-left: 5px;">저장한
				내용은 회원님만 볼 수 있습니다.</p>
			<div class="row">
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">8449개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">58개</span>
							</div>
						</div> <img class="img-responsive" src="../images/26.jpg" /></a>

				</div>
				<div class="col-xs-4 insList">
					<a href="#"><div class="box">
							<div class="likeBox">
								<span class="glyphicon glyphicon-heart"></span><span id="pfont">6851개</span><span
									class="glyphicon glyphicon-pencil"></span><span id="pfont">126개</span>
							</div>
						</div> <img class="img-responsive" src="../images/27.jpg" /></a>

				</div>
			</div>
		</div>

		<!-- footer -->
		<div class="container">
			<div class="row" style="margin-top: 20px;">

				<div id="mainNav" class="col-lg-8 col-md-8 text-center">
					<div class="links">
						<li><a href="#">INSTAGRAM정보</a></li>
						<li><a href="#">지원</a></li>
						<li><a href="#">블로그</a></li>
						<li><a href="#">홍보 센터</a></li>
						<li><a href="#">API</a></li>
						<li><a href="#">채용정보</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">약관</a></li>
						<li><a href="#">디렉터리</a></li>
						<li><a href="#">언어</a></li>
					</div>
				</div>
				<div id="copyright"
					class="col-lg-2 col-md-3 col-md-offset-1 text-center">
					<div class="copyright">© 2017 INSTAGRAM</div>
				</div>
			</div>
		</div>
		<!-- /footer -->

		<div class="loader">
			<img src="../images/loader3.gif" alt="로딩 이미지">
		</div>

	</div>

	<script src="../js/jquery-3.2.1.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/mypost.js"></script>
</body>
</html>