package com.haojie.extend;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.SessionAware;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.junit.Test;

import com.haojie.impl.AdminImpl;
import com.haojie.impl.BuytypeImpl;
import com.haojie.impl.CarImpl;
import com.haojie.impl.CarWashImpl;
import com.haojie.impl.CashflowImpl;
import com.haojie.impl.FastCarListImpl;
import com.haojie.impl.FunctionImpl;
import com.haojie.impl.ModelsImpl;
import com.haojie.impl.OrderImpl;
import com.haojie.impl.PicImpl;
import com.haojie.impl.PowerImpl;
import com.haojie.impl.PurchaseImpl;
import com.haojie.impl.RepairImpl;
import com.haojie.impl.SuppliersImpl;
import com.haojie.impl.SystemValueImpl;
import com.haojie.impl.UserImpl;
import com.haojie.impl.WareImpl;
import com.haojie.pojo.Admin;
import com.haojie.pojo.AdminNav;
import com.haojie.pojo.Allot;
import com.haojie.pojo.Buytype;
import com.haojie.pojo.Car;
import com.haojie.pojo.CarWash;
import com.haojie.pojo.CarWashRecord;
import com.haojie.pojo.Cashflow;
import com.haojie.pojo.DatePojo;
import com.haojie.pojo.Department;
import com.haojie.pojo.FastCarList;
import com.haojie.pojo.FastCarRecord;
import com.haojie.pojo.Function;
import com.haojie.pojo.Models;
import com.haojie.pojo.Order;
import com.haojie.pojo.OrderList;
import com.haojie.pojo.OutWare;
import com.haojie.pojo.Power;
import com.haojie.pojo.PowerAss;
import com.haojie.pojo.PowerFuntion;
import com.haojie.pojo.Purchase;
import com.haojie.pojo.Repair;
import com.haojie.pojo.RepairRecord;
import com.haojie.pojo.ReturnedWare;
import com.haojie.pojo.Suppliers;
import com.haojie.pojo.SystemValue;
import com.haojie.pojo.User;
import com.haojie.pojo.WareHouse;
import com.haojie.pojo.WareRecord;
import com.haojie.pojo.Wares;
import com.haojie.utils.HttpRequest;
import com.haojie.utils.MD5Utils;
import com.haojie.utils.NumberToCN;
import com.haojie.utils.PageUtil;
import com.opensymphony.xwork2.ActionSupport;

