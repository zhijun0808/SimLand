<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	
	<!-- Product1Page 产品明细页面 start  -->
	<div data-role="page" id="CommodityPage">
		<div data-role="header" class="header_1"  data-tap-toggle="false" data-position="fixed">
			<a  data-transition="slide" href="#" data-role="button" data-rel="back"
				class="back" data-icon="arrow-l">&nbsp;</a>
			<h1>宝贝明细</h1>
		</div>
		<!-- /header -->
		<div data-role="content">
			<div class="wrapper top">
				<div class="scroller">
				
					<div class="commodityBx">
							
							
						<div class="wrapperRow c_height">
							<div class="scrollerRow c_height">
								<div class="slide">
									<img alt="" src="${pageContext.request.contextPath}/${commodity.img}">
								</div>
								<c:forEach items="${commodity.inventoryMap}" var="item">
									<div class="slide">
										<img src="${pageContext.request.contextPath}/${item.value[2]}">
									</div>
									
								</c:forEach>						
							</div>
						</div>			
			
						<div class="c_title">
							<div class="t1">
								<span>${commodity.name}</span>
							</div>
							<div class="t2">
								<span class="s1"></span>
								<span class="s2"></span>
							</div>
						</div>
						
						<div class="clear"></div>
			
						<div class="tags" data-role="controlgroup" data-type="horizontal" data-mini="true">
							<a  class="a1 on" data-transition="none" href="#" data-role="button">产品详情</a> 
							<a  class="a2" data-transition="none" href="#" data-role="button">产品评价</a>
						</div>
						<div class="c_infoBox">
							<div class="c_infoBox_tag on">
								${commodity.commodityDetails.info}
							</div>
							<div class="c_infoBox_tag">
								<div class="p_appraisal_line">
									<b>很好</b>
									<p>颜色分类：深紫色</p>
									<p>
										叶****2<span class="time">2015-06-03</span>
									</p>
								</div>
								<div class="p_appraisal_line">
									<b>很好</b>
									<p>颜色分类：深紫色</p>
									<p>
										叶****2<span class="time">2015-06-03</span>
									</p>
								</div>
								<div class="p_appraisal_line">
									<b>很好</b>
									<p>颜色分类：深紫色</p>
									<p>
										叶****2<span class="time">2015-06-03</span>
									</p>
								</div>
								<div class="p_appraisal_line">
									<b>很好</b>
									<p>颜色分类：深紫色</p>
									<p>
										叶****2<span class="time">2015-06-03</span>
									</p>
								</div>
							</div>
							
						</div>
						<div class="menu_height"></div>
						<div class="bottom_height"></div>
					
					</div>
				</div>
		
			</div>
		</div>
		
		
		<div data-role="footer" data-tap-toggle="false" data-position="fixed"
			data-theme="d" style="border-top:none;">

			<div class="btn">
				<a  class="a1" id="addCartBtn" data-transition="pop" href="#addCartPopup" data-rel="popup" data-position-to="window">加入进货单</a> 
				<a  class="a2" id="goBuyBtn" data-transition="pop" href="#addCartPopup" data-rel="popup" data-position-to="window">直接购买</a>
			</div>
			
			<div data-role="navbar" class="myfooter bgEDEDED">
				<ul>
					<li><a  data-transition="none" href="${pageContext.request.contextPath}/main" class="ui-icon-index_1 ui-btn-active1">首页</a></li>
					<li><a  data-transition="none" href="${pageContext.request.contextPath}/map/map1Page" class="ui-icon-map_1">地图</a></li>
					<li><a  data-transition="none" href="${pageContext.request.contextPath}/buy/cart" class="ui-icon-purchase_1">进货单</a></li>
					<li><a  data-transition="none" href="${pageContext.request.contextPath}/user/userCenter" class="ui-icon-my_1">我的</a></li>
				</ul>
			</div>
			
		</div>
		
		
			<div id="addCartPopup" data-role="popup" class="popupBox">
				<a href="#" data-rel="back" data-role="button" data-theme="a" data-transition="slideup" data-icon="delete" data-iconpos="notext" class="ui-btn-right"> Close</a>
				<div class="popup">
					<form action="${pageContext.request.contextPath}/buy/addCart" class="cartForm" method="post" data-transition="slideup">
						<input type="hidden" name="_stype" value="ajax"/>
						<div class="box">
							<div class="img">
								<img alt="" src="${pageContext.request.contextPath}/${commodity.img}">
							</div>
							<div class="info inventoryShowBox">
							
								<span class="s1">￥<span class="price">${commodity.marketPrice}</span></span>
								<span class="s2">库存 <strong class="inventoryNum"></strong> 件</span>
								<span class="s3">已选 <span class="attr1ValShow">请选择</span> <span class="attr2ValShow"></span></span>
								<input type="hidden" value="${commodity.id}" name="cid"/>
								<input type="hidden" value="" id="buyTypeHid"/>
								<input type="hidden" class="attr1Val" name="attr1Val" tit="${commodity.attr1.name}" value=""/>
								<input type="hidden" class="attr2Val" name="attr2Val" tit="${commodity.attr2.name}" value=""/>

							</div>
						</div>
						<div class="line"></div>
						<c:if test="${fn:length(commodity.attr1List)>0}">
						<div class="box">
							<span class="title">${commodity.attr1.name}</span>
							<div class="attr1">
								<c:forEach items="${commodity.attr1List}" var="item" varStatus="status">
									<a class="choseAttr1" aid="${item[0]}" href="#">${item[1]}</a>
								</c:forEach>
							</div>
						</div>
						<div class="line"></div>
						</c:if>
						
						<c:if test="${fn:length(commodity.attr2List)>0}">
						<div class="box">
							<span class="title">${commodity.attr2.name}</span>
							<div class="attr2">
								<c:forEach items="${commodity.attr2List}" var="item" varStatus="status">
									<a class="choseAttr2" aid="${item[0]}" href="#">${item[1]}</a>
								</c:forEach>
							</div>
						</div>
						<div class="line"></div>
						</c:if>
						
						<div class="box">
							<span class="title inline">购买数量</span>
							<div class="number inventoryShowBox">
							
								<!-- 库存信息 -->
								<c:forEach items="${commodity.inventoryMap}" var="item">
									<input type="hidden" value="${item.value[0]}" price="${item.value[1]}" img="${item.value[2]}" name="${item.key}"/>
									<c:set var="inventoryNum" value="${inventoryNum+item.value[0]}"/>
								</c:forEach>
								
								<input type="hidden" value="${inventoryNum}" id="inventoryNum">
							
								<a href="#" class="a1 revNum"></a>
								<input name="buyNum" class="input buyNum" type="number" data-role="none" value="1"/>
								<a href="#" class="a2 addNum"></a>
							</div>
						</div>
						<div class="line"></div>
						<div class="buyBtn">
							<a id="confirmOrderBtn" class="a1" href="#">确定</a>
						</div>
				
					</form>

				</div>
			</div>		
		
			<c:import url="../user/loginPopup.jsp"/>
	</div>
	<!-- Product1Page end  -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/iscroll/iscroll.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/simland/base.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/simland/app.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/simland/cart.js"></script>

</body>
</html>