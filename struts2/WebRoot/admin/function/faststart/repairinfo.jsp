<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>

	<head>
	<title><s:property value="getSystemValue('sitename')" />    机动车维修业务结算明细表</title>
		<meta charset="utf-8">
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<style>
		table {
			border-collapse: collapse;
			border-spacing: 0;
			font-size: 12px;
		}
		
		th,td {
			border: 1px solid #000;
		}
		
		th {
			font-weight: bold;
		}
		</style>
		<SCRIPT type="text/javascript">
		var t;
		var dataList= new Array();
		</SCRIPT>
	</head>

	<s:set name="repair" value="RepairByNum(value2)" />
	<s:set name="car" value="CarById(#repair.carid)" />
	<s:set name="cf" value="CashFlowByNum(value2)" />
	<s:set name="cfi" value="CashFlowIstrueByNum(value2)" />
	<body style="width:80%;text-align: center; font-family: 'microsoft yahei'; margin-bottom: 50px">
		<div style="width: 100%; text-align: right;">
			<a href="javascript:window.print();">打印</a> &nbsp;&nbsp;&nbsp;
			<a href="javascript:printout();">导出</a> &nbsp;&nbsp;&nbsp;
			<s:if test='value3!="outwarelist"'>
				<s:if test="#cf.istrue==0">
					<a href="<%=path%>/admin.action?function=payarrears&value2=<s:property value="#cf.id"/>">结款</a>
				</s:if>

			</s:if>
		</div>
		<p style="margin: 0px;">
			<font size="5">机动车维修业务结算明细表</font>
		</p>
		<p style="margin: 0px;">
			车辆维修结算单
		</p>
		<p style="margin: 0px;">
			公司名称：青岛迅比迪汽车服务有限公司 
		</p>
		<p style="margin: 0px;">
			 电话：0532-67768266
		</p>
		<p style="margin: 0px;">
			编号：
			<s:property value="#repair.repairnum" />
			&nbsp;
			<s:if test="#repair.state==1">
			交车日期：<s:property value='DateFormat("yyyy年MM月dd日",#cf.time)' />
			</s:if>
			&nbsp; 单位：元
		</p>
		<table width="100%" style="margin-left:5%">
			<tr>
				<td width="10%">
					车牌号
				</td>
				<td width="15%">
					<s:property value="#car.carnum" />
				</td>
				<td width="5%">
					车型
				</td>
				<td width="10%">
					<s:property value="ModelsById(#car.model).name" />
				</td>
				<td width="7%">
					联系人
				</td>
				<td width="15%">
					<s:property value="#repair.contact" />
				</td>
				<td width="8%">
					送修日期
				</td>
				<td width="15%">
					<s:property value='DateFormat("yyyy-MM-dd",#repair.time)' />
				</td>
				<td width="15%" style="border: 0px">
					
				</td>
			</tr>
			<tr>
				<td>
					车架号
				</td>
				<td>
					<s:property value="#car.framenum" />
				</td>
				<td>
					维修类型
				</td>
				<td>

					<s:if test="#repair.type==0">
						维修
					</s:if>
					<s:if test="#repair.type==1">
						保养
					</s:if>
					<s:if test="#repair.type==2">
						其他
					</s:if>
					<s:if test="#repair.type==3">
						洗车
					</s:if>

				</td>
				<td>
					联系电话
				</td>
				<td>
					<s:property value="#repair.tel" />
				</td>
				<td>
					送修里程
				</td>
				<td>
					<s:property value="#repair.repairmileage" />
				</td>
			</tr>
			<tr>
				<td>
					客户名称
				</td>
				<td colspan="3">
					<s:property value="#repair.customer" />
				</td>
				<td>
					客户地址
				</td>
				<td colspan="3">
					<s:property value="#repair.address" />
				</td>
			</tr>
			<tr>
				<td colspan="7">
					维修项目
				</td>
				<td>
					工时金额
				</td>
			</tr>

			<s:set name="tcount" value="0" />
			<s:iterator value="ArtificialRepair(#repair.repairnum)" var="son" status="index">
				<tr>
					<td colspan="7">
						<s:property value="#son.repairtext" />
						<s:if test='value3!="outwarelist"'>
							<a style="margin-left: 40px" id=""
								href="javascript:deleterepairtext(<s:property value="#son.id" />);">删除</a>
						</s:if>
					</td>
					<td>
						<s:property value="#son.amount*#son.total" />
					</td>
				</tr>
				<s:set name="tcount" value="#son.amount*#son.total+#tcount" />
				<SCRIPT type="text/javascript">
					var i;
					var price="<s:property value="#cf.payment" />";
					if(price==0)
						i="现金";
					if(price==1)
						i="银行卡";
					if(price==2)
						i="会员卡";
					if(price==3)
						i="挂单";
					if(price==4)
						i="支付宝";
						
					t = new Array("<s:property value="#car.carnum" />","<s:property value="#car.framenum" />","<s:property value="ModelsById(#car.model).name" />","<s:property value="#repair.contact" />","<s:property value="#repair.tel" />","<s:property value="#repair.customer" />","<s:property value="#repair.address" />","<s:property value="#son.repairtext" />","<s:property value="#son.amount*#son.total" />",i);
					dataList[<s:property value="#index.index" />] = t;
				</SCRIPT>
				
				
			</s:iterator>

			<tr>
				<td colspan="7">
					维修价格合计
				</td>
				<td>
					<s:property value="#tcount" />
				</td>
			</tr>


			<tr>
				<td colspan="4">
					材料名称
				</td>
				<td>
					规格
				</td>
				<td>
					数量
				</td>
				<td>
					单价
				</td>
				<td>
					材料金额
				</td>
			</tr>
			<s:set name="count" value="0" />
			<s:iterator value="OutWareHouseRecord(#repair.repairnum)" var="son">
				<s:set name="product" value="WaresByNumber(#son.productnumber)" />
				<s:set name="rr" value="RepairRecordByWRId(#son.id)" />
				<tr>
					<td colspan="4">
						<s:property value="#product.name" />
						<s:if test='value3=="outwarelist"'>
							<a
								href="javascript:revoke('<s:property value="#rr.id" />','<s:property value="#son.id" />');">撤销出库</a>
						</s:if>
					</td>
					<td>
						<s:property value="#product.specifications" />
					</td>
					<td>
						<s:property value="#rr.amount" />
					</td>
					<td>
						<s:property value="#son.outprice" />
					</td>
					<td>
						<s:property value="#rr.amount*#son.outprice" />
					</td>
				</tr>
				<s:set name="count" value="#rr.amount*#son.outprice+#count" />
			</s:iterator>
			<tr>
				<td colspan="7">
					材料合计
				</td>
				<td>
					<s:property value="#count" />
				</td>
			</tr>
			<tr>
				<td>
					维修合计
				</td>
				<td>
					<s:property value="#count+#tcount" />
				</td>
				<td>
					人民币
					<br />
					大写
				</td>
				<td>
					<s:property value="NumToCN(#count+#tcount)" />
				</td>
				<td>
					付款方式
				</td>
				<td>

					<s:if test="#cf.paytype==0">
						现金
					</s:if>
					<s:if test="#cf.paytype==1">
						银行卡
					</s:if>
					<s:if test="#cf.paytype==2">
						会员卡
					</s:if>
					<s:if test="#cf.paytype==3">
						挂单
					</s:if>
					<s:if test="#cf.paytype==4">
						支付宝
					</s:if>

				</td>
				<td>
					实收金额
				</td>
				<td>
					<s:property value='#cf.reallytotal' />
				</td>
			</tr>

		</table>
		
		<p style="margin: 0px;">
			欢迎您下次光临！祝您一路平安！
		</p>
		<p style="margin: 0px;">
			操作员:
			<s:property value="#session.adminuser.name" />
			&nbsp;&nbsp;&nbsp;&nbsp;客户签名:
		</p>

		<s:if test='#repair.state!=1 && value3!="outwarelist"'>

			<br />
			<br />
		添加维修项目
		<br />
		维修项目：
		<input type="text" id="repairtext" style="width: 150px;" />
			<br />
		耗用工时：
		<input type="text" id="amount" style="width: 150px;" />
			<br />
		工时单价：
		<input type="text" id="tatol" style="width: 150px;" />
			<br />
		维修人员：
		<SELECT id="douser" style="width: 155px;">
				<s:iterator value="SelectAllAdminUser()" var="son">
					<option value="<s:property value="#son.username"/>">
						<s:property value="#son.name" />
					</option>
				</s:iterator>
			</SELECT>
			<br />

			<button onclick="addrepair();">
				添加维修项目
			</button>


			<br />
			<br />
		添加维修项目
		<br />
		付款方式：
		<SELECT id="paytype" style="width: 155px;" onchange="changepaytype();" onkeydown="changepaytype"
				onblur="changepaytype">

				<option value="0">
					现金
				</option>
				<option value="1">
					银行卡
				</option>
				<option value="2" <s:if test='value1!=null'>selected="selected"</s:if>>
					会员卡
				</option>
				<option value="3">
					挂单
				</option>
				<option value="4">
					支付宝
				</option>

			</SELECT>
			<br />
			<s:if test='value1!=null'>
		付款会员：
		<input type="text" value="<s:property value="VipByUserNum(value1).name"/>" readonly="readonly"
					style="width: 150px;">
				<input type="hidden" id="payuser" value="<s:property value="value1"/>">
				<br />
			</s:if>
		实付金额：
		<input type="text" id="reallytotal" style="width: 150px;">
			<br />
			<button onclick="pay();">
				结款
			</button>

	<SCRIPT type="text/javascript">
	
	
	
	
	function deleterepairtext(i){

		$.post("<%=path%>/admin.action?function=deleterepairtext&value1="+i,
					{},
					function(data){
					if(data=="\"Success\""){
						alert("删除成功！");
						location.reload();	
					}else{
						alert("系统错误！");
					}
				},"text");
	
	}
	
	
	
	function addrepair() {

		var repairtext = $("#repairtext").val();
		var amount = $("#amount").val();
		var tatol = $("#tatol").val();
		var douser = $("#douser").val();

		if (repairtext == "" || amount == "" || tatol == "") {
			alert("请完整填写表单");
			return;
		}
		var reg = /^[0-9]*$/;
		if (!reg.test(amount) || !reg.test(tatol)) {
			alert("工时和工时单价必须输入整数！");
			return;
		}

		if(window.confirm('维修项目：'+ repairtext +'，工时总金额：'+ parseInt(amount)*parseInt(tatol) +'元，请确认！')){
                 $.post("<%=path%>/admin.action?function=addartificialrepair",
					{"rr.repairnum":"<s:property value="#repair.repairnum" />","rr.repairtext":repairtext,"rr.amount":amount,"rr.total":tatol,"rr.douser":douser},
					function(data){
						alert(data);	
						location.reload();	
				},"text");
                 return true;
              }else{
                 alert("您已取消此项目的添加。");
                 return false;
             }
		

	}
	
	function changepaytype(){
		
		var paytype = $("#paytype").val();
		
		if(paytype==2)
			location.href="<%=path%>/admin/function/card.jsp?function=repairinfo&value2=<s:property value="#repair.repairnum" />";

	}
	
	function pay(){
	
		var reallytotal = $("#reallytotal").val();
		var paytype = $("#paytype").val();
		var payuser = $("#payuser").val();
		var douser = "<s:property value="#session.adminuser.username" />";

		if (paytype==2 && payuser == "") {
			alert("请重新刷卡");
			return;
		}
		if (reallytotal=="") {
			alert("实付金额必须输入整数！");
			return;
		}
		var reg = /^[0-9]*$/;
		if (!reg.test(reallytotal)) {
			alert("实付金额必须输入整数！");
			return;
		}
		
		if (paytype!=2) {
			payuser = "";
		}
	
		if(window.confirm('维修单号：'+ <s:property value="#repair.repairnum" /> +'，实付金额：'+ reallytotal +'元，请确认！')){
                 $.post("<%=path%>/admin.action?function=payrepairorder",
					{"cf.number":"<s:property value="#repair.repairnum" />",
					"cf.type":1,"cf.total":<s:property value="#count+#tcount" />,
					"cf.douser":douser,"cf.paytype":paytype,"cf.payuser":payuser,
					"cf.reallytotal":reallytotal},
					function(data){
						alert(data);	
						location.reload();	
						},"text");
		                 return true;
		              }else{
		                 alert("您已取消此项目的添加。");
		                 return false;
		             }
			}
			
		</SCRIPT>
	</s:if>
	
		
	<s:if test='value3=="outwarelist"'>
		<script type="text/javascript">

	function revoke(rrid,wrid){
			$.post("<%=path%>/admin.action?function=revokeoutware", {"value1" : rrid,"value2" : wrid}, 
			function(data) {
				alert(data);
			location.reload();
				}, "text");
			}
		</script>
		

	</s:if>
		<script type="text/javascript">
		function printout(){
		var title=$("title").text();
		var headers=new Array("车牌号","车架号","车型","联系人","联系电话","客户名称","客户地址","维修项目","工时金额","付款方式");
		var other=new Array("编号：<s:property value="#repair.repairnum" />","维修合计：<s:property value="#tcount" />",
	    "人民币大写：<s:property value="NumToCN(#count+#tcount)" />","维修合计：<s:property value='#cf.reallytotal' />").join(',');
		window.location.href="<%=path%>/exportExcel.action?p.title="+title+"&p.headers="+headers+"&p.other="+other+"&p.dataList="+dataList;
		}
		</script>
	</body>
</html>
