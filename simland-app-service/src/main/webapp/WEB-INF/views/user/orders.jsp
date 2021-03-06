<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<div data-role="page" id="myOrdersPage">
		<div data-role="header" class="header_1 bg41AC98">
			<a  data-transition="slide" href="#" data-role="button" data-rel="back"
				class="back bg41AC98" data-icon="arrow-l">&nbsp;</a>
			<h1 class="colorFFF">我的订单</h1>
		</div>
	
		<div data-role="content">

			<div class="wrapper top">
				<div class="scroller">
				
					<div class="orderBox">
					
						<c:forEach items="${list}" var="item">
							<div class="order">
								<div class="o_header">
									<a href="${pageContext.request.contextPath}/shop/showShop?id=${item.shop.id}" class="a1">
										<span class="s1"><img alt="" src="${pageContext.request.contextPath}/${item.shop.clogo}"></span>
										<span class="s2">${item.shop.cname}<span class="gt">&gt;</span></span>
										<span class="s3 red">${item.orderStatusName}</span>
									</a>
								</div>
								
								<c:forEach items="${item.orderItems}" var="item1">
									<div class="o_content">
										<a href="#" class="a2">
											<span class="s1"><img alt="" src="${pageContext.request.contextPath}/${item1.commodity.img}"></span>
											<span class="s2">${item1.cname}</span>
											<span class="s3">￥<fmt:formatNumber value="${item1.cprice}" pattern="#,#00.00#"/><br/>x${item1.buyNum}</span>
										</a>
									</div>
								</c:forEach>
								
								<div class="o_sum">
									<span>共${item.quantity}件商品，合计:<span class="red"><fmt:formatNumber value="${item.total}" pattern="#,#00.00#"/></span></span>
								</div>
								<div class="line"></div>
								<span class="o_option">
									<c:if test="${item.orderStatus==1}">
										<a class="a1" id="cancelOrderBtn" oid="${item.id}" href="#">取消订单</a>
										<a class="a1 bg41AC98 colorFFF" href="#">去付款</a>
									</c:if>
									<c:if test="${item.orderStatus==4}">
										<a class="a1" href="#">确认收货</a>
									</c:if>
									<c:if test="${item.orderStatus==5}">
										<a class="a2" href="${pageContext.request.contextPath}/commodity/assess">评价</a>
									</c:if>
									<c:if test="${item.orderStatus==6}">
										<a class="a1" href="#">删除订单</a>
									</c:if>
								</span>
							</div>
						</c:forEach>
						
						<c:if test="${fn:length(list) <= 0}">
							<br>
							<p>
								您还没有下过订单，<a href="${pageContext.request.contextPath}/shop/list">立即搜索</a>店铺购买商品
							</p>
						</c:if>
					</div>
				
				</div>
			</div>
		</div>		
		
		<div data-role="footer" data-tap-toggle="false" data-position="fixed" data-theme="d">
			<c:import url="../footer.jsp"/>
		</div>
	</div>


</body>
</html>