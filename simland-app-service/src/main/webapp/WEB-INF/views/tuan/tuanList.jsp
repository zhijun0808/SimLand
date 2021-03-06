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

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/iscroll/iscroll.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/simland/base.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/simland/app.js"></script>

</head>

<body>
	
	<!-- 团购列表页面 -->
	<div data-role="page" id="tuanListPage">
		
		<div data-role="header" class="header_1 bg41AC98" data-tap-toggle="false" data-position="fixed">
				<a  data-transition="slide" href="#" data-role="button" data-rel="back"
					class="bg41AC98 back" data-icon="arrow-l">&nbsp;</a>
				<h1 class="colorFFF">水贝团购</h1>			
		</div>
		
		
		<div data-role="content">
			<div class="top wrapper">
				<div class="scroller">
				
					<div class="nav">
						<a class="a1" href="#">全部分类<span class="s1"></span></a>
						<div class="right">
							<a class="a2" href="#">排序</a>
							<a class="a3" href="#">搜索</a>
						</div>
					</div>
				
					<div class="boxList">
						<c:import url="tuanListAjax.jsp"/>
					</div>
					<div class="line"></div>
					<div id="pullUp">&nbsp;</div>
				</div>
			</div>
		</div>
		<div data-role="footer" data-tap-toggle="false" data-position="fixed"
			data-theme="d">
			<c:import url="../footer.jsp"/>
		</div>	
		
	</div>



</body>
</html>