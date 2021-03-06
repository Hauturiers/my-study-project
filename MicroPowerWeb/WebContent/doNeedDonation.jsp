<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.share.*" import="com.login.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微助力-发起项目-求助捐赠</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all">
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style-item.css" rel="stylesheet" media="all" />
<link href="css/head.css" rel="stylesheet" media="all" />
<link type="text/css" rel="stylesheet" href="css/calendar.css">
<script type="text/javascript" src="js/calendar.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/calendar-zh.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/calendar-setup.js"
	charset="UTF-8"></script>
<script src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/micropower.js"></script>
<script type="text/javascript" src="js/select.js"></script>
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
		if (user == null) {
			UserDao userDao = new UserDao();
			boolean isLogin = false;
			String cell_phone_num = "";
			Cookie[] myCookie = request.getCookies();//创建一个Cookie对象数组
			if (myCookie != null)
				for (int i = 0; i < myCookie.length; i++) {//设立一个循环，来访问Cookie对象数组的每一个元素
					Cookie newCookie = myCookie[i];
					if (newCookie.getName().equals("username")) {//判断元素的值是否为username中的
						isLogin = true;
						cell_phone_num = newCookie.getValue();
						user = userDao.login(cell_phone_num);
					}
				}
		}
	%>
	<!--header-->
	<!--header-->
	<div class="header-top">
		<!--container-->
		<div class="container">
			<div class="top-nav">
				<div class="logo">
					<a href="index.jsp"> <img src="images/index/logo.png"
						class="img-responsive" alt="" /></a>
				</div>
				<ul id="nav">
					<li><a href="showBetterProjects.jsp">浏览项目</a></li>
					<li><a href="initProject.jsp">发起项目</a></li>
					<li><a href="appLoad.jsp">APP下载</a></li>
					<li><a href="footHelp.jsp">帮助中心</a></li>
					<%
						if (user != null) {
					%>
					<li id="imgHead"><img class="img-circle"
						src="<%=user.getHead_portrait()%>" alt="" width="50px"
						height="50px">
						<ul id="nav-little">
							<li><a href="myProjects.jsp">我的项目</a></li>
							<li><a href="myWallet.jsp">我的钱包</a></li>
							<li><a href="setting.jsp">个人设置</a></li>
							<li><a href="login.jsp">退出</a></li>
						</ul></li>
					<%
						} else {
					%>
					<li><a href="login.jsp">登录</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	<!--item start here-->
	<div class="item">
		<h2>求助捐赠</h2>
		<form class="form-horizontal publishForm" name="publishForm"
			method="post" id="publishForm" action="DonationInfoServlet"
			enctype="multipart/form-data" onSubmit="return check1()">
			<div id="baseform" class="form-container">
				<div class="form-group form-group-lg">
					<label for="" class="col-md-1 control-label">捐赠标题</label>
					<div class="col-md-9">
						<div class="input-group">
							<input type="text" name="donation_title" id="raiseGoods"
								data-money="" value="" class="form-control	text_validata"
								placeholder="填写捐赠标题">
						</div>
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="" class="col-md-1 control-label">回报金额</label>
					<div class="col-md-9">
						<div class="input-group">
							<input type="text" pattern="[0-9]*" name="donation_trans_cost"
								class="form-control	text_validata" maxlength="3"
								placeholder="对于物品的给予回报多少？" onKeyDown="onlyNum()">
						</div>
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="raisefundsNumber" class="col-md-1 control-label">物品分类</label>
					<div class="col-md-9 wjz-slider-row">
						<div class="clearfix"></div>
						<div class="wjz-slider clearfix">
							<select name="donation_raise_goods" id="dayslider">
								<option value="衣物" selected="selected">衣物</option>
								<option value="玩具">玩具</option>
								<option value="书">书</option>
								<option value="包">包</option>
								<option value="其他">其他</option>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="" class="col-md-1 control-label">截止时间</label>
					<div class="col-md-9">
						<div class="input-group">
							<input type="text" id="EntTime" name="donation_close_date"
								class="form-control	text_validata"
								onclick="return showCalendar('EntTime', 'y-mm-dd');">
						</div>
					</div>
				</div>

				<div class="form-group form-group-lg">
					<div class="col-md-12">
						<textarea cols="85" rows="10" name="donation_describe"
							placeholder="建议详细描述受助人的基本情况：如家庭背景、经济状况、患病经历等。"></textarea>
						<div class="form-item help-block" style="border-bottom: none;">
							项目内容和项目图片禁止透露任何 <strong class="text-danger">联系方式</strong>和<strong
								class="text-danger">银行卡</strong> 等收款款息,包括但不限于手机号码、座机号码、<br />
							微信号、支付宝账号、银行卡号等。违反以上规定，项目验证和提现申请均不予通过。
						</div>
					</div>
				</div>
				<div class="form-group form-group-lg">
					<div class="col-md-11">
						<div id="reviewuploader" class="wjz-uploader clearfix">
							<div class="uploader-list main-images-list"></div>
							<div class="webPicPicker webuploader-container">
								<div id="reviewPicker"
									class="webuploader-pick webuploader-pick-hover">
									<div class="user-avatar" id="addImgShowOne">
										<div class="user-avatar">
											<img id="showImgOne" alt="" src="images/do/addImg.png">
										</div>
										<div class="changeHead">
											<input type="file" accept="image/jpeg,image/png,image/bmp"
												name="fileupload" onChange="doAddImgOne()" id="addImgOne">
										</div>
									</div>
									<div class="user-avatar" id="addImgShowTwo">
										<div class="user-avatar">
											<img id="showImgTwo" alt="" src="images/do/addImg.png">
										</div>
										<div class="changeHead">
											<input type="file" accept="image/jpeg,image/png,image/bmp"
												name="fileupload" onChange="doAddImgTwo()" id="addImgTwo">
										</div>
									</div>
									<div class="user-avatar" id="addImgShowThree">
										<div class="user-avatar">
											<img id="showImgThree" alt="" src="images/do/addImg.png">
										</div>
										<div class="changeHead">
											<input type="file" accept="image/jpeg,image/png,image/bmp"
												name="fileupload" onChange="doAddImgThree()"
												id="addImgThree">
										</div>
									</div>
									<div class="user-avatar" id="addImgShowFour">
										<div class="user-avatar">
											<img id="showImgFour" alt="" src="images/do/addImg.png">
										</div>
										<div class="changeHead">
											<input type="file" accept="image/jpeg,image/png,image/bmp"
												name="fileupload" onChange="doAddImgFour()" id="addImgFour">
										</div>
									</div>
									<div class="user-avatar" id="addImgShowFive">
										<div class="user-avatar">
											<img id="showImgFive" alt="" src="images/do/addImg.png">
										</div>
										<div class="changeHead">
											<input type="file" accept="image/jpeg,image/png,image/bmp"
												name="fileupload" onChange="doAddImgFive()" id="addImgFive">
										</div>
									</div>
									<div class="user-avatar" id="addImgShowSix">
										<div class="user-avatar">
											<img id="showImgSix" alt="" src="images/do/addImg.png">
										</div>
										<div class="changeHead">
											<input type="file" accept="image/jpeg,image/png,image/bmp"
												name="fileupload" onChange="doAddImgSix()" id="addImgSix">
										</div>
									</div>
									<div class="user-avatar" id="addImgShowSeven">
										<div class="user-avatar">
											<img id="showImgSeven" alt="" src="images/do/addImg.png">
										</div>
										<div class="changeHead">
											<input type="file" accept="image/jpeg,image/png,image/bmp"
												name="fileupload" onChange="doAddImgSeven()"
												id="addImgSeven">
										</div>
									</div>
									<div class="user-avatar" id="addImgShowEight">
										<div class="user-avatar">
											<img id="showImgEight" alt="" src="images/do/addImg.png">
										</div>
										<div class="changeHead">
											<input type="file" accept="image/jpeg,image/png,image/bmp"
												name="fileupload" onChange="doAddImgEight()"
												id="addImgEight">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="help-block">
							微爱通道发起的医疗救助项目，建议上传患者治疗中的照片、患者患病前后生活照对比、医院诊断证明<br /> 等照片，提高项目可信度。
						</div>
					</div>
				</div>
			</div>
			<div class="form-group form-group-lg">
				<div class="col-md-12 text-center">
					<input type="hidden" value="2" name="donation_select_need_or_dona" />
					<input type="submit" class="btn btn-primary btn-lg large"
						value="发布项目">
					<p class="user-agreement">
						<input type="radio" id="agree" checked="checked" /> <span>已阅读并同意<a
							href="javascript:show()" class="text-success" data-toggle="modal"
							data-target="#publish-agreement">《微捐助项目发起条款》</a></span>
					</p>
				</div>
			</div>
		</form>
	</div>
	<div id="hidebg"></div>
	<div class="hidebox" id="hidebox">
		<div id="agreementtitle" class="agreementtitle">
			<h3>微捐助项目发起条款</h3>
		</div>
		<div class="publish-agreement" id="agreement">
			<p>
				感谢您阅读“微捐助·社交版”平台《用户注册协议》（下称“本协议”）并使用“微捐助·社交版”平台（下称“平台”）提供的各项服务。您在申请注册成为平台用户之前，应当认真阅读本协议。<strong>且您务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款、法律适用和争议解决条款。免除或者限制责任的条款将以粗体标识，您应重点阅读。</strong>如您对协议有任何疑问，可向平台客服咨询。
			</p>
			<p>用户在仔细阅读并同意所有服务条款完成注册程序后，即时成为平台的正式用户。本注册协议自用户注册成功之日起，在用户与平台之间发生法律效力。</p>
			<h5>一、平台的简介</h5>
			<p>“微捐助·社交版”平台通过网站、微信等，为有众筹需求的自然人、法人及其他组织提供信息发布、需求对接、协助资金划转等相关信息服务。</p>
			<h5>二、账户的使用</h5>
			<p>您有权使用您设置或确认的平台用户名、手机号码（以下简称“账户名称”）及您设置的密码（账户名称及密码合称“账户”）登录平台，并在登陆后对账户信息进行修改（手机号码除外）。</p>
			<p>
				由于用户账户关联用户信用信息，用户未经平台同意不得自行转让账户。您的账户未经平台同意进行转让的，该账户项下产生的权利义务内容视为账户关联用户自行操作并已认可。<strong>由此产生的一切责任均由账户关联用户自行承担。</strong>
			</p>
			<p>作为平台的经营者，法律并未赋予平台强制要求所有用户进行实名认证的权利，但为使您更好地了解平台展示的项目信息，并享受平台提供的各项服务，平台建议您按照平台要求及我国法律规定完成实名认证。</p>
			<h5>三、注册信息的管理</h5>
			<p>
				（一）用户需向平台提供您的身份信息（包括但不限于您的姓名、关联银行卡号、电子邮件地址、联系电话、联系地址等）以及财产、收入证明，并保证信息的真实性、完整性、及时性。<strong>因信息不真实、不完整或信息变更后未及时通知平台，导致的一切后果，用户应自行承担责任。</strong>
			</p>
			<p>
				( 二 )您的账户由您自行设置并保管，平台任何时候均不会主动要求您提供您的账户信息。请您务必保管好您的账户，<strong><u>因您主动泄露或遭受他人攻击、诈骗等行为导致的损失及后果，均由您自行承担。</u></strong>
			</p>
			<h5>四、平台的权利与义务</h5>
			<p>
				（一）平台有权自己或委托第三方对用户进行实名认证和资格审核，并对用户信息的真实性进行必要的形式审查。<strong>平台有权拒绝不符合法律法规及平台要求的用户进行注册或取消已注册用户的用户资格。</strong>
			</p>
			<p>
				( 二 ）平台有权使用用户资料并承诺对用户信息采取对外保密措施，不向任何第三方披露用户资料，不授权第三方使用用户资料，<strong>除非：</strong>
			</p>
			<p>
				<strong>1.依据法律法规的规定应当提供。</strong>
			</p>
			<p>
				<strong>2.行政、司法机关要求平台提供。</strong>
			</p>
			<p>
				<strong>3.用户授权平台向第三方提供。</strong>
			</p>
			<p>
				<strong>4.用户在平台上完成相关项目投资后需向项目方提供相关信息。</strong>
			</p>
			<p>
				<strong>5.用户在发布信息时透露相关信息。</strong>
			</p>
			<p>
				（三）<strong>在用户违反国家、地方法律法规规定或违反平台相关规则及要求的情况下，平台拥有包括但不限于随时中止、终止对用户提供部分或全部服务并停用其用户帐号的权利。</strong>在该情况下，平台对由此产生的损失不承担任何责任。
			</p>
			<h5>五、用户权利和义务</h5>
			<p>（一）用户声明并承诺其为具有完全民事行为能力的自然人，或为依据中国法律设立并有效存续的公司或企业或其他形式的组织，具有一切必要的权利和能力订立、履行本协议下的任何义务和责任。</p>
			<p>（二）用户有权拥有自己在平台的用户名和密码并有权使用自己的用户名和密码随时登录平台。用户在其权限内有权进行发布信息、对接需求、资金划转等平台提供的相关服务。</p>
			<p>
				（三）用户保证其使用平台提供的服务时将遵守国家、地方法律法规、遵从行业惯例和社会公共道德。用户在注册成功后，不会采用任何方式存储、发布、传播损害国家、社会公共利益和涉及国家安全的信息资料或言论，不得发起、参与任何洗钱类项目。<strong>因用户上述行为给平台造成损失的，用户应予赔偿。</strong>
			</p>
			<p>
				(四）对于用户通过平台发布的涉嫌违法或涉嫌侵犯他人合法权利或违反本协议的信息或资料，平台有权依据其独立判断对该信息或资料予以修改、编辑、删除，而无需事先通知该用户。<strong>用户应独立承担由此造成的一切损失和法律责任，并应确保平台免于承担因此产生的任何损失或费用。</strong>
			</p>
			<p>
				（五）<strong>用户确认并同意，您应自行承担您在使用本平台服务期间通过本平台及本平台关联账户划拨划转的款项，在服务过程中的任何货币贬值、汇率波动及收益损失等风险。您仅在该划拨划转款项（不含被冻结、止付或受限制的款项）的金额范围内享有对该划拨划转款项指令支付、提现的权利。您对所有划拨划转款项（含被冻结、止付或受限制的款项）产生的任何收益（包括但不限于利息和其他孳息）不享有任何权利。本平台就所有该划拨划转款项产生的任何收益（包括但不限利息和其他于孳息）享有所有权。</strong>
			</p>
			<p>
				（六）<strong>用户承诺并保证其在平台上浏览、发布、参与项目的决定是依据自身判断所作出的独立、审慎的决定，因其使用平台服务产生的风险由其自行承担，并保证依法、依协议的约定履行其相应的义务。</strong>
			</p>
			<p>
				（七）<strong>因互联网自身属性原因，用户承诺并保证其使用轻松筹平台服务的风险由其自身承诺，其下载或通过轻松筹平台服务取得的信息和资料，由其自身承担系统受损、资料和信息丢失以及其他相关风险。</strong>
			</p>
			<h5>六、平台的通知</h5>
			<p>用户同意平台会根据用户提供的基础信息以及在平台的投资经历发送以下通知：</p>
			<p>1.公示的文案；</p>
			<p>2.站内信、微信端推送的消息；</p>
			<p>3.根据您预留于平台的联系方式发出的电子邮件、短信、函件等。</p>
			<h5>七、隐私声明</h5>
			<p>本平台重视对用户隐私的保护。关于您的身份信息和其他特定资料，将依据本平台的《隐私政策》进行保护和规范，详情请参阅《隐私政策》。</p>
			<h5>八、其他</h5>
			<p>
				用户通过第三方平台的接口注册并登陆平台的，在接受本协议的同时，还要遵守第三方平台的相关要求。<strong>因第三方平台导致用户相应损失的，本平台不承担任何责任。</strong>
			</p>
			<h5>九、协议的修改</h5>
			<p>
				为更好的为用户提供服务，本平台保留在任何时间自行修改、增删本平台法律文书中任何内容的权利。平台在修改相关内容后，会及时在平台上进行公告。<strong>在公告发布后，用户每次登录或使用本平台时均视为同意接受当时有效协议的制约。</strong>
			</p>
			<h5>十、本协议的终止</h5>
			<p>（一）如出现以下情形之一的，用户有权终止本协议：</p>
			<p>1.本平台相关协议及服务条款变更，变更事项生效前您停止使用并明示不愿接受变更事项的；</p>
			<p>2.您明示不愿继续使用平台服务，且符合平台终止条件的。</p>
			<p>（二）如出现以下情形之一的，平台有权解除本协议：</p>
			<p>1.用户违反本协议相关约定，平台依据协议约定终止本协议的；</p>
			<p>2.用户参与涉赌、涉黄、套现、洗钱、诈骗及其他违法违规活动；</p>
			<p>3.用户未通过网站提供真实有效的联系方式，且平台在5个工作日内无法联系到该用户；</p>
			<p>4.用户损害平台名誉，散播不利于平台的言论，或对其他客户、项目方和银行做出不诚实或欺骗的行为；</p>
			<p>5.平台收到行政、司法等权力机关出具的要求终止用户资格的书面通知。</p>
			<p>
				<strong>十一、不可抗力及免责条款</strong>
			</p>
			<p>
				<strong>（一）由于发生地震、台风、水灾、火灾等人力不能预见、不能避免、不能克服的不可抗力事件，致使协议无法履行或不能按约定履行，遭遇不可抗力的一方应于不可抗力发生之日起3个工作日内以书面形式通知对方，并于发生后10个工作日内出具有关部门的证明文件。因不可抗力造成的损失，双方互不承担责任。不可抗力事由消失后双方应在合理期限内协商是否继续履行协议。</strong>
			</p>
			<p>
				<strong>（二）由于计算机和互联网的特殊性，平台服务过程中可能出现技术性中断、服务延时及安全性问题等(包括但不限于平台系统崩溃或无法正常使用、电信设备故障、网络故障、电力中断、恶意攻击、计算机病毒)。平台用户应了解该类风险内容，若用户因此无法使用平台部分或全部服务的或对用户造成损失的，平台不承担任何责任。</strong>
			</p>
			<p>
				<strong>（三）平台需要定期或不定期地进行停机维护，平台会在维护前24小时内以平台公告形式及时通知用户，维护期间用户将无法使用部分或全部平台服务，因此对用户造成的损失，平台不承担任何责任。</strong>
			</p>
			<h5>十二、管辖</h5>
			<p>若本协议履行过程中发生争议，双方本着公平公正的态度友好协商解决。协商不成时，任何一方均可向平台所在地人民法院提起诉讼。</p>
			<p>本协议的每条规定均拟定为可分割的，本协议任何部分的无效或违法都不应影响本协议其余部分的效力或合法性。</p>
		</div>
		<div class="hidebutton" id="hidebutton">
			<input type="button" value="已阅读并同意" onClick="hide()">
		</div>
	</div>
	<!--item end here-->
	<!--footer start here-->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 ftr-grd">
				<h3>信息</h3>
				<p>江西师范大学软件学院14移动班</p>
				<!-- <ul class="ftr-icons">
                	<li><a href="#"><span class="cr-fa"> </span></a></li>
                </ul>-->
			</div>
			<div class="col-md-3 ftr-grd">
				<h3>关于微捐助</h3>
				<ul class="ftr-links">
					<li><a href="footAbout.jsp">微捐助介绍</a></li>
					<li><a href="footConnect.jsp">联系我们</a></li>
					<li><a href="footJoin.jsp">加入我们</a></li>
				</ul>
			</div>
			<div class="col-md-3 ftr-grd">
				<h3>用户服务</h3>
				<ul class="ftr-categ">
					<li><a href="footHelp.jsp">帮助中心</a></li>
					<li><a href="footTerms.jsp">使用条款</a></li>
					<li><a href="footPrivacy.jsp">隐私政策</a></li>
				</ul>
			</div>
			<div class="col-md-3 ftr-grd">
				<h3>关注我们</h3>
				<ul class="ftr-categ">
					<li><a
						href="http://weibo.com/weikirin?topnav=1&wvr=6&topsug=1">新浪微博</a></li>
					<li><a href="footMedia.jsp">媒体报道</a></li>
				</ul>
			</div>
			<div class="col-md-3 ftr-grd">
				<div class="col-md-6 ftr-gd4-1 text-center">
					<img src="images/index/foot1.png" alt="" class="img-responsive">下载APP
				</div>
				<div class="col-md-6 ftr-gd4-1 text-center">
					<img src="images/index/foot2.png" alt="" class="img-responsive">微信公众号
				</div>
			</div>
		</div>
	</div>
	<!--footer end here-->
	<!--copyright start here-->
	<div class="copyright">
		<div class="container">
			<div class="copy-main">
				<p>
					Copyright &copy; 2016微捐赠 - 江西师范大学 <a href="#"> <img
						src="images/index/copyright.png" alt="" class="img-responsive"></a>
				</p>
			</div>
			<script type="text/javascript">
				$(document).ready(function() {
					$().UItoTop({
						easingType : 'easeOutQuart'
					});
				});
			</script>
			<a href="#" id="toTop" style="display: block;"><span
				id="toTopHover" style="opacity: 1;"></span></a>
		</div>
	</div>
</body>
</html>