<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Instagram</title>

<!-- css -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/joinagree.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script type="text/javascript" src="resources/js/member/joinagree.js"></script>

<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">
		<style>
		
	</style>

</head>

<body>
	<!-- main container -->
	<div class="container">

		<!-- contents-agree -->
		<div id="content-agree" class="col-lg-4" style="top:70px;">

			<!-- agree panel -->
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<div style="text-align: center; margin-bottom:5px; font-size:18px">
						이용 약관에 동의
					</div>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div style=" text-align: center; margin-bottom:10px; font-size:16px">
							Artistar는 회원님의 개인 정보를
							안전하게 보호합니다.<br>
							새 계정을 만들려면 모든 약관에
							동의해주세요.
						</div>
						<div class="checkbox_group">
							<div style=" text-align: left;">
								<label for=" agreeAll" style=" margin-right: 90px; font-size:13px">이용약관
									3개에 모두 동의</label>
								<input type="checkbox" id="agreeAll" style="zoom:2.0;  position: relative;
								top: 2.5px;">
							</div>

							<hr style="margin: 0 auto; height:3px;border:none;background-color:lightgrey">

							<div style=" text-align: left;">
								<label for=" agree1" style=" margin-right: 60px; font-size:13px">이용 약관(필수)</label>
								<a id="agreeMore1" class="moreBtn" style="margin-right: 20px; font-size:12px">더 알아보기</a>
								<input type="checkbox" id="agree1" class="agree" style="zoom:2.0;  position: relative;
								top: 2.8px;">
							</div>
							<div style=" text-align: left;">
								<label for=" agree2" style="  margin-right: 47px;   font-size:13px">데이터
									정책(필수)</label>
								<a id="agreeMore2" class="moreBtn" style="margin-right: 20px; font-size:12px">더 알아보기</a>
								<input type="checkbox" id="agree2" class="agree" style="zoom:2.0;  position: relative;
								top: 2.8px;">
							</div>
							<div style=" text-align: left;">
								<label for=" agree3" style=" margin-right: 31px; font-size:13px">위치 기반
									기능(필수)</label>
								<a id="agreeMore3" class="moreBtn" style="margin-right: 20px; font-size:12px">더 알아보기</a>
								<input type="checkbox" id="agree3" class="agree" style="zoom:2.0;  position: relative;
								top: 2.8px;">
							</div>
						</div>
						<a id="nextBtn" class="btn btn-primary input-block-level form-control"
							style="  margin-top:25px; padding: 6px 0; line-height: 1.5;">다음</a>
						<div style=" text-align: center; margin-top:15px; font-size:14px">
							<a href="javascript:history.back();">돌아가기</a>
						</div>

					</div>
				</div>
			</div>
			<!-- /agree panel -->

			<!-- tologin panel -->
			<div class="panel panel-default" style="margin-top: 20px;">
				<div class="panel-body" style="padding: 20px;text-align: center;">
					<p style="margin: 0;">계정이 있으신가요? <a href="${pageContext.request.contextPath}/">로그인</a>
					</p>
				</div>
			</div>
			<!-- /tologin panel -->


			<!-- appdown panel -->
			<div class="app-download">
				<p>앱을 다운로드 하세요.</p>
				<img src="${pageContext.request.contextPath}/resources/image/member/login/main_apple.png" alt="" height="40px;">
				<img src="${pageContext.request.contextPath}/resources/image/member/login/main_android.png" alt="" height="40px;">
			</div>
			<!-- /appdown panel -->

		</div>
		<!-- contents-agree -->
	</div>

	<!-- footer -->
	<div class="row" style="margin: 180px 0 20px;">
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
		<div id="copyright" class="col-lg-2 col-md-3 col-md-offset-1 text-center">
			<div class="copyright">
				© 2021 INSTAGRAM
			</div>
		</div>
	</div>
	<!-- /footer -->
	
	<!-- The Modal -->
	<div id="agreeModal1" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<h3 style="	margin: 17px 380px 15px  ; font-size: 18px; font-weight: bold; letter-spacing: 1px;">이용약관
				</h3>
				<span class="close">&times;</span>
			</div>
			<div class="modal-body" style="word-break: break-all; line-height: 1.6;">
				<p style="font-weight: bold; ">
					당사는 귀하에게 Artistar 서비스를 제공하는 것에 동의합니다. 서비스에는 당사가 Artistar의 사명을 실현하기 위해 제공하는 모든 Artistar 제품, 기능, 앱,
					서비스, 기술 및 소프트웨어가 포함됩니다. 귀하가 관심 있는 사람들과 항목을 더 가까이 접할 수 있도록 당사의 서비스는 다음과 같은 요소로 구성됩니다.</p><br>
				<p style="font-weight: bold; ">• 창작, 연결, 커뮤니케이션, 발견 및 공유를 위한 맞춤화된 기회를 제공합니다.</p>
				&nbsp;&nbsp;사람들은 다양합니다. 당사는 귀하가 실제로 관심을 가지는 경험을 공유함으로써 관계를 강화하길 원합니다. 따라서 당사는 귀하 및 다른 사람들이 관심 있는 사람과 사항을
				파악하는 시스템을 구축하고 파악한 정보를 이용하여 귀하가 중요한 경험을 창작하고, 발견하며, 동참하고, 공유하도록 합니다.
				그 일환으로, 귀하 및 다른 사람들이 Artistar 안팎에서 하는 활동에 기초하여 귀하가 관심을 가질 만한 콘텐츠, 기능, 제안 및 계정을 더 잘 보여드리고, 귀하에게
				Artistar을 경험하는 방법을 제안하기도 합니다.<br><br>
				<p style="font-weight: bold;">• 긍정적이고 포괄적이며 안전한 환경을 조성합니다.</p>
				&nbsp;&nbsp;당사는 당사 커뮤니티 회원들이 도움을 필요로 한다고 생각하는 경우를 포함하여 회원들의 경험을 긍정적이고 폭넓게 만들도록 도구를 개발하고 사용하고, 자원을 제공합니다.
				또한 당사는 당사 약관 및 정책의 남용 및 위반을 포함하여 유해하고 사기적인 행위를 방지하기 위한 팀과 시스템을 갖추고 있습니다. 당사는 당사 플랫폼의 보안을 유지하기 위해 당사가 보유한
				모든 정보(귀하의 정보 포함)를 이용합니다.<br><br>
				<p style="font-weight: bold;">• 성장하고 있는 당사 커뮤니티에 지속적으로 서비스를 제공하는 데 도움이 되는 기술을 개발하고
					사용합니다.
				</p>&nbsp;&nbsp;성장하고 있는 당사 커뮤니티를 위해 정보를 구성하고 분석하는 것이 당사 서비스의 핵심입니다. 당사 서비스에서 큰 부분을 차지하는 것은 광범위한 글로벌
				커뮤니티를 위하여 엄청나게 큰 규모로 당사 서비스를 맞춤화하고, 보호하며, 향상시키는 데 도움이 되는 첨단 기술을 개발하고 사용하는 것입니다. 인공 지능 및 머신 러닝과 같은 기술은
				당사가 당사 서비스 전체에 복잡한 프로세스를 적용할 수 있게 합니다. 자동화 기술 또한 당사 서비스의 기능성과
				무결성 보장에 기여합니다.<br><br>
				<p style="font-weight: bold; ">• 귀하가 관심 있는 방식으로 귀하와 브랜드, 제품 및 서비스를 연결합니다.</p>
				&nbsp;&nbsp;당사는 귀하에게 의미 있다고 생각되는 광고, 제안 및 기타 홍보 콘텐츠를 보여드리기 위해 Artistar 외에도 제삼자의 정보를 이용합니다. 그리고 귀하의
				Artistar에서의 경험과 콘텐츠를 연관시키려
				노력합니다.<br><br>

			</div>
		</div>
	</div>

	<!-- The Modal -->
	<div id="agreeModal2" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<h3 style="margin: 17px 370px 15px  ; font-size: 18px; font-weight: bold; letter-spacing: 1px;">데이터 정책
				</h3>
				<span class="close">&times;</span>
			</div>
			<div class="modal-body" style="word-break: break-all; line-height: 1.6;">
				<p style="font-weight: bold;">• 회원님이 제공하는 정보 및 콘텐츠.</p>
				&nbsp;&nbsp;당사는 회원님이 Artistar 서비스를 이용(계정 가입, 콘텐츠 작성 또는 공유, 다른 사람들과의 메시지 전송 또는 커뮤니케이션 포함)할 때 제공하는
				콘텐츠, 커뮤니케이션 및 기타 정보를 수집합니다. 여기에는 사진 촬영 장소나 파일 생성 날짜와 같이 회원님이 제공한 콘텐츠에 포함되거나 관련된 정보(메타데이터 등)가 포함될 수 있습니다.
				또한 여기에는 카메라와 같이 저희가 제공하는 기능을 통해 표시되는 내용도 포함되므로, 회원님이 좋아할 만한 마스크와 필터를 제안하거나, 카메라 형식 사용에 관한 팁을 제공할 수도
				있습니다.
				Artistar 시스템은 아래에 명시된 목적을 위해 회원님과 다른 사람들이 제공한 콘텐츠 및 커뮤니케이션을 자동으로 처리하여, 배경과 그 내용을 분석합니다. 회원님이공유한 항목을
				볼 수 있는 사람을 관리하는 방법에 대해 자세히 알아보세요.<br><br>

				<p style="font-weight: bold; ">• 네트워크 및 연결. </p>
				&nbsp;&nbsp;당사는 회원님과 연결된 사람, 페이지, 계정, 해시태그및 그룹(예를 들어 Artistar 제품에서 회원님이 가장 많이 연락하는 사람이나
				회원님이 속한 그룹)에 대한 정보 및 이들과 연락하는 방식에 대한 정보를 수집합니다.<br><br>

				<p style="font-weight: bold;">• 회원님의 이용. </p>
				&nbsp;&nbsp;당사는 회원님이 보거나 참여하는 콘텐츠의 유형, 사용하는 기능, 수행하는 행동, 교류하는 사람 또는 계정, 활동 시간, 빈도 및 기간 등
				회원님이 Artistar 서비스를 이용하는 방법에 대한 정보를 수집합니다. 또한 당사는 회원님이 카메라와 같은 기능들을 사용하는 방법에 대한 정보도 수집합니다.<br><br>

				<p style="font-weight: bold;"" >• 다른 사람의 활동 및 다른 사람이 회원님에 관해 제공한 정보. </p>
				&nbsp;&nbsp;당사는 다른 사람이 Artistar 서비스를 이용할 때 그들이 제공하는 콘텐츠, 커뮤니케이션
				및 정보를
				수집하고
				분석합니다. 여기에는 다른 사람이 언제 회원님의 사진을 공유하거나 회원님의 사진에 댓글을 남기는지, 언제 회원님에게 메시지를 보내는지, 언제 회원님의 연락처 정보를 업로드, 동기화
				또는 가져오는지 등과 같은 회원님에 관한 정보가 포함될 수 있습니다.<br><br>
				<p style=" font-weight: bold; ">• 측정, 분석 및 기타 비즈니스 서비스 제공.</p>
				&nbsp;&nbsp;당사는 보유한 정보를 이용하여 광고주 및 파트너가 광고 및 서비스의 성과와 배포를 측정하고 해당 서비스를 사용하는 사람들의 유형 및 사람들이 웹사이트, 앱,
				서비스와 상호 작용하는 방식을 파악할 수 있도록 지원합니다.<br><br>
				<p style=" font-weight: bold; ">• 안전, 진실성 및 보안 강화.</p>
				&nbsp;&nbsp;당사는 보유한 정보를 이용하여 계정 및 활동을 확인하고, 유해 행위를 방지하며, 스팸 및 기타 부정적인 경험을 감지 및 방지하고, 제품의 무결성을 유지하며,
				Artistar 서비스
				안팎의 안전 및 보안을 강화합니다.<br><br>
				<p style=" font-weight: bold; ">• 회원님과의 커뮤니케이션.</p>
				&nbsp;&nbsp;당사는 보유한 데이터를 이용하여 회원님에게 마케팅 자료를 제공하고 Artistar 서비스에 관해 커뮤니케이션하며, Artistar 정책 및 약관에 대한 내용을 알려
				드립니다. 또한
				당사는 회원님의 정보를 이용하여 회원님의 연락에 대응합니다.<br><br>
				<p style=" font-weight: bold; ">• 사회적 공익 연구 및 혁신.</p>
				&nbsp;&nbsp;당사는 보유한 정보(당사와 협업하는 연구 파트너의 정보 포함)를 이용하여 일반 사회 복지, 기술 발전, 공익, 보건 및 복지에 관한 주제의연구와 혁신을 진행하며,
				이를 지원합니다.
			</div>
		</div>
	</div>

	<!-- The Modal -->
	<div id=" agreeModal3" class="modal">
					<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<h3 style="margin: 17px 360px 15px  ; font-size: 18px; font-weight: bold; letter-spacing: 1px;">
							위치 기반 기능</h3>
						<span class="close">&times;</span>
					</div>
					<div class="modal-body" style="word-break: break-all; line-height: 1.6;">
						<p style="font-weight: bold; ">1. 위치 기반 서비스</p>
						&nbsp;&nbsp;Artistar은 회원님께 맞춤화된 콘텐츠와 정보를 제공하고, 회원님이 다른 사람에게 현재 위치와 방문한 위치를 알릴 수 있도록 하며, 측정, 분석,
						기타 비즈니스
						서비스를 제공하고,
						안전 및 보안을 도모하며, 사회적 공익을 위하여 연구를 수행하고 혁신을 이루며, Artistar 제품을 개선하기 위해 회원님의 위치 정보를 사용할 수 있습니다. 회원님이
						사용하는 제품에
						따라 Artistar이 제공하는 위치 기반 서비스는 다음과 같습니다.<br>

						• 회원님의 위치를 기반으로 콘텐츠를 제시하는 서비스 및 이를 기반으로 하는 기타 앱 서비스<br>
						• 회원님이 위치를 찾을 수 있도록 하는 서비스 및 이를 기반으로 하는 기타 앱 서비스<br>
						• 근처의 사람, 장소를 감지하여 이와 상호작용 할 수 있도록 하는 서비스 및 이를 기반으로 하는 기타 앱 서비스<br>
						• 알림, 메시지, 기타 콘텐츠 알림을 설정할 수 있도록 하는 서비스 및 이를 기반으로 하는 기타 앱
						서비스<br><br>

						<p style="font-weight: bold; ">2. 위치 기반 서비스 요금</p>
						&nbsp;&nbsp;Artistar은 위치 기반 서비스에 대한 요금을 사용자에게 부과하지 않습니다. 그러나 회원님이 위치 기반 서비스를 사용할 때 데이터 요금이 발생할 수
						있습니다.<br><br>

						<p style="font-weight: bold; ">3. 회원님의 권리</p>
						&nbsp;&nbsp;Artistar은 Artistar의 데이터 정책에 따라 회원님의 위치 정보를 수집, 이용, 공유합니다. 회원님은 모바일 기기의 위치 서비스 설정을 통해
						기기가
						Artistar 제품에
						정확한 위치 정보를 공유할지 여부를 관리할 수 있습니다. 위치 서비스 설정이 해제되어 있는 경우 Artistar은 체크인, 이벤트, IP 주소 등을 활용하여 회원님의 위치를
						추정할 수
						있습니다. 또한 회원님은 위치 기록을 설정 또는 해제할 수 있으며, 이는 Artistar이 회원님 기기의 위치 서비스를 통해 수신한 정확한 위치의 이력을 기록하도록 하는
						Artistar
						설정입니다.
						&nbsp;&nbsp;회원님은 사용 중인 Artistar 제품이 제공하는 설정을 통해 특정 또는 일반 위치 정보가 포함된 게시물 등 회원님의 게시물을 볼 수 있는 사람을
						항상 관리할 수
						있습니다.또한 Artistar 제품의 개인정보보호에 대해서는 여기에서 자세히 알아볼 수 있습니다.
						Artistar은 위치정보의 보호 및 이용 등에 관한 법률 또는 기타 관련 법령에 따른 경우를 제외하고는 회원님의 동의 없이 회원님의 위치 정보를 제3자에게 제공하지
						않습니다. 회원님은
						제3자에게 제공된 위치 정보의 제공 근거 및 내용을 Artistar에 문의할 수 있으며, 회원님의 위치 정보에 오류가 있는 경우 Artistar에 정정을 요구할 수
						있습니다.<br><br>

						<p style="font-weight: bold; ">4. 손해 배상</p>
						&nbsp;&nbsp;위치정보의 보호 및 이용 등에 관한 법률은 법률에 의해 요구되는 범위 내에서 위치 정보와 관련된 분쟁에 적용됩니다. 그 외의 청구 또는 분쟁에는
						Artistar 서비스 약관 또는 관련 Artistar 제품 약관이 적용됩니다.
					</div>
				</div>
			</div>

</body>

</html>