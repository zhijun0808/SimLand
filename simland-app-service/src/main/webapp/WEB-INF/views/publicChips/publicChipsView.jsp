<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<meta name="description" content="A single-page template generated by MyEclipse Mobile Tools" />
	<title>Single-Page Application</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mobile-1.4.3.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />

</head>

<body>
	
	<div data-role="page" id="publicChipsPage">
		<div data-role="header" class="header_1 bg41AC98">
			<a data-transition="slide" href="#" data-role="button" data-rel="back" class="back bg41AC98" data-icon="arrow-l">&nbsp;</a>
			<h1 class="colorFFF">水贝众筹</h1>
		</div>
		<div data-role="content">
			<div class="wrapper top">
				<div class="scroller">
					
					<div class="publicChips">
						<div class="topMenu">
							<ul>
								<li><a href="#">综合推荐</a></li>
								<li><a href="#">最新上线</a></li>
								<li><a href="#">最高金额</a></li>
								<li><a href="#">支持最多</a></li>
							</ul>
						</div>
						<div class="box1">
							<div class="img">
								<img alt="" src="${pageContext.request.contextPath}/images/tmp/publicChips_1_r2_c2.jpg" >
							</div>
							<div class="info">
								<div class="col">
									<strong class="s1">17%</strong>
									<span class="s2">已达到</span>
								</div>
								<div class="col">
									<strong class="s1">￥1703</strong>
									<span class="s2">已筹集</span>
								</div>
								<div class="col">
									<strong class="s1">44天</strong>
									<span class="s2">剩余时间</span>
								</div>
							</div>
						</div>
						<div class="box1">
							<div class="img">
								<img alt="" src="${pageContext.request.contextPath}/images/tmp/publicChips_1_r4_c2.jpg" >
							</div>
							<div class="info">
								<div class="col">
									<strong class="s1">17%</strong>
									<span class="s2">已达到</span>
								</div>
								<div class="col">
									<strong class="s1">￥1703</strong>
									<span class="s2">已筹集</span>
								</div>
								<div class="col">
									<strong class="s1">44天</strong>
									<span class="s2">剩余时间</span>
								</div>
							</div>
						</div>
						<div class="box1">
							<div class="img">
								<img alt="" src="${pageContext.request.contextPath}/images/tmp/publicChips_1_r2_c2.jpg" >
							</div>
							<div class="info">
								<div class="col">
									<strong class="s1">17%</strong>
									<span class="s2">已达到</span>
								</div>
								<div class="col">
									<strong class="s1">￥1703</strong>
									<span class="s2">已筹集</span>
								</div>
								<div class="col">
									<strong class="s1">44天</strong>
									<span class="s2">剩余时间</span>
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>	
		</div>
		<div data-role="footer" data-tap-toggle="false" data-cacheval="false" data-position="fixed" data-theme="d" style="border-top:none;">
			<c:import url="../footer.jsp"/>
		</div>
	</div>

</body>
</html>