public class AllFunction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;

	/**
	 * 
	 */
	private static final long serialVersionUID = -8201482453588372623L;

	private static SystemValue sv = null;

	private static String Success = "Success";
	private static String Fail = "Fail";

	public void setSystemValue(SystemValue sv) {
		this.sv = sv;
	}

	/**
	 * 通过KeyName查询系统变量Model
	 * 
	 * @param ValueName
	 */
	private void getSystemValueByValueName(String KeyName) {
		SystemValueImpl svi = new SystemValueImpl();
		SystemValue sv = new SystemValue();
		sv.setKeyname(KeyName);
		setSystemValue(svi.SelectValue(sv));
	}

	/**
	 * 通过KeyName查询系统变量值
	 * 
	 * @param KeyName
	 * @return
	 */
	public String getSystemValue(String KeyName) {
		if (sv == null || !sv.getKeyname().equals(KeyName))
			getSystemValueByValueName(KeyName);
		return sv.getVle();
	}

	/**
	 * 通过KeyName查询系统变量标记
	 * 
	 * @param KeyName
	 * @return
	 */
	public String getSystemRemark(String KeyName) {
		if (sv == null || !sv.getKeyname().equals(KeyName))
			getSystemValueByValueName(KeyName);
		return sv.getRemark();
	}

	/**
	 * 查询Admin系统菜单
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getMenu() {
		long startTime = System.currentTimeMillis();
		List<AdminNav> list = new ArrayList<AdminNav>();
		AdminImpl ai = new AdminImpl();

		list = ai.getAdminNav("");

		float seconds = (System.currentTimeMillis() - startTime) / 1000F;
		System.out.println("查询父类菜单耗时：" + Float.toString(seconds) + " 秒");

		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();

		for (AdminNav an : list) {
			long sonstartTime = System.currentTimeMillis();
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("id", an.getId());
			map.put("navname", an.getNavname());
			map.put("colid", an.getColid());
			map.put("vle", an.getVle());
			map.put("function", an.getFunction());
			map.put("power", an.getPower());
			map.put("son", ai.getAdminNav(an.getId() + ""));

			result.add(map);
			seconds = (System.currentTimeMillis() - sonstartTime) / 1000F;
			System.out.println(an.getNavname() + "		菜单耗时："
					+ Float.toString(seconds) + " 秒");
		}

		seconds = (System.currentTimeMillis() - startTime) / 1000F;
		System.out.println("查询后台菜单总耗时：" + Float.toString(seconds) + " 秒");

		return result;

	}

	/**
	 * 查询所有Admin用户
	 * 
	 * @return
	 */
	public List<Admin> SelectAllAdminUser() {
		long startTime = System.currentTimeMillis();
		List<Admin> list = new AdminImpl().SelectAllAadminUser();
		float seconds = (System.currentTimeMillis() - startTime) / 1000F;
		System.out.println("查询Admin用户列表总耗时：" + Float.toString(seconds) + " 秒");
		return list;
	}

	/**
	 * 根据权限组Id查权限组名称
	 * 
	 * @param id
	 * @return
	 */
	public String getPowerNameById(String id) {
		long startTime = System.currentTimeMillis();
		String result = new PowerImpl().getPowerNameById(id).getPower();
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询ID = " + id + "的权限用户耗时："
				+ Float.toString(seconds) + " 秒");
		return result;
	}

	/**
	 * 查询所有权限组
	 * 
	 * @return
	 */
	public List<Power> getAllPower() {

		long startTime = System.currentTimeMillis();
		List<Power> result = new PowerImpl().getAllPower();
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询所有权限组耗时：" + Float.toString(seconds) + " 秒");
		return result;

	}

	/**
	 * 根据admin的Id查询用户
	 * 
	 * @param id
	 * @return
	 */
	public Admin SelectAdminUserById(int id) {
		long startTime = System.currentTimeMillis();
		Admin aus = new AdminImpl().SelectAdminUserById(id);
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询ID为" + id + "的Admin用户耗时："
				+ Float.toString(seconds) + " 秒");
		return aus;
	}

	/**
	 * 随机重置密码 短信发送
	 * 
	 * @param id
	 */
	public int smsramdomresetpassword(int id) {
		long startTime = System.currentTimeMillis();
		String pw = getRom();
		AdminImpl ai = new AdminImpl();
		Admin aus = ai.SelectAdminUserById(id);
		aus.setPassword(MD5Utils.MD5(pw));
		int rs = ai.ResetPassword(aus);
		if (rs == 1)
			SendSMS(aus, pw);
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("随机密码重置总耗时：" + Float.toString(seconds) + " 秒");
		return rs;

	}

	/**
	 * 短信发送
	 */
	public void SendSMS(Admin admin, String pw) {
		long startTime = System.currentTimeMillis();
		String info = "Hello " + admin.getUsername()
				+ ",your password reset success,your password is " + pw;

		try {

			// 发送 POST 请求
			String sr = HttpRequest.sendPost(getSystemValue("smsaddress"),
					"user=" + getSystemValue("smsusername") + "&pwd="
							+ getSystemValue("smspassword") + "&contents="
							+ info + "&mobiles=" + admin.getTel()
							+ "&chid=0&sendtime=");
			SAXReader sax = new SAXReader();

			Document document = DocumentHelper.parseText(sr);

			Element root = document.getRootElement();// 根节点
			Element son = root.element("Result");
			System.out.println(son);
		} catch (DocumentException e) {
			throw new RuntimeException(e);
		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("发送重置密码短信耗时：" + Float.toString(seconds) + " 秒");
	}

	/**
	 * Admin 登陆
	 * 
	 * @param aus
	 * @return
	 */
	public Admin Login(Admin aus) {
		long startTime = System.currentTimeMillis();
		AdminImpl ai = new AdminImpl();
		aus.setPassword(MD5Utils.MD5(aus.getPassword()));
		Admin rs = ai.Login(aus);
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("Admin用户登录耗时：" + Float.toString(seconds) + " 秒");
		return rs;

	}

	/**
	 * ajax重置密码方式 用于json数据返回
	 * 
	 * @param session
	 * @param password
	 * @param newpassword
	 * @return
	 */
	public String AdminRePassWord(Map session, String password,
			String newpassword) {
		long startTime = System.currentTimeMillis();
		Admin aus = (Admin) session.get("adminuser");
		aus.setPassword(password);
		if (Login(aus) == null) {
			return "Password error";
		}
		AdminImpl ai = new AdminImpl();
		int rsi = ai.AdminRePassWord(aus.getUsername(), MD5Utils
				.MD5(newpassword));
		String rs = "";
		if (rsi == 1)
			rs = Success;
		else
			rs = Fail;
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("Admin修改密码总耗时：" + Float.toString(seconds) + " 秒");
		return rs;

	}

	/**
	 * 获取所有供应商列表
	 * 
	 * @return
	 */
	public List<Suppliers> AllSupplies() {
		long startTime = System.currentTimeMillis();

		SuppliersImpl si = new SuppliersImpl();
		List<Suppliers> rs = si.SelectAllSupplies();

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询所有供应商列表耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * HTML Alert提示
	 * 
	 * @param msg
	 * @return
	 */
	public String Alert(String msg) {
		return "alert(\"" + msg + "\");";
	}

	/**
	 * 根据名字查询供应商
	 * 
	 * @param name
	 * @return
	 */
	public Suppliers SelectSuppliersByName(String name) {

		long startTime = System.currentTimeMillis();

		SuppliersImpl si = new SuppliersImpl();
		Suppliers rs = si.SelectSuppliersByName(name);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询Name = " + name + " 的供应商总耗时："
				+ Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 添加新的供应商
	 * 
	 * @param s
	 */
	public void AddSuppliers(Suppliers s) {
		long startTime = System.currentTimeMillis();

		SuppliersImpl si = new SuppliersImpl();
		si.InsertSuppliers(s);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("插入供应商  " + s.getName() + "  总耗时："
				+ Float.toString(seconds) + " 秒");

	}

	/**
	 * 查询所有Function
	 * 
	 * @return
	 */
	public List<Function> MenuFunction() {

		long startTime = System.currentTimeMillis();

		FunctionImpl fi = new FunctionImpl();
		List<Function> rs = fi.MenuFunction();

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询AllFunction耗时：" + Float.toString(seconds) + " 秒");
		return rs;

	}

	/**
	 * 权限查询
	 * 
	 * @param FunctionName
	 * @return
	 */
	public boolean Power(int AdminUserId, String FunctionName) {
		long startTime = System.currentTimeMillis();

		boolean rs = false;
		PowerImpl pi = new PowerImpl();
		FunctionImpl fi = new FunctionImpl();
		int Fid = fi.SelectFunctionFid(FunctionName);
		if (Fid == -1)
			rs = true;
		if (pi.Power(SelectAdminUserById(AdminUserId).getPower(), Fid))
			rs = true;

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询权限耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 获取Power的Function列表
	 * 
	 * @param id
	 * @return
	 */
	public List<PowerFuntion> PowerFunctionByPowerId(int id) {

		long startTime = System.currentTimeMillis();
		PowerImpl pi = new PowerImpl();
		List<PowerFuntion> rs = pi.PowerFunctionByPowerId(id);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询PowerFunction耗时：" + Float.toString(seconds)
				+ " 秒");
		return rs;
	}

	/**
	 * 添加权限
	 * 
	 * @param powername
	 * @param powerass
	 * @return
	 */
	public String AddPower(String powername, String powerass) {
		long startTime = System.currentTimeMillis();
		PowerImpl pi = new PowerImpl();
		String rs = "";
		if (pi.getPowerByName(powername) != null || powername.equals(""))
			rs = "Power existence";
		else {
			Power p = new Power();
			p.setPower(powername);
			pi.SavePower(p);
			p = pi.getPowerByName(powername);
			int s = 0;
			for (int i = 0; i < powerass.length(); i++) {
				if (powerass.charAt(i) == ',') {
					PowerAss pa = new PowerAss();
					pa
							.setFunctionid(Integer.parseInt(powerass.substring(
									s, i)));
					pa.setPowerid(p.getId());
					pi.SavaPowerAss(pa);
					s = i + 1;
				}
			}

			rs = Success;

		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("AddFunction耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 更新权限信息
	 * 
	 * @param id
	 * @param power
	 * @param powerass
	 * @return
	 */
	public String UpdatePower(String id, String power, String powerass) {
		long startTime = System.currentTimeMillis();
		PowerImpl pi = new PowerImpl();
		String rs = "";
		if (id.equals(""))
			rs = "Powerid error";
		else {
			Power p = new Power();
			p.setId(Integer.parseInt(id));
			p.setPower(power);
			pi.UpdatePowerById(p);
			int s = 0;
			pi.DeletePowerFunctionById(p.getId());
			for (int i = 0; i < powerass.length(); i++) {
				if (powerass.charAt(i) == ',') {
					PowerAss pa = new PowerAss();
					pa
							.setFunctionid(Integer.parseInt(powerass.substring(
									s, i)));
					pa.setPowerid(p.getId());
					pi.SavaPowerAss(pa);
					s = i + 1;
				}
			}

			rs = Success;

		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out
				.println("UpdateFunction耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 更新Admin信息
	 * 
	 * @param admin
	 * @return
	 */
	public String UpdateAdmin(Admin admin) {
		long startTime = System.currentTimeMillis();

		if (admin == null || admin.getTel().equals("")
				|| admin.getName().equals("") || admin.getUsername().equals(""))
			return "request error";

		AdminImpl ai = new AdminImpl();
		ai.UpdateAdmin(admin);
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("更新admin用户信息耗时：" + Float.toString(seconds) + " 秒");
		return Success;

	}

	/**
	 * 添加所有Admin用户
	 * 
	 * @param admin
	 * @return
	 */
	public String AddAadmin(Admin admin) {
		long startTime = System.currentTimeMillis();

		if (admin == null || admin.getTel().equals("")
				|| admin.getName().equals("") || admin.getUsername().equals(""))
			return "request error";

		AdminImpl ai = new AdminImpl();
		if (ai.SelectAdminUserByName(admin) != null)
			return "Admin existence";
		ai.AddAdmin(admin);
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加admin用户信息耗时：" + Float.toString(seconds) + " 秒");
		return Success;
	}

	/**
	 * 获取所有仓库
	 * 
	 * @return
	 */
	public List<WareHouse> AllWareHouse() {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		List<WareHouse> rs = wi.AllWareHouse();

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("获取所有仓库信息耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 获取所有部门
	 * 
	 * @return
	 */
	public List<Department> AllDepartment() {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		List<Department> rs = wi.AllDepartment();

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("获取所有部门信息耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 添加新仓库
	 * 
	 * @param name
	 * @return
	 */
	public String AddWareHouse(String name) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		String rs = "";
		if (name == null || name.equals("")) {
			rs = "request error";
		} else if (wi.WareHouseByName(name) != null) {
			rs = "Name existence";
		} else {
			WareHouse wh = new WareHouse();
			wh.setName(name);
			wi.AddWareHouse(wh);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加新仓库耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public String AddDepartment(String name) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		String rs = "";
		if (name == null || name.equals("")) {
			rs = "request error";
		} else if (wi.DepartmentByName(name) != null) {
			rs = "Name existence";
		} else {
			Department wh = new Department();
			wh.setDepartmentname(name);
			wi.AddDepartment(wh);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加新部门耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 更新仓库
	 * 
	 * @param name
	 * @return
	 */
	public String UpdateWareHouse(String name, int Id) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		String rs = "";
		if (name == null || name.equals("")) {
			rs = "request error";
		} else if (wi.WareHouseByName(name) != null) {
			rs = "Name existence";
		} else {
			WareHouse wh = new WareHouse();
			wh.setName(name);
			wh.setId(Id);
			wi.UpdateWareHouse(wh);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("更新仓库信息耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 更新部门
	 * 
	 * @param name
	 * @return
	 */
	public String UpdateDepartment(String name, int Id) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		String rs = "";
		if (name == null || name.equals("")) {
			rs = "request error";
		} else if (wi.DepartmentByName(name) != null) {
			rs = "Name existence";
		} else {
			Department wh = new Department();
			wh.setDepartmentname(name);
			wh.setId(Id);
			wi.UpdateDepartment(wh);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("更新部门信息耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 撤销损耗出库
	 * 
	 * @param
	 * @return
	 */
	public String Revoke(int Id) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		String rs = "";
		WareRecord wr = wi.SelectWareListById(Id);
		if (wr.getIstrue() == 0) {
			// 有效值为0
			// 找到此订单有效值为1的，加上撤销的数量
			WareRecord wr1 = wi.SelectWareRecordIstureByNumberAndProcuct(wr
					.getOrdernumber(), wr.getProductnumber());
			wr1.setCount(wr1.getCount() + wr.getDocount());
			wr1.setIstrue(1);
			wi.UpdateWareRecordAll(wr1);
		} else if (wr.getIstrue() == 1) {
			// 有效值为1
			// 根据fid找到有效订单，加上数量
			WareRecord wr2 = wi.SelectWareListById(wr.getFid());
			wr2.setCount(wr2.getCount() + wr.getDocount());
			wr2.setIstrue(1);
			System.out.println(wr2.getIstrue());// 1
			System.out.println(wr2.getCount());// 8
			wi.UpdateWareRecordAll(wr2);
		} else
			rs = "Error";

		wi.DeleteWareRecordById(Id);
		// 删除此id
		rs = Success;

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("撤销耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 订单列表
	 */
	public String BeRevokeOutWare(String ordernum, String productnum) {

		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		WareRecord rs = wi.SelectWareRecordByNumberAndProcuct(ordernum,
				productnum, 3);
		wi.UpdateWareRecordDotypeById(rs.getId(), 1);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("审核出库耗时：" + Float.toString(seconds) + " 秒");
		return Success;
	}

	@Test
	public void a1() {
		System.out.println(BeRevokeOutWare("518414", "373781"));
	}

	/**
	 * 订单列表
	 */
	public List<Order> OrderList(String page) {

		long startTime = System.currentTimeMillis();

		OrderImpl oi = new OrderImpl();
		List<Order> rs = oi.AllOrder(PageUtil.createPage(10000, oi
				.OrderCount(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询订单列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据ID查询供应商
	 * 
	 * @param id
	 * @return
	 */
	public String SuppliersById(String id) {
		long startTime = System.currentTimeMillis();

		SuppliersImpl si = new SuppliersImpl();
		Suppliers rs = si.SelectSuppliersById(id);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询id = " + id + " 的供应商总耗时："
				+ Float.toString(seconds) + " 秒");

		return rs.getName();
	}

	/**
	 * 根据ID查询供应商
	 * 
	 * @param id
	 * @return
	 */
	public Suppliers SuppliersAllById(String id) {
		long startTime = System.currentTimeMillis();

		SuppliersImpl si = new SuppliersImpl();
		Suppliers rs = si.SelectSuppliersById(id);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询id = " + id + " 的供应商总耗时："
				+ Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 获取订单编号
	 * 
	 * @return
	 */
	public String GetOrderNumber() {
		long startTime = System.currentTimeMillis();
		String rs = getRom();

		OrderImpl oi = new OrderImpl();
		Order order = new Order();
		order.setNumber(rs);

		while (oi.OrderById(order) != null) {
			rs = getRom();
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("创建订单编号耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 获取所有
	 * 
	 * @return
	 */
	public List<Buytype> AllBuytype() {
		long startTime = System.currentTimeMillis();

		BuytypeImpl wi = new BuytypeImpl();
		List<Buytype> rs = wi.AllBuytype();

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("获取所有购车方式耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 获取所有车型
	 * 
	 * @return
	 */
	public List<Models> AllModels() {
		long startTime = System.currentTimeMillis();

		ModelsImpl wi = new ModelsImpl();
		List<Models> rs = wi.AllModels();

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("获取所有车型信息耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据Id获取
	 * 
	 * @return
	 */
	public Buytype BuytypeById(int id) {
		long startTime = System.currentTimeMillis();

		BuytypeImpl wi = new BuytypeImpl();
		Buytype rs = wi.BuytypeById(id);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("获取id = " + id + " 购车方式耗时："
				+ Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据Id获取车型
	 * 
	 * @return
	 */
	public Models ModelsById(int id) {
		long startTime = System.currentTimeMillis();

		ModelsImpl wi = new ModelsImpl();
		Models rs = wi.ModelsById(id);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("获取id = " + id + " 车型信息耗时："
				+ Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 更新
	 * 
	 * @param name
	 * @param Id
	 * @return
	 */
	public String UpdateBuytype(String type, String Id) {
		long startTime = System.currentTimeMillis();
		BuytypeImpl wi = new BuytypeImpl();
		String rs = "";
		if (type == null || type.equals("")) {
			rs = "request error";
		} else if (wi.BuytypeBytype(type) != null) {
			rs = "Name existence";
		} else {
			Buytype wh = new Buytype();
			wh.setType(type);
			wh.setId(Integer.parseInt(Id));
			wi.UpdateBuytype(wh);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("更新购车方式耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 更新
	 * 
	 * @param name
	 * @param Id
	 * @return
	 */
	public String UpdateUserIdIsture(int Id) {
		long startTime = System.currentTimeMillis();
		UserImpl wi = new UserImpl();
		String rs = "";
		wi.UpdateIsture(Id);
		rs = Success;

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("会员卡挂失耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 更新
	 * 
	 * @param Id
	 * @return
	 */
	public String UpdateCarWashIstrue(int Id) {
		long startTime = System.currentTimeMillis();
		CarWashImpl wi = new CarWashImpl();
		String rs = "";
		wi.UpdateIsture(Id);
		rs = Success;

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("洗车卡挂失耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 更新车型
	 * 
	 * @param name
	 * @param Id
	 * @return
	 */
	public String UpdateModels(String name, int Id) {
		long startTime = System.currentTimeMillis();

		ModelsImpl wi = new ModelsImpl();
		String rs = "";
		if (name == null || name.equals("")) {
			rs = "request error";
		} else if (wi.ModelsByName(name) != null) {
			rs = "Name existence";
		} else {
			Models wh = new Models();
			wh.setName(name);
			wh.setId(Id);
			wi.UpdateModels(wh);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("更新车型信息耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 添加新车型
	 * 
	 * @param name
	 * @return
	 */
	public String AddModels(String name) {
		long startTime = System.currentTimeMillis();

		ModelsImpl wi = new ModelsImpl();
		String rs = "";
		if (name == null || name.equals("")) {
			rs = "request error";
		} else if (wi.ModelsByName(name) != null) {
			rs = "Name existence";
		} else {
			Models wh = new Models();
			wh.setName(name);
			wi.AddModels(wh);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加新车型耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 添加购车方式
	 * 
	 * @param name
	 * @return
	 */
	public String AddBuytype(String type) {
		long startTime = System.currentTimeMillis();

		BuytypeImpl wi = new BuytypeImpl();
		String rs = "";
		if (type == null || type.equals("")) {
			rs = "request error";
		} else if (wi.BuytypeBytype(type) != null) {
			rs = "Name existence";
		} else {
			Buytype wh = new Buytype();
			wh.setType(type);
			wi.AddBuytype(wh);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加购买方式耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据供应商查询商品
	 * 
	 * @param v
	 * @return
	 */
	public List<Wares> SelectWaresBySuppliers(String v) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		Wares w = new Wares();
		w.setSuppliers(Integer.parseInt(v));
		List<Wares> rs = wi.SelectWaresBySuppliers(w);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询供应商商品耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 添加商品
	 * 
	 * @param w
	 * @return
	 */
	public Object AddWares(Wares w) {
		long startTime = System.currentTimeMillis();
		WareImpl wi = new WareImpl();
		Object rs = wi.SelectWares(w);

		if (rs == null) {
			w.setNumber(getRom());
			while (wi.SelectWaresByNumber(w) != null) {
				w.setNumber(getRom());
			}
			int id = Integer.parseInt(wi.AddWares(w).toString());
			w.setId(id);
			rs = wi.SelectWaresById(w);
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询添加商品耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 获取6位编号
	 * 
	 * @return
	 */
	private String getRom() {
		return (int) ((Math.random() * 9 + 1) * 100000) + "";
	}

	/**
	 * 快速查询商品
	 * 
	 * @param s
	 * @param sup
	 * @return
	 */
	public List<Wares> FastWares(String s, String sup) {
		long startTime = System.currentTimeMillis();
		WareImpl wi = new WareImpl();
		List<Wares> rs = null;

		rs = wi.FastSelectWares(s, Integer.parseInt(sup));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速查询供应商商品耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 添加订单
	 * 
	 * @param json
	 * @param spid
	 * @param ordernumber
	 * @return
	 */
	public String AddOrder(String json, String spid, String ordernumber) {
		long startTime = System.currentTimeMillis();

		JSONArray js = JSONArray.fromObject(json);
		System.out.println(js);
		System.out.println(json);
		OrderImpl oi = new OrderImpl();

		double all = 0.00;
		// 计算总价
		for (int i = 0; i < js.size(); i++) {
			JSONArray son = JSONArray.fromObject(js.get(i));
			double count = Double.parseDouble(son.get(3).toString());
			double p = Double.parseDouble(son.get(4).toString());
			all += p * count;
		}

		Order order = new Order();
		order.setNumber(ordernumber);
		order.setSuppliers(Integer.parseInt(spid));
		order.setAlltotalprice(all);
		order.setTime(new Date());
		if (oi.OrderByNumber(order) != null)
			return "existence";
		else
			oi.AddOrder(order);

		for (int i = 0; i < js.size(); i++) {
			JSONArray son = JSONArray.fromObject(js.get(i).toString());
			double count = Double.parseDouble(son.get(3).toString());
			double p = Double.parseDouble(son.get(4).toString());

			com.haojie.pojo.OrderList ol = new com.haojie.pojo.OrderList();
			ol.setCount(count);
			ol.setPrice(p);
			ol.setNumber(ordernumber);
			ol.setProductnumber(son.get(0).toString());

			oi.AddOrderList(ol);
		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加订单耗时：" + Float.toString(seconds) + " 秒");
		return Success;
	}

	/**
	 * 根据ordernumber查订单详情
	 * 
	 * @param s
	 * @return
	 */
	public List<OrderList> OrderListByNumber(String s) {
		long startTime = System.currentTimeMillis();
		List<OrderList> rs;
		OrderImpl oi = new OrderImpl();
		rs = oi.OrderListByOrderNumber(s);
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询订单详情列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据ordernumber查订单详情
	 * 
	 * @param s
	 * @return
	 */
	public Order OrderByNumber(String s) {
		long startTime = System.currentTimeMillis();
		Order rs;
		OrderImpl oi = new OrderImpl();
		Order o = new Order();
		o.setNumber(s);
		rs = oi.OrderByNumber(o);
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询订单详情耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据NUMBER查询商品详情
	 * 
	 * @param number
	 * @return
	 */
	public Wares WaresByNumber(String number) {
		long startTime = System.currentTimeMillis();
		Wares rs;
		WareImpl oi = new WareImpl();
		Wares o = new Wares();
		o.setNumber(number);
		rs = oi.SelectWaresByNumber(o);
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询商品详情耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 入库
	 */
	public String EnterWareHouse(String ordernumber, String user,
			List<WareRecord> list) {
		long startTime = System.currentTimeMillis();
		OrderImpl oi = new OrderImpl();
		Order o = new Order();
		o.setNumber(ordernumber);
		String rs = "";
		if (oi.OrderByNumber(o).getTag() == 1) {
			rs = "该订单已入库,本次操作失败";
		} else {
			oi.EnterWareHouse(ordernumber);

			for (int i = 0; i < list.size(); i++) {
				String number = list.get(i).getProductnumber();
				List<OrderList> l = oi.OrderListByOrderNumber(ordernumber);

				for (int j = 0; j < l.size(); j++) {

					if (l.get(j).getProductnumber().equals(number)) {
						// 需要更新 没有加上之前的库存数量 暂时存上
						WareRecord r = new WareRecord();
						r.setCount(l.get(j).getCount());
						r.setDocount(l.get(j).getCount());
						r.setDotype(0);
						r.setIstrue(1);
						r.setOrdernumber(ordernumber);
						r.setDouser(user);
						// r.setDepartment(list.get(i).getDepartment());
						r.setOutprice(list.get(i).getOutprice());
						r.setProductnumber(number);
						r.setWarehouse(list.get(i).getWarehouse());
						r.setTime(new Date());
						new WareImpl().AddWareRecord(r);
					}
				}
			}

			rs = "入库成功";

		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("商品入库耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据产品Number查询最后一条进出库记录
	 * 
	 * @param productnumber
	 * @return
	 */
	public WareRecord SelectOneWareByNumberOrderByTimeDesc(String productnumber) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		WareRecord rs = wi.SelectOneWareByTimeDesc(productnumber);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按照时间和货号查询最后一个商品记录耗时：" + Float.toString(seconds)
				+ " 秒");
		return rs;
	}

	public WareRecord SelectWareByOrderPro(String ordernumber,
			String productnumber) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		WareRecord rs = wi.SelectWareRecordIstureByNumberAndProcuct(
				ordernumber, productnumber);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按照时间和货号查询最后一个商品记录耗时：" + Float.toString(seconds)
				+ " 秒");
		return rs;
	}

	/**
	 * 出库列表
	 * 
	 * @param productnumber
	 * @return
	 */
	public List<WareRecord> OutWareListByDotype(String page) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		List<WareRecord> rs = wi.OutWareListByDotype(PageUtil.createPage(10000,
				wi.OutWareListByDotypeCount(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询出库列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 出库列表byid
	 * 
	 * @param value1
	 * @return
	 */
	public WareRecord OutWareListByDotype1(String value1) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		WareRecord rs = wi.OutWareListByDotype(Integer.parseInt(value1));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询出库列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 出库列表byarray
	 * 
	 * @param value1
	 * @return
	 */
	public List<WareRecord> OutWareListByDotype2(String value2) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		String[] a = value2.split(",");
		List<WareRecord> rs = new ArrayList<WareRecord>();
		for (int i = 0; i < a.length; i++) {
			rs.add(wi.OutWareListByDotype(Integer.parseInt(a[i])));
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询出库列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 员工出库
	 * 
	 * @param productnumber
	 * @return
	 */
	public List<WareRecord> EmployeeOutByDotype(String page) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		List<WareRecord> rs = wi.EmployeeOutByDotype(PageUtil.createPage(10000,
				wi.EmployeeOutByDotypeCount(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询员工出库列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据产品Number查询最后一条订单记录
	 * 
	 * @param productnumber
	 * @return
	 */
	public OrderList SelectOrderListByNumberOrderByTimeDesc(String productnumber) {
		long startTime = System.currentTimeMillis();

		OrderImpl wi = new OrderImpl();
		OrderList rs = wi.SelectOrderListByIdDesc(productnumber);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("根据产品Number查询最后一条订单记录耗时：" + Float.toString(seconds)
				+ " 秒");
		return rs;
	}

	/**
	 * 统计货物库存
	 * 
	 * @param warehouse
	 * @param key
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> SelectWareListByWhere(String warehouse, String key) {
		long startTime = System.currentTimeMillis();

		if (warehouse == null || warehouse.equals(""))
			warehouse = "0";
		if (key == null)
			key = "";

		WareImpl wi = new WareImpl();
		List<Object[]> rs = wi.SelectWareListByWhere(Integer
				.parseInt(warehouse), key);
		List<Object[]> list = new ArrayList();

		// 统计数量
		for (int i = 0; i < rs.size(); i++) {
			double count = Double.parseDouble(rs.get(i)[1].toString());
			for (int j = i + 1; j < rs.size(); j++) {

				if (rs.get(j)[3].toString().equals(rs.get(i)[3].toString())) {
					count += Double.parseDouble(rs.get(j)[1].toString());
					rs.remove(j);
				}
			}
			Object[] temp = { rs.get(i)[0], count, rs.get(i)[2], rs.get(i)[3],
					rs.get(i)[4], rs.get(i)[5], rs.get(i)[11] };
			list.add(temp);
		}

		rs = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			double count = Double.parseDouble(list.get(i)[1].toString());
			for (int j = i + 1; j < list.size(); j++) {

				if (list.get(j)[3].toString().equals(list.get(i)[3].toString())) {
					count += Double.parseDouble(list.get(j)[1].toString());
					list.remove(j);
				}
			}
			Object[] temp = { list.get(i)[0], count, list.get(i)[2],
					list.get(i)[3], list.get(i)[4], list.get(i)[5],
					list.get(i)[6] };
			rs.add(temp);
		}

		// 循环去重
		list = new ArrayList<Object[]>();
		for (int i = 0; i < rs.size(); i++) {
			double count = Double.parseDouble(rs.get(i)[1].toString());
			for (int j = i + 1; j < rs.size(); j++) {

				if (rs.get(j)[3].toString().equals(rs.get(i)[3].toString())) {
					count += Double.parseDouble(rs.get(j)[1].toString());
					rs.remove(j);
				}
			}
			Object[] temp = { rs.get(i)[0], count, rs.get(i)[2], rs.get(i)[3],
					rs.get(i)[4], rs.get(i)[5], rs.get(i)[6] };
			list.add(temp);
		}
		rs = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			double count = Double.parseDouble(list.get(i)[1].toString());
			for (int j = i + 1; j < list.size(); j++) {

				if (list.get(j)[3].toString().equals(list.get(i)[3].toString())) {
					count += Double.parseDouble(list.get(j)[1].toString());
					list.remove(j);
				}
			}
			Object[] temp = { list.get(i)[0], count, list.get(i)[2],
					list.get(i)[3], list.get(i)[4], list.get(i)[5],
					list.get(i)[6] };
			rs.add(temp);
		}
		// 循环去重结束

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询在库记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 查询在库记录 就是改这个方法
	 * 
	 * @param number
	 * @return
	 */
	public List<WareRecord> GetOneWareRecordList(String number) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		List<WareRecord> list = wi.SelectWareListByNumber(number);

		List<WareRecord> temp = new ArrayList<WareRecord>();

		// 合并价格相同的产品，数量累加
		for (int i = 0; i < list.size(); i++) {
			boolean tag = true;// 标记变量
			int j = 0;
			for (j = 0; j < temp.size(); j++) {
				if (list.get(i).getOutprice() == temp.get(j).getOutprice()
						&& list.get(i).getWarehouse() == temp.get(j)
								.getWarehouse()) {
					tag = false;
					double c = temp.get(j).getCount() + list.get(i).getCount();
					WareRecord s = temp.get(j);
					s.setCount(c);

					temp.remove(j);
					temp.add(s);

					break;
				}
			}

			if (tag) {
				temp.add(list.get(i));
			}

		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询在库记录耗时：" + Float.toString(seconds) + " 秒");
		return temp;
	}

	/**
	 * 根据订单号货号查询一条list
	 * 
	 * @param number
	 * @return
	 */
	public WareRecord GetOneEnterWareRecordByOrderNumAndProductNum(
			String number, String product) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		WareRecord rs = wi.SelectWareRecordByNumberAndProcuct(number, product,
				0);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询对应单号货号记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据ID查询仓库耗时
	 * 
	 * @param id
	 * @return
	 */
	public WareHouse WareHouseById(int id) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		WareHouse rs = wi.WareHouseById(id);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("根据ID查询仓库耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据ID查询
	 * 
	 * @param id
	 * @return
	 */
	public Department DepartmentById(int id) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		Department rs = wi.DepartmentById(id);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("根据ID查询仓库耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 车辆库列表
	 */
	public List<Car> AllCarByTimdeDecs(String page) {

		long startTime = System.currentTimeMillis();

		CarImpl oi = new CarImpl();
		List<Car> rs = oi.AllCarByTimeDesc(PageUtil.createPage(10000, oi
				.CarCount(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询车辆列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 车辆库列表
	 */
	public List<Car> CarByTimdeDecs(String page) {

		long startTime = System.currentTimeMillis();

		CarImpl oi = new CarImpl();
		List<Car> rs = oi.CarByTimeDesc(PageUtil.createPage(10000, oi
				.CarCountLack(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询车辆列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 公司车辆库列表
	 */
	public List<Car> SelfCarByTimdeDecs(String page) {

		long startTime = System.currentTimeMillis();

		CarImpl oi = new CarImpl();
		List<Car> rs = oi.SelfCarByTimeDesc(PageUtil.createPage(10000, oi
				.CarCountLack(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询公司车辆列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据ID查询车辆
	 * 
	 * @param id
	 * @return
	 */
	public Car CarById(String id) {
		long startTime = System.currentTimeMillis();

		CarImpl oi = new CarImpl();
		Car rs = oi.CarById(Integer.parseInt(id));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("根据ID=" + id + "查询车辆耗时：" + Float.toString(seconds)
				+ " 秒");
		return rs;
	}

	/**
	 * 添加新车辆
	 * 
	 * @param car
	 * @param douser
	 * @return
	 */
	public String AddCar(Car car, Map douser) {
		long startTime = System.currentTimeMillis();

		String rs = "";
		CarImpl oi = new CarImpl();
		Car c = oi.CarByNum(car.getCarnum());

		car.setTime(new Date());
		car.setDouser(((Admin) douser.get("adminuser")).getUsername());

		if (c != null)
			rs = "existence";
		else {
			oi.AddCar(car);
			rs = Success;
		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加车辆耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public String UpdataCar(Car car, Map douser) {
		long startTime = System.currentTimeMillis();

		String rs = "";
		CarImpl oi = new CarImpl();

		car.setTime(new Date());
		car.setDouser(((Admin) douser.get("adminuser")).getUsername());

		oi.UpdateCar(car);
		rs = Success;

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加车辆耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public String UpdataCarRecord(FastCarRecord fcr) {
		long startTime = System.currentTimeMillis();

		String rs = "";
		CarImpl oi = new CarImpl();
		// List<FastCarRecord> f = oi.FastCarRecordByCarnum(fcr.getCarnum());
		// for (int i = 0; i < f.size(); i++) {
		//
		// if (f.get(i).getRegistartime() == fcr.getRegistartime()
		// && f.get(i).getExptime() == fcr.getExptime()) {
		// rs = "Exist";
		// }
		//
		// }

		FastCarRecord fc = new FastCarRecord();
		fc.setCarnum(fcr.getCarnum());
		fc.setRegistartime(fcr.getRegistartime());
		fc.setExptime(fcr.getExptime());
		fc.setBuytype(fcr.getBuytype());
		fc.setContractname(fcr.getContractname());
		fc.setContracttel(fcr.getContracttel());
		fc.setUsebeizhu(fcr.getUsebeizhu());
		fc.setTime(new Date());
		oi.AddFastCarRecord(fc);

		rs = Success;

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加使用人记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 添加新VIP
	 * 
	 * @param car
	 * @param douser
	 * @return
	 */
	public String AddVip(User user, Map douser) {
		long startTime = System.currentTimeMillis();

		String rs = "";
		UserImpl oi = new UserImpl();
		User c = oi.SelectUserByUsernum(user.getUsernum());

		user.setTime(new Date());
		user.setIsture(1);
		user.setDouser(((Admin) douser.get("adminuser")).getUsername());

		if (c != null)
			rs = "existence";
		else {
			oi.AddUser(user);
			rs = Success;
		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加VIP耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据卡号查询VIP
	 * 
	 * @param number
	 * @return
	 */
	public User VipByUserNum(String number) {
		long startTime = System.currentTimeMillis();

		User rs = null;
		UserImpl oi = new UserImpl();
		rs = oi.SelectUserByUsernum(number);
		System.out.println(rs.getKind());
		System.out.println(rs.getCarnum());
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("根据卡号查询VIP耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public DatePojo DateUtil(Date date) {
		DatePojo dp = new DatePojo();
		dp.setYyyy(date.getYear() + 1900);
		dp.setMm(date.getMonth() + 1);
		dp.setDd(date.getDate());
		dp.setHh(date.getHours());
		dp.setMM(date.getMinutes());
		dp.setSs(date.getSeconds());

		return dp;
	}

	/**
	 * 快速搜索车辆
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastCar(String fast) {
		long startTime = System.currentTimeMillis();

		CarImpl ci = new CarImpl();
		List<Object> rs = ci.FastCar(fast);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索车辆耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 快速搜索vip
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastVipList(String fast) {
		long startTime = System.currentTimeMillis();

		UserImpl ci = new UserImpl();
		List<Object> rs = ci.FastVipList(fast);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索会员耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 快速搜索vip
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastUserLoss(String fast) {
		long startTime = System.currentTimeMillis();

		UserImpl ci = new UserImpl();
		List<Object> rs = ci.FastUserLoss(fast);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速会员挂失列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 快速搜索vip
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastCarWashLoss(String fast) {
		long startTime = System.currentTimeMillis();
		System.out.println(fast);
		CarWashImpl ci = new CarWashImpl();
		List<Object> rs = ci.FastCarWashLoss(fast);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索洗车卡挂失列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * vip列表
	 */
	public List<User> VipList(String page) {

		long startTime = System.currentTimeMillis();

		UserImpl oi = new UserImpl();
		List<User> rs = oi.AllUserByTimeDesc(PageUtil.createPage(100000, oi
				.UserCount(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询vip列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 挂失列表
	 */
	public List<User> LossList(String page) {

		long startTime = System.currentTimeMillis();

		UserImpl oi = new UserImpl();
		List<User> rs = oi.AllLossByTimeDesc(PageUtil.createPage(10000, oi
				.LossCount(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询挂失列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 挂失列表
	 */
	public List<CarWash> CarWashLossList(String page) {

		long startTime = System.currentTimeMillis();

		CarWashImpl oi = new CarWashImpl();
		List<CarWash> rs = oi.AllLossByTimeDesc(PageUtil.createPage(10000, oi
				.LossCount(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询洗车卡挂失列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 快速搜索供货商
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastSup(String fast) {
		long startTime = System.currentTimeMillis();

		SuppliersImpl ci = new SuppliersImpl();
		List<Object> rs = ci.FastSup(fast);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索供货商耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 快速搜索订单
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastOrder(String fast) {
		long startTime = System.currentTimeMillis();

		OrderImpl ci = new OrderImpl();
		List<Object> rs = ci.FastOrder(fast);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索订单耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 获取现在的时间（格式化）
	 * 
	 * @param format
	 * @return
	 */
	public String GetNowDate(String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		long times = System.currentTimeMillis();

		Date date = new Date(times);
		String tim = sdf.format(date);
		return tim;
	}

	/**
	 * 时间格式化
	 * 
	 * @param format
	 * @return
	 */
	public String DateFormat(String format, Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String tim = sdf.format(date);
		return tim;
	}

	/**
	 * 时间格式化并提前一个月
	 * 
	 * @param format
	 * @return
	 */
	public String DateFormatBefor(String format, Date date, int va) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		long beforeTime = (date.getTime() / 1000) - 60 * 60 * 24 * va;
		date.setTime(beforeTime * 1000);
		String beforeDate = sdf.format(date);
		return beforeDate;
	}

	/**
	 * 当前时间
	 * 
	 * @param format
	 * @return
	 */
	public String DateFormatNow(String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String tim = sdf.format(new Date());
		return tim;
	}

	/**
	 * 获取维修订单号
	 * 
	 * @param fast
	 * @return
	 */
	public String GetRepairNum() {
		long startTime = System.currentTimeMillis();
		String rs = getRom();

		RepairImpl ri = new RepairImpl();

		while (ri.RepairByNum(rs) != null) {
			rs = getRom();
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("创建维修订单编号耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 添加新维修记录
	 * 
	 * @param car
	 * @param douser
	 * @return
	 */
	public String AddRepair(Repair repair, Map douser) {
		long startTime = System.currentTimeMillis();
		String rs = "";
		repair.setDouser(((Admin) douser.get("adminuser")).getUsername());
		repair.setTime(new Date());

		RepairImpl ri = new RepairImpl();

		if (ri.RepairByNum(repair.getRepairnum()) != null) {
			rs = "existence";
		} else {
			ri.AddRepair(repair);
			rs = Success;
		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加维修记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 搜索
	 * 
	 * @return
	 */
	public List<Repair> RepairIngList() {
		long startTime = System.currentTimeMillis();

		RepairImpl ci = new RepairImpl();
		List<Repair> rs = ci.RepairIngList();

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询正在维修车辆耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 删除维修中订单 (待修改)
	 * 
	 * @param num
	 * @return
	 */
	public String DeleteRepairIng(String num) {
		long startTime = System.currentTimeMillis();

		RepairImpl ci = new RepairImpl();
		String rs = "";
		WareImpl wi = new WareImpl();
		RepairImpl ri = new RepairImpl();

		Repair r = ci.RepairByNum(num);

		if (r == null) {
			rs = "not find";
		} else if (r.getState() != 0) {
			rs = "can not be deleted (Error 1)";
		} else if (ri.RepairRecordByRepairnum(num, 0).size() != 0) {
			rs = "can not be deleted (Error 2)";
		} else if (ri.RepairRecordByRepairnum(num, 1).size() != 0) {
			rs = "can not be deleted (Error 3)";
		} else {
			ci.DeleteRepair(num);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("删除正在维修车辆耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 删除维修项目
	 * 
	 * @param num
	 */
	public String DeleteRepairText(String repairnumber) {
		System.out.println(repairnumber + "00000000000000");
		long startTime = System.currentTimeMillis();
		String rs = "";
		RepairImpl ci = new RepairImpl();

		ci.DeleteRepairRecordById(Integer.parseInt(repairnumber));

		rs = Success;
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("删除正在维修项目耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 删除车辆
	 * 
	 * @param num
	 */
	public String DeleteCar(int id) {
		long startTime = System.currentTimeMillis();
		String rs = "";
		CarImpl ci = new CarImpl();

		ci.DeleteCar(id);

		rs = Success;
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("删除车辆耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}
	
	/**
	 * 删除过期出库
	 * 
	 * @param num
	 */
	public String DeleteOut(String value1) {
		long startTime = System.currentTimeMillis();
		String rs = "";
		WareImpl wi = new WareImpl();
		String a = "";
	
		JSONArray son = JSONArray.fromObject(value1);
		for (int i = 0; i < son.size(); i++) {
			Object j = son.get(i);
			a= wi.DeleteWareRecord(Integer.parseInt(j.toString()));
		}
		if(a.equals("1")){
			rs = "删除成功！";
		}
		else
			rs = "删除失败！";
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("删除无效出库耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 删除图片
	 * 
	 * @param num
	 */
	public String DeletePic(int id) {
		long startTime = System.currentTimeMillis();
		String rs = "";
		PicImpl ci = new PicImpl();

		ci.DeletePic(id);

		rs = Success;
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("删除图片耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 删除未确认商品
	 * 
	 * @param num
	 */
	public String DeleteOneOrder(int id) {
		long startTime = System.currentTimeMillis();
		String rs = "";
		OrderImpl ci = new OrderImpl();
		OrderList ol = new OrderList();
		Order o = new Order();
		// 删除该商品在orderinfo中

		// 修改orderlist的信息
		// 找到ol这个订单所有信息
		ol = ci.OrderListById(id);
		// 计算金额
		System.out.println("2222");
		double all = (double) ol.getPrice() * ol.getCount();
		System.out.println(all);
		// 找到当前订单
		o = ci.OrderByNumber(ol.getNumber());
		System.out.println("33");
		double allprice = (double) o.getAlltotalprice() - all;
		System.out.println(allprice);
		System.out.println((double) allprice);
		System.out.println(o.getId());
		// 更新
		ci.DeleteOne(id);
		ci.UpdatePri((double) allprice, o.getId());

		rs = Success;
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("删除未确认商品耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 删除车辆使用人记录
	 * 
	 * @param num
	 */
	public String DeleteCarUser(int id) {
		long startTime = System.currentTimeMillis();
		String rs = "";
		CarImpl ci = new CarImpl();

		ci.DeleteCarUser(id);

		rs = Success;
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("删除车辆使用人记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 查询维修车辆
	 * 
	 * @param num
	 * @return
	 */
	public Repair RepairByNum(String num) {
		long startTime = System.currentTimeMillis();

		RepairImpl ci = new RepairImpl();

		Repair rs = ci.RepairByNum(num);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("根据num查询维修车辆耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 按购车时间段搜索
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastTime(String fast1, String fast2) {
		long startTime = System.currentTimeMillis();

		CarImpl ci = new CarImpl();
		List<Object> rs = ci.FastTime(fast1, fast2);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按购车时间段搜索耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 按时间点搜索
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastTime1(String fast1) {
		long startTime = System.currentTimeMillis();

		CarImpl ci = new CarImpl();
		List<Object> rs = ci.FastTime1(fast1);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按时间点搜索耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 按时间段搜索订单
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastOrderTime(String fast1, String fast2) {
		long startTime = System.currentTimeMillis();

		OrderImpl ci = new OrderImpl();
		List<Object> rs = ci.FastOrderTime(fast1, fast2);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按时间段搜索订单耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 按时间点搜索订单
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastOrderTime1(String fast1) {
		long startTime = System.currentTimeMillis();

		OrderImpl ci = new OrderImpl();
		List<Object> rs = ci.FastOrderTime1(fast1);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按时间点搜索订单耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 按时间点搜索维修记录
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastRepairTime1(String fast1) {
		long startTime = System.currentTimeMillis();

		RepairImpl ci = new RepairImpl();
		List<Object> rs = ci.FastRepairTime1(fast1);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按时间点搜索维修记录耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 快速搜索维修记录
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastRepair(String fast) {
		long startTime = System.currentTimeMillis();

		RepairImpl ci = new RepairImpl();
		List<Object> rs = ci.FastRepair(fast);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索维修记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 按时间段搜索维修记录
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastRepairTime(String fast1, String fast2) {
		long startTime = System.currentTimeMillis();

		RepairImpl ci = new RepairImpl();
		List<Object> rs = ci.FastRepairTime(fast1, fast2);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按时间段搜索维修记录耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 根据维修单号查询出库记录
	 * 
	 * @param num
	 * @return
	 */
	public List<WareRecord> OutWareHouseRecord(String num) {
		long startTime = System.currentTimeMillis();

		WareImpl ci = new WareImpl();
		List<WareRecord> rs = ci.OutWareHouseRecord(num);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询出库记录耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 查询维修详细记录
	 * 
	 * @param id
	 * @return
	 */
	public RepairRecord RepairRecordByWRId(int id) {
		long startTime = System.currentTimeMillis();

		RepairImpl ci = new RepairImpl();
		RepairRecord rs = ci.RepairRecordByWRId(id);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询维修记录耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 出库
	 */
	public String OutWareRecord(OutWare ow) {

		double ccc = ow.getDocount();

		if (!(ow.getType() == 1 || ow.getType() == 2))
			return "DoType Error!";
		long startTime = System.currentTimeMillis();
		WareImpl wi = new WareImpl();

		List<WareRecord> ll = wi.OutWareHouseRecord(ow.getGetuser());

		for (int i = 0; i < ll.size(); i++) {
			WareRecord wr = ll.get(i);

			if (wr.getProductnumber().equals(ow.getProductnum()))
				return "existence";
		}

		String rs = "";
		List<WareRecord> list = wi.SelectWareListByNumber(ow.getProductnum());
		List<WareRecord> t = new ArrayList<WareRecord>();

		for (int i = 0; i < list.size(); i++) {

			if (list.get(i).getOutprice() == ow.getPrice()
					&& list.get(i).getWarehouse() == ow.getWarehouseid()) {
				t.add(list.get(i));
			}

		}

		list = t;
		// 至此为止，list为所有可操作的订单

		// 合并价格相同的产品，数量累加
		for (int i = 0; i < list.size(); i++) {
			WareRecord wr = list.get(i);

			// 待操作数量大于库存--出干净
			if (ow.getDocount() >= wr.getCount()) {
				double temp = wr.getCount() - ow.getDocount();
				if (temp < 0)
					temp = 0;

				ow.setDocount(ow.getDocount() - wr.getCount());
				if (ow.getDocount() == wr.getCount())
					ow.setDocount(ow.getDocount());
				if (temp == 0)
					wr.setIstrue(0);
				else
					wr.setIstrue(1);

				wr.setFid(wr.getId());
				wr.setDocount(wr.getCount());
				wr.setCount(temp);
				wr.setDotype(3);
				wr.setDouser(ow.getDouser());
				wr.setGetuser(ow.getGetuser());
				wr.setTime(new Date());
				wi.setWrIsfalse(wr.getOrdernumber(), wr.getProductnumber());
				Serializable si = wi.AddWareRecord(wr);

				RepairImpl ri = new RepairImpl();
				RepairRecord rr = new RepairRecord();
				rr.setAmount(wr.getDocount());
				rr.setRepairnum(ow.getGetuser());
				rr.setTime(new Date());
				rr.setTotal(ow.getPrice());
				rr.setType(0);
				rr.setWrid(Integer.parseInt(si.toString()));
				ri.AddRepairRecord(rr);

			} else {
				wr.setFid(wr.getId());
				wr.setCount(wr.getCount() - ow.getDocount());
				wr.setDocount(ow.getDocount());
				wr.setDotype(3);
				wr.setIstrue(1);
				wr.setDouser(ow.getDouser());
				wr.setGetuser(ow.getGetuser());
				wr.setTime(new Date());
				wi.setWrIsfalse(wr.getOrdernumber(), wr.getProductnumber());
				Serializable si = wi.AddWareRecord(wr);

				RepairImpl ri = new RepairImpl();
				RepairRecord rr = new RepairRecord();
				rr.setAmount(wr.getDocount());
				rr.setRepairnum(ow.getGetuser());
				rr.setTime(new Date());
				rr.setTotal(ow.getPrice());
				rr.setType(0);
				rr.setWrid(Integer.parseInt(si.toString()));
				ri.AddRepairRecord(rr);

				ow.setDocount(0);
			}

			if (ow.getDocount() == 0)
				break;

		}

		rs = Success;

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("商品出库耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public String RevokeOutWare(String id, String wrid) {
		long startTime = System.currentTimeMillis();

		String rs = "";

		WareImpl wi = new WareImpl();
		RepairImpl ri = new RepairImpl();

		WareRecord rr = wi.WareRecordById(Integer.parseInt(wrid));
		if (rr == null) {
			rs = "not find";
		} else {
			WareRecord rrr = wi.WareRecordById(rr.getFid());
			rrr.setIstrue(1);
			wi.UpdateWareRecordById(rrr);
			wi.DeleteWareRecordById(rr.getId());
			ri.DeleteRepairRecordById(Integer.parseInt(id));
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询出库记录耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 维修记录
	 * 
	 * @return
	 */
	public List<Repair> RepairedList() {
		long startTime = System.currentTimeMillis();

		RepairImpl ci = new RepairImpl();
		List<Repair> rs = ci.RepairedList();

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询正在维修车辆耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 添加维修项目
	 * 
	 * @param rr
	 * @return
	 */
	public String AddArtificialRepair(RepairRecord rr) {
		long startTime = System.currentTimeMillis();
		String rs = "";
		if (rr == null)
			rs = Fail;
		else {
			RepairImpl ci = new RepairImpl();
			rr.setTime(new Date());
			rr.setWrid(0);
			rr.setType(1);
			ci.AddRepairRecord(rr);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加维修项目耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 添加维修项目
	 * 
	 * @param rr
	 * @return
	 */
	public List<RepairRecord> ArtificialRepair(String repairnum) {
		long startTime = System.currentTimeMillis();
		RepairImpl ci = new RepairImpl();
		List<RepairRecord> rs = ci.RepairRecordByRepairnum(repairnum, 1);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询维修项目耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public String NumToCN(String s) {
		return NumberToCN.number2CNMontrayUnit(new BigDecimal(s));
	}

	/**
	 * 添加现金流水记录
	 * 
	 * @param cf
	 * @return
	 */
	public String PayReapirOrder(Cashflow cf) {
		long startTime = System.currentTimeMillis();
		// System.out.println(cf.getPayuser());
		String rs = "";
		if (cf == null)
			rs = Fail;
		else {

			if (cf.getPaytype() == 2) {
				User u = VipByUserNum(cf.getPayuser());
				if (u == null) {
					return "vip not find";
				}
				if (u.getExpdate().before(new Date())) {
					return "vip be overdue";
				}
				if (u.getBalance() < cf.getReallytotal()) {
					return "not sufficient funds";
				}

				UserImpl ui = new UserImpl();
				ui.UpdateUserBalance(cf.getPayuser(), u.getBalance()
						- cf.getReallytotal(), u.getExpdate());
			}

			if (cf.getPaytype() == 3)
				cf.setIstrue(0);
			else
				cf.setIstrue(1);
			CashflowImpl ci = new CashflowImpl();
			int cid = cf.getFid();
			ci.IstrueById(cid);
			cf.setTime(new Date());
			cf.setOrdertype("repair");
			Serializable id = ci.AddCashflow(cf);

			RepairImpl ri = new RepairImpl();

			ri.UpdateRepairState(cf.getNumber(), 1, Integer.parseInt(id
					.toString()));

			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询维修项目耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 反审核
	 * 
	 * @param cf
	 * @return
	 */
	public String PayInfoReturned(String num) {
		long startTime = System.currentTimeMillis();
		// System.out.println(cf.getPayuser());
		String rs = "";
		if (num == null)
			rs = Fail;
		else {

			RepairImpl ri = new RepairImpl();
			ri.UpdateRepairState(num, 0, 0);

			CashflowImpl ci = new CashflowImpl();
			ci.DeleteInfo(num);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("反审核耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 添加现金流水记录
	 * 
	 * @param cf
	 * @return
	 */
	public String PayReturned(Cashflow cf) {
		long startTime = System.currentTimeMillis();
		// System.out.println(cf.getPayuser());
		String rs = "";
		if (cf == null)
			rs = Fail;
		else {

			if (cf.getPaytype() == 2) {
				User u = VipByUserNum(cf.getPayuser());
				if (u == null) {
					return "vip not find";
				}
				if (u.getExpdate().before(new Date())) {
					return "vip be overdue";
				}
				if (u.getBalance() < cf.getReallytotal()) {
					return "not sufficient funds";
				}

				UserImpl ui = new UserImpl();
				ui.UpdateUserBalance(cf.getPayuser(), u.getBalance()
						- cf.getReallytotal(), u.getExpdate());
			}

			if (cf.getPaytype() == 3)
				cf.setIstrue(0);
			else
				cf.setIstrue(1);
			CashflowImpl ci = new CashflowImpl();
			int cid = cf.getFid();
			ci.IstrueById(cid);
			cf.setTime(new Date());
			cf.setOrdertype("returned");
			Serializable id = ci.AddCashflow(cf);

			RepairImpl ri = new RepairImpl();

			ri.UpdateRepairState(cf.getNumber(), 1, Integer.parseInt(id
					.toString()));

			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询维修项目耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public Cashflow CashFlowByNum(String num) {
		long startTime = System.currentTimeMillis();

		CashflowImpl ci = new CashflowImpl();
		Cashflow rs = ci.CashFlowByNum(num);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("Num查询流水耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public Cashflow CashFlowById(String id) {
		long startTime = System.currentTimeMillis();

		CashflowImpl ci = new CashflowImpl();
		Cashflow rs = ci.CashFlowById(Integer.parseInt(id));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("Id查询流水耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 某辆车的维修记录
	 * 
	 * @return
	 */
	public List<Repair> CarRepairedRecord(int carid) {
		long startTime = System.currentTimeMillis();

		RepairImpl ci = new RepairImpl();
		List<Repair> rs = ci.RepairByCarid(carid);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询某辆车维修记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 某辆车的使用人记录
	 * 
	 * @return
	 */
	public List<FastCarRecord> AllFastCarRecord(String carnum) {
		long startTime = System.currentTimeMillis();

		CarImpl ci = new CarImpl();
		List<FastCarRecord> rs = ci.FastCarRecordByCarnum(carnum);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询某辆车的使用人记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	public List<Cashflow> ArrearsList() {
		long startTime = System.currentTimeMillis();

		CashflowImpl ci = new CashflowImpl();
		List<Cashflow> rs = ci.ArrearsList();

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询维修未结款记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public List<Cashflow> ReturnedWareList() {
		long startTime = System.currentTimeMillis();

		CashflowImpl ci = new CashflowImpl();
		List<Cashflow> rs = ci.ReturnedList();

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询退货未结款记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 员工损耗出库
	 */
	public String OutWareRecordByDouser(OutWare ow) {

		long startTime = System.currentTimeMillis();

		double ccc = ow.getDocount();
		String rs = "";
		if (ow.getType() != 2)
			return "DoType Error!";
		WareImpl wi = new WareImpl();
		WareRecord list = new WareRecord();
		WareRecord wr = wi.SelectWareRecordIstureByNumberAndProcuct(ow
				.getOrdernum(), ow.getProductnum());
		// 至此为止，wr为所有可操作的订单
		wi.setWrIsfalse(wr.getOrdernumber(), wr.getProductnumber());
		// wr.setIstrue(0);与上相同
		// 父id为无效
		list.setOrdernumber(wr.getOrdernumber());
		list.setProductnumber(wr.getProductnumber());
		list.setOutprice(wr.getOutprice());
		list.setDotype(2);
		list.setDocount(ccc);
		list.setCount(wr.getCount() - ccc);
		list.setDouser(ow.getDouser());
		list.setGetuser(ow.getGetuser());
		list.setTime(new Date());
		list.setWarehouse(wr.getWarehouse());
		list.setFid(wr.getId());
		list.setDepartment(ow.getDepartment());
		// 判断isture为0
		if (ccc == wr.getCount())
			list.setIstrue(0);
		else
			list.setIstrue(1);
		// 添加新有效记录
		wi.AddWareRecord(list);

		// 进出账记录 // 添加资金流
		CashflowImpl ci = new CashflowImpl();
		Cashflow cf = new Cashflow();
		cf.setType(1);
		cf.setNumber(ow.getOrdernum());
		cf.setOrdertype("UserOutWare");
		cf.setDouser(ow.getDouser());
		cf.setPaytype(1);
		cf.setIstrue(1);
		cf.setTime(new Date());
		cf.setTotal(ow.getPrice() * ow.getDocount());
		cf.setReallytotal(ow.getPrice() * ow.getDocount());
		cf.setFid(0);
		cf.setPayuser(Integer.toString(ow.getDepartment()));
		ci.AddCashflow(cf);

		rs = Success;

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("员工损耗出库耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 查询所有的有效在库记录
	 * 
	 * @param
	 * @return
	 */
	public List<WareRecord> GetWareRecordList(int wh) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		List<WareRecord> list = wi.SelectWareListByIsture(wh);

		// List<WareRecord> temp = new ArrayList<WareRecord>();

		// 合并价格相同的产品，数量累加
		// for (int i = 0; i < list.size(); i++) {
		// boolean tag = true;// 标记变量
		// int j = 0;
		// for (j = 0; j < temp.size(); j++) {
		// if (list.get(i).getOutprice() == temp.get(j).getOutprice()
		// && list.get(i).getWarehouse() == temp.get(j)
		// .getWarehouse()) {
		// tag = false;
		// int c = temp.get(j).getCount() + list.get(i).getCount();
		// WareRecord s = temp.get(j);
		// s.setCount(c);
		//
		// temp.remove(j);
		// temp.add(s);
		//
		// break;
		// }
		// }
		//
		// if (tag) {
		// temp.add(list.get(i));
		// }
		//
		// }
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询有效在库记录耗时：" + Float.toString(seconds) + " 秒");
		return list;
	}

	/**
	 * 快速搜索
	 * 
	 * @param fast
	 * @return
	 */
	public Object FastConsumption(String fast, String id, String wh) {
		long startTime = System.currentTimeMillis();
		WareImpl ci = new WareImpl();
		Object rs = ci.FastConsumptionList(fast, Integer.parseInt(id), Integer
				.parseInt(wh));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索有效在库列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	// @Test
	// public void ax() {
	// System.out.println(FastConsumption("3", 1).size());
	// }

	public String Recharge(String usernum, String recharge, String time1,
			String unit, String douser, String payment) {
		long startTime = System.currentTimeMillis();

		String rs = "";

		UserImpl oi = new UserImpl();

		User c = oi.SelectUserByUsernum(usernum);
		Calendar cl = Calendar.getInstance();
		cl.setTime(c.getExpdate());
		if (unit.trim().equals("y")) {
			cl.add(Calendar.YEAR, Integer.parseInt(time1));
		} else if (unit.trim().equals("m")) {
			cl.add(Calendar.MONTH, Integer.parseInt(time1));
		}
		c.setExpdate(cl.getTime());

		c.setBalance(c.getBalance() + Double.parseDouble(recharge));

		// 时间加减

		// 下面 写更新到数据库和添加流水记录
		if (Double.parseDouble(recharge) != 0) {
			oi.UpdateUserBalance(usernum, c.getBalance(), c.getExpdate());
			CashflowImpl ci = new CashflowImpl();
			Cashflow cf = new Cashflow();
			cf.setType(1);
			cf.setOrdertype("recharge");
			cf.setNumber(usernum);
			cf.setDouser(douser);
			cf.setIstrue(1);
			cf.setTime(new Date());
			cf.setPaytype(Integer.parseInt(payment));
			cf.setTotal(Double.parseDouble(recharge));
			cf.setReallytotal(Double.parseDouble(recharge));
			ci.AddCashflow(cf);
		}

		rs = "success";
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("VIP充值耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public Admin AdminByUsername(String username) {
		long startTime = System.currentTimeMillis();

		AdminImpl ci = new AdminImpl();
		Admin rs = ci.AdminUserByUsername(username);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("根据username查询Admin记录耗时：" + Float.toString(seconds)
				+ " 秒");
		return rs;
	}

	/**
	 * 查询订单在库记录 中有效的记录
	 * 
	 * @param number
	 * @return
	 */
	public List<WareRecord> GetIstureWareRecordList(String number) {
		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		List<WareRecord> list = wi.SelectWareListByNumber(number);
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询在库记录耗时：" + Float.toString(seconds) + " 秒");
		return list;
	}

	/**
	 * 根据productnumberandproductnumber查订单详情
	 * 
	 * @param s
	 * @return
	 */
	public OrderList OrderListByProductNumberAndNumber(String productnumber,
			String number) {
		long startTime = System.currentTimeMillis();
		OrderList rs;
		OrderImpl oi = new OrderImpl();
		rs = oi.OrderListByProductNumberAndNumber(productnumber, number);
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("根据货号订单号查询订单详情列表耗时：" + Float.toString(seconds)
				+ " 秒");
		return rs;
	}

	/**
	 * 增加新洗车卡
	 * 
	 * @param carwash
	 * @param douser
	 * @return
	 */
	public String AddCarWash(CarWash carwash, Map douser) {

		long startTime = System.currentTimeMillis();
		String rs = "";
		CarWashImpl oi = new CarWashImpl();
		CarWash c = oi.CarWashByNum(carwash.getNumber());
		carwash.setTime(new Date());
		carwash.setDouser(((Admin) douser.get("adminuser")).getUsername());
		carwash.setIstrue("1");
		// 添加记录
		CarWashImpl ci = new CarWashImpl();
		CarWashRecord cwr = new CarWashRecord();
		cwr.setDotype(1);
		cwr.setName(carwash.getName());
		cwr.setNumber(carwash.getNumber());
		cwr.setDouser(((Admin) douser.get("adminuser")).getUsername());
		cwr.setOutprice(carwash.getBalance());
		cwr.setTime(new Date());
		cwr.setResiduedegree(carwash.getResiduedegree());
		cwr.setPayment(carwash.getPayment());
		ci.AddCarWashRecord(cwr);
		if (c != null)
			rs = "existence";
		else {
			oi.AddCarWash(carwash);
			rs = Success;
		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加洗车卡耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	// @Test
	// public void a() {
	// CarWash c = new CarWash();
	// c.setNumber("4321");
	// c.setName("mahaojie");
	// c.setTel("12343123");
	// c.setResiduedegree(11);
	// // c.setBalance(4000);
	// c.setExpdate(new Date());
	// c.setPayment(0);
	// c.setDouser("admin");
	// // AddCarWash(c);
	// }

	/**
	 * 根据卡号查询洗车卡
	 * 
	 * @param number
	 * @return
	 */
	public CarWash CarWashByNum(String number) {
		long startTime = System.currentTimeMillis();

		CarWash rs = null;
		CarWashImpl oi = new CarWashImpl();
		rs = oi.SelectCarWashByNumber(number);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("根据卡号查询洗车卡耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据卡号查询洗车记录
	 * 
	 * @param number
	 * @return
	 */
	public List<CarWashRecord> CarWashRecordByNum(String number) {
		long startTime = System.currentTimeMillis();

		CarWashImpl oi = new CarWashImpl();
		List<CarWashRecord> rs = oi.SelectCarWashRecordByNumber(number);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("根据卡号查询洗车卡消费记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 洗车卡列表
	 */
	public List<CarWash> CarWashList(String page) {

		long startTime = System.currentTimeMillis();

		CarWashImpl oi = new CarWashImpl();
		List<CarWash> rs = oi.AllCarWareByTimeDesc(PageUtil.createPage(100000,
				oi.CarWashCount(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询洗车表列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 
	 * @param number
	 * @param douser
	 * @param time1
	 * @param unit
	 * @param recharge
	 * @param rechargetime
	 * @param payment
	 * @return
	 */
	public String CarWashRecharge(String number, String douser, String time1,
			String unit, String recharge, String rechargetime, String payment) {
		long startTime = System.currentTimeMillis();

		String rs = "";

		CarWashImpl oi = new CarWashImpl();

		CarWash c = oi.CarWashByNum(number);
		Calendar cl = Calendar.getInstance();
		cl.setTime(c.getExpdate());
		if (unit.trim().equals("y")) {
			cl.add(Calendar.YEAR, Integer.parseInt(time1));
		} else if (unit.trim().equals("m")) {
			cl.add(Calendar.MONTH, Integer.parseInt(time1));
		}
		c.setExpdate(cl.getTime());
		c.setResiduedegree(c.getResiduedegree()
				+ Integer.parseInt(rechargetime));
		// c.setBalance(c.getBalance() + Double.parseDouble(recharge));

		// 时间加减

		// 更新与添加
		if (Double.parseDouble(recharge) != 0) {
			oi.UpdateCarWash(number, c.getExpdate(), c.getResiduedegree());
			CarWashImpl ci = new CarWashImpl();
			CarWashRecord cwr = new CarWashRecord();
			cwr.setDotype(1);
			cwr.setName(c.getName());
			cwr.setNumber(number);
			cwr.setDouser(douser);
			cwr.setOutprice(Double.parseDouble(recharge));
			cwr.setTime(new Date());
			cwr.setResiduedegree(Integer.parseInt(rechargetime));
			cwr.setPayment(Integer.parseInt(payment));
			ci.AddCarWashRecord(cwr);
		}

		rs = "success";
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("洗车卡充值耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 快速搜索出库列表
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object[]> FastOutWareList(String fast) {
		long startTime = System.currentTimeMillis();

		WareImpl ci = new WareImpl();
		List<Object[]> rs = ci.FastOutWareList(fast);
		for (int i = 0; i < rs.size(); i++) {
			String adname = rs.get(i)[4].toString();
			if (isNumeric(adname) == false) {
				AdminImpl ai = new AdminImpl();
				Admin ad = ai.AdminUserByUsername(adname);
				// 下一步把ad.getname给【4】
				rs.get(i)[4] = ad.getName();
			}
			int department = Integer.parseInt(rs.get(i)[9].toString());
			String departmentName = DepartmentById(department)
					.getDepartmentname();
			rs.get(i)[9] = departmentName;

		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索出库列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public static boolean isNumeric(String str) {
		for (int i = 0; i < str.length(); i++) {
			// System.out.println(str.charAt(i));
			if (!Character.isDigit(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 快速搜索洗车卡列表
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastCarWashList(String fast) {
		long startTime = System.currentTimeMillis();
		CarWashImpl ci = new CarWashImpl();
		List<Object> rs = ci.FastCarWashList(fast);
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索洗车卡列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 刷卡洗车
	 * 
	 * @param fast
	 * @return
	 */
	public String SwipingCard(String number) {
		long startTime = System.currentTimeMillis();
		String r = "";
		// 洗车卡次数减一
		CarWashImpl ci = new CarWashImpl();
		CarWash c = ci.CarWashByNum(number);
		int residuedegree = c.getResiduedegree() - 1;
		System.out.println(residuedegree);
		ci.UpdateCarWashResidueDegree(residuedegree, number);
		// 更新到添加记录
		CarWashRecord cwr = new CarWashRecord();
		cwr.setDotype(0);
		cwr.setName(c.getName());
		cwr.setNumber(number);
		cwr.setDouser(c.getDouser());
		cwr.setTime(new Date());
		cwr.setResiduedegree(1);
		cwr.setPayment(5);
		ci.AddCarWashRecord(cwr);
		r = "刷卡成功";
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("洗车刷卡耗时：" + Float.toString(seconds) + " 秒");
		return r;
	}

	/**
	 * 公有快车列表
	 */
	public List<FastCarList> AllPublicFastCarByTimdeDecs(String page) {

		long startTime = System.currentTimeMillis();

		FastCarListImpl oi = new FastCarListImpl();
		List<FastCarList> rs = oi.AllPublicFastCarListByTimeDesc(PageUtil
				.createPage(10000, oi.PublicFastCarCount(), Integer
						.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询公有快车列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 私有快车列表
	 */
	public List<FastCarList> AllPrivateFastCarByTimeDesc(String page) {

		long startTime = System.currentTimeMillis();

		FastCarListImpl oi = new FastCarListImpl();
		List<FastCarList> rs = oi.AllPrivateFastCarListByTimeDesc(PageUtil
				.createPage(10000, oi.PrivateFastCarCount(), Integer
						.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询私有快车列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 添加新车辆
	 * 
	 * @param car
	 * @param douser
	 * @return
	 */
	public String AddFastCar(FastCarList fastcarlist) {
		long startTime = System.currentTimeMillis();
		String rs = "";
		System.out.println("111111");
		FastCarListImpl oi = new FastCarListImpl();
		FastCarList c = oi.FastCarListByNum(fastcarlist.getCarnum());

		System.out.println("FastCarListByNum");
		fastcarlist.setTime(new Date());
		// fastcarlist.setInsureoffer(fastcarlist.getInsureoffer());
		System.out.println(fastcarlist.getInsureoffer());
		if (c != null)
			rs = "existence";
		else {
			oi.AddFastCarList(fastcarlist);
			rs = Success;
		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加公有快车耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 根据ID查询车辆
	 * 
	 * @param id
	 * @return
	 */
	public FastCarList SelectFastCarbyId(String id) {
		long startTime = System.currentTimeMillis();

		FastCarListImpl oi = new FastCarListImpl();
		FastCarList rs = oi.FastCarListById(Integer.parseInt(id));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("根据ID=" + id + "查询快车车辆耗时：" + Float.toString(seconds)
				+ " 秒");
		System.out.println(rs.getUserdiscount());
		return rs;
	}

	public String UpdataFastCar(FastCarList fastcarlist, Map douser) {
		long startTime = System.currentTimeMillis();
		String rs = "";

		FastCarListImpl oi = new FastCarListImpl();

		fastcarlist.setTime(new Date());
		oi.UpdateFastCarList(fastcarlist);

		// FastCarRecord fr = new FastCarRecord();
		// fr.setCarnum(fastcarlist.getCarnum());
		// fr.setFramenum(fastcarlist.getFramenum());
		// fr.setContractaddress(fastcarlist.getContractaddress());
		// fr.setContractidentity(fastcarlist.getContractidentity());
		// fr.setContractname(fastcarlist.getContractname());
		// fr.setContracttel(fastcarlist.getContracttel());
		// fr.setMileage(fastcarlist.getMileage());
		// fr.setModel(fastcarlist.getModel());
		// fr.setTime(new Date());
		// oi.AddFastCarRecord(fr);
		rs = Success;
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("更新快车车辆耗时：" + Float.toString(seconds) + " 秒");
		return rs;

	}

	/**
	 * 快速搜索快车
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastFastCar(String fast) {
		long startTime = System.currentTimeMillis();

		FastCarListImpl ci = new FastCarListImpl();
		List<Object> rs = ci.FastCarList(fast);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速快车耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 快速私有搜索快车
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastFastCarOne(String fast) {
		long startTime = System.currentTimeMillis();

		FastCarListImpl ci = new FastCarListImpl();
		List<Object> rs = ci.FastCarListone(fast);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速快车耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 *退货仓库
	 * 
	 * @return
	 */
	public List<WareRecord> ReturnedList(int wh) {
		long startTime = System.currentTimeMillis();

		WareImpl ci = new WareImpl();
		List<WareRecord> rs = ci.SelectWareListByWareHouse(wh);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询某仓库所有有效库存耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public int AddReturned(ReturnedWare rw, Map douser) {
		long startTime = System.currentTimeMillis();
		int rs ;
		// 添加资金流
		CashflowImpl ci = new CashflowImpl();
		Cashflow cf = new Cashflow();
		cf.setType(1);
		cf.setNumber(rw.getOrdernumber());
		cf.setOrdertype("returned");
		cf.setDouser(((Admin) douser.get("adminuser")).getUsername());
		cf.setPaytype(rw.getPaytype());
		if (rw.getPaytype() == 3)
			cf.setIstrue(0);
		else
			cf.setIstrue(1);
		cf.setTime(new Date());
		cf.setTotal(rw.getAllprice());
		cf.setReallytotal(rw.getAllprice());
		cf.setFid(0);
		cf.setPayuser(rw.getProductnumber());
		ci.AddCashflow(cf);
		// 添加退货记录
		WareImpl oi = new WareImpl();
		rw.setDouser(((Admin) douser.get("adminuser")).getUsername());
		rw.setTime(new Date());
		oi.AddReturnedWareRecord(rw);
		WareImpl wi = new WareImpl();
		// 查找到具体订单
		WareRecord wr = wi.SelectWareRecordIstureByNumberAndProcuct(rw
				.getOrdernumber(), rw.getProductnumber());
		WareRecord wr2 = new WareRecord();
		if (wr.getCount() == rw.getCount())
			wr2.setIstrue(0);// 退货等于库存时

		else
			wr2.setIstrue(1);// 退货小于库存时

		wr2.setOrdernumber(rw.getOrdernumber());
		wr2.setProductnumber(rw.getProductnumber());
		wr2.setOutprice(wr.getOutprice());
		wr2.setCount(wr.getCount() - rw.getCount());
		wr2.setDouser(((Admin) douser.get("adminuser")).getUsername());
		wr2.setTime(new Date());
		wr2.setWarehouse(rw.getWarehouse());
		wr2.setDocount(rw.getCount());
		wr2.setGetuser(rw.getOrdernumber());
		wr2.setFid(wr.getId());
		wr2.setDotype(3);
		
		wi.setWrIsfalse(rw.getOrdernumber(), rw.getProductnumber());
		wi.AddWareRecord(wr2);
		rs = wi.FindNewId().getId();
		
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("退货耗时：" + Float.toString(seconds) + " 秒");
		return rs;

	}

	/**
	 * 按时间点搜索
	 * 
	 * @param fast
	 * @return
	 */
	public WareRecord ReturnInfo() {
		long startTime = System.currentTimeMillis();

		WareRecord rs = null ;
		WareImpl wi = new WareImpl();
		rs = wi.FindNewId();
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("退货单耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 按时间点搜索
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastReturnedTime1(String fast1, String wh) {
		long startTime = System.currentTimeMillis();

		WareImpl ci = new WareImpl();
		List<Object> rs = ci.FastReturnedTime1(fast1, wh);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按时间点搜索退货库存耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 快速搜索维修记录
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastReturned(String fast, String wh) {
		long startTime = System.currentTimeMillis();

		WareImpl ci = new WareImpl();
		List<Object> rs = ci.FastReturned(fast, wh);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索退货记录耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 按时间段搜索
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastReturnedTime(String fast1, String fast2, String wh) {
		long startTime = System.currentTimeMillis();

		WareImpl ci = new WareImpl();
		List<Object> rs = ci.FastReturnedTime1(fast1, fast2, wh);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按时间段搜索退货库存耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 添加申请
	 * 
	 * @param purchase
	 * @param douser
	 * @return
	 */
	public String AddPurchase(Purchase purchase, Map douser) {
		long startTime = System.currentTimeMillis();

		String rs = "";
		PurchaseImpl pi = new PurchaseImpl();
		Purchase p = new Purchase();
		p.setMaterial(purchase.getMaterial());
		p.setTime(new Date());
		p.setProposer(((Admin) douser.get("adminuser")).getUsername());
		p.setCount(purchase.getCount());
		p.setUnit(purchase.getUnit());
		p.setSpecifications(purchase.getSpecifications());
		p.setMadein(purchase.getMadein());
		p.setModels(purchase.getModels());
		p.setPrice(purchase.getPrice());
		p.setUseto(purchase.getUseto());
		p.setAuditor(0);

		pi.AddPurchase(p);
		rs = Success;

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加采购申请耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 采购申请列表
	 */
	public List<Purchase> AllPurchaseByTimdeDecs(String page) {

		long startTime = System.currentTimeMillis();

		PurchaseImpl oi = new PurchaseImpl();
		List<Purchase> rs = oi.PurchaseList(PageUtil.createPage(100000, oi
				.PurchaseCount(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询采购申请列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 通过申请
	 */
	public String UpdateAuditor(int id) {
		long startTime = System.currentTimeMillis();
		String rs = "";
		if ((Object) id == null)
			rs = "false";
		else {
			PurchaseImpl oi = new PurchaseImpl();
			oi.AuditorById(id);
			rs = Success;
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("通过申请耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 快速搜索申请
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastPurchase(String fast) {
		long startTime = System.currentTimeMillis();

		PurchaseImpl ci = new PurchaseImpl();
		List<Object> rs = ci.FastPurchase(fast);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索申请耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 按时间点搜索
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastPurchaseTime1(String fast1) {
		long startTime = System.currentTimeMillis();

		PurchaseImpl ci = new PurchaseImpl();
		List<Object> rs = ci.FastTime1(fast1);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按时间点搜索申请耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 按时间段搜索
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastPurchaseTime(String fast1, String fast2) {
		long startTime = System.currentTimeMillis();

		PurchaseImpl ci = new PurchaseImpl();
		List<Object> rs = ci.FastTime(fast1, fast2);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("按时间段搜索申请耗时：" + Float.toString(seconds) + " 秒");

		return rs;
	}

	/**
	 * 库存列表
	 */
	public List<Object> InventoryList(String page, String value1) {

		long startTime = System.currentTimeMillis();

		WareImpl oi = new WareImpl();
		List<Object> rs = oi.InventoryList(PageUtil.createPage(100000, oi
				.InventoryCount(), Integer.parseInt(page)), Integer
				.parseInt(value1));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询订单列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 快速搜索库存列表
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastInventory(String fast, String value2) {
		long startTime = System.currentTimeMillis();

		WareImpl oi = new WareImpl();
		List<Object> rs = oi.FastInventory(fast, Integer.parseInt(value2));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索库存列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public String UpdateSupp(Suppliers supp) {
		long startTime = System.currentTimeMillis();

		String rs = "";
		SuppliersImpl si = new SuppliersImpl();
		Suppliers s = new Suppliers();
		s.setFastname(supp.getFastname());
		s.setId(supp.getId());
		s.setName(supp.getName());
		s.setTel(supp.getTel());
		si.UpdateSupplier(s);
		rs = Success;
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("修改供应商耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 转出仓库
	 * 
	 * @return
	 */
	public String RollOut(String id, String wc, String wh) {
		long startTime = System.currentTimeMillis();
		double wcc = Double.parseDouble(wc);
		WareImpl wi = new WareImpl();
		String rs = "";
		// 首先先根据id找到转出前的数据
		WareRecord wr = wi.SelectWareListById(Integer.parseInt(id));
		// 接着把数量，仓库对应准了，插入一条数据
		WareRecord wr2 = new WareRecord();
		wr2.setCount(wcc);
		wr2.setDocount(wcc);
		wr2.setDotype(0);
		wr2.setFid(wr.getId());
		wr2.setGetuser(wr.getGetuser());
		wr2.setIstrue(1);
		wr2.setOrdernumber(wr.getOrdernumber());
		wr2.setOutprice(wr.getOutprice());
		wr2.setTime(new Date());
		wr2.setProductnumber(wr.getProductnumber());
		wr2.setWarehouse(Integer.parseInt(wh));
		wr2.setDouser(wr.getDouser());
		wi.AddWareRecord(wr2);
		// 最后把传出前的数量更改好(要考虑count与wc的数量关系)
		if (wr.getCount() > wcc) {
			wi.UpdateWareRecordCountById(Integer.parseInt(id), wr.getCount()
					- wcc);
		} else if (wr.getCount() == wcc) {
			wi.UpdateWareRecordAllById(Integer.parseInt(id), Double.parseDouble(wc));
		}
		Allot a = new Allot();
		a.setCallout(wr.getWarehouse());
		a.setCallin(Integer.parseInt(wh));
		a.setOrdernumber(wr.getOrdernumber());
		a.setProductnumber(wr.getProductnumber());
		a.setTime(new Date());
		a.setCount(wc);
		wi.AddAllot(a);
		rs = Success;

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加新仓库耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 调拨列表
	 */
	public List<Allot> AllotList(String page) {

		long startTime = System.currentTimeMillis();

		WareImpl wi = new WareImpl();
		List<Allot> rs = wi.AllAllot(PageUtil.createPage(100000, wi
				.AllotCount(), Integer.parseInt(page)));

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询调拨列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	/**
	 * 快速搜索调拨列表
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastAllot(String fast) {
		long startTime = System.currentTimeMillis();

		WareImpl oi = new WareImpl();
		List<Object> rs = oi.FastAllot(fast);

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("快速搜索调拨列表耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}
}
