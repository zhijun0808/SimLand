package com.simland.core.module.shop.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.simland.core.base.SystemConstants;
import com.simland.core.base.Utils;

public class Commodity implements java.io.Serializable {
	
	private static final Log logger = LogFactory.getLog(Commodity.class);
	
	private static final long serialVersionUID = 5454155825314635342L;

	public static final String INVENTORY_KEY = "_inventory_";

	private java.lang.Integer id;
	private java.lang.Integer sid;
	private java.lang.String name;
	private java.lang.String img;
	private java.lang.Integer type;
	private java.lang.Integer collectNum;
	private java.lang.Double marketPrice;
	private java.lang.Double realPrice;
	private java.util.Date createTime;
	private java.lang.String creater;
	private java.lang.Integer isNew;
	private java.lang.Integer isSpecial;
	private java.lang.Integer isVip;

	/****
	 * 640*640 （产品图） 315*315 （两列） 230*230 （加入购物车，选择克数等） 120*120 （收藏等，缩略图）
	 */
	public static final String[][] IMGSIZE = new String[][] { { "640", "640" }, { "315", "315" }, { "230", "230" },
			{ "120", "120" } };

	public static final Integer status_0 = 0;// 默认状态
	public static final Integer status_1 = 1;// 上架
	public static final Integer status_2 = 2;// 下架

	private java.lang.Integer status;
	private Timestamp issueTime;// 发布时间
	private java.lang.String cause;// 下架原因

	private CommodityDetails commodityDetails;

	private CategoryProperties attr1;// 属性1
	private CategoryProperties attr2;// 属性2

	private String attr1Val;// 属性值ID
	private String attr2Val;// 属性值ID

	private String attr1Value;// 属性值
	private String attr2Value;// 属性值

	private List<String[]> attr1List = new ArrayList<String[]>();// 属性1值[id,val]
	private List<String[]> attr2List = new ArrayList<String[]>();// 属性2值[id,val]

	private String[] defaultChose = new String[] { "", "", "", "" };// 默认选择颜色尺码
																	// id,id,val,val
	/***
	 * 商品库存
	 */
	private List<CommodityInventory> cInventoryList;
	/***
	 * 库存MapN<_inventory_attr1_attr2,String[]{"库存","价格","图片",商品编码}>
	 */
	private Map<String, String[]> inventoryMap = new HashMap<String, String[]>();

	private Inventory inventory;
	
	private Shop shop;//店铺信息

	public java.lang.Integer getId() {
		return this.id;
	}

	public void setId(java.lang.Integer value) {
		this.id = value;
	}

	public java.lang.Integer getSid() {
		return this.sid;
	}

	public void setSid(java.lang.Integer value) {
		this.sid = value;
	}

	public java.lang.String getName() {
		return this.name;
	}

	public void setName(java.lang.String value) {
		this.name = value;
	}

	public java.lang.String getImg() {
		return this.img;
	}

	public String getImg(Integer size) {
		if (Utils.isObjectEmpty(size) || Utils.isObjectEmpty(img))
			return img;
		else {
			try {
				String fname = img.replace(img, img.substring(0, img.lastIndexOf(".")) + "_" + IMGSIZE[size][0] + "x"
						+ IMGSIZE[size][1] + img.substring(img.lastIndexOf("."), img.length()));
				return fname;
			} catch (Exception e) {
				logger.error("Commodity getImg:"+e.getMessage());
				return img;
			}
		}
	}

	public void setImg(java.lang.String value) {
		this.img = value;
	}

	public java.lang.Integer getType() {
		return this.type;
	}

	public void setType(java.lang.Integer value) {
		this.type = value;
	}

	public java.lang.Integer getCollectNum() {
		return this.collectNum;
	}

	public void setCollectNum(java.lang.Integer value) {
		this.collectNum = value;
	}

	public java.lang.Double getMarketPrice() {
		return this.marketPrice;
	}

	public void setMarketPrice(java.lang.Double value) {
		this.marketPrice = value;
	}

	public java.lang.Double getRealPrice() {
		return this.realPrice;
	}

	public void setRealPrice(java.lang.Double value) {
		this.realPrice = value;
	}

	public java.util.Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}

	public java.lang.String getCreater() {
		return this.creater;
	}

	public void setCreater(java.lang.String value) {
		this.creater = value;
	}

	public java.lang.Integer getIsNew() {
		return this.isNew;
	}

	public void setIsNew(java.lang.Integer value) {
		this.isNew = value;
	}

	public java.lang.Integer getIsSpecial() {
		return this.isSpecial;
	}

	public void setIsSpecial(java.lang.Integer value) {
		this.isSpecial = value;
	}

	public java.lang.Integer getIsVip() {
		return isVip;
	}

	public void setIsVip(java.lang.Integer isVip) {
		this.isVip = isVip;
	}

	public CommodityDetails getCommodityDetails() {
		return commodityDetails;
	}

	public void setCommodityDetails(CommodityDetails commodityDetails) {
		this.commodityDetails = commodityDetails;
	}

	public Inventory getInventory() {
		return inventory;
	}

	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}

	public CategoryProperties getAttr1() {

		if (attr1 != null)
			return attr1;

		CategoryProperties cp = SystemConstants.categoryPropertiesMap.get(this.type + "");
		if (cp != null && cp.getCategoryProperties1() != null)
			this.attr1 = cp.getCategoryProperties1();

		return attr1 == null ? new CategoryProperties() : attr1;
	}

	public void setAttr1(CategoryProperties attr1) {
		this.attr1 = attr1;
	}

	public CategoryProperties getAttr2() {

		if (attr2 != null)
			return attr2;

		CategoryProperties cp = SystemConstants.categoryPropertiesMap.get(this.type + "");
		if (cp != null && cp.getCategoryProperties2() != null)
			return this.attr2 = cp.getCategoryProperties2();

		return attr2 == null ? new CategoryProperties() : attr2;
	}

	public void setAttr2(CategoryProperties attr2) {
		this.attr2 = attr2;
	}

	public List<String[]> getAttr1List() {
		return attr1List;
	}

	public void setAttr1List(List<String[]> attr1List) {
		this.attr1List = attr1List;
	}

	public List<String[]> getAttr2List() {
		return attr2List;
	}

	public void setAttr2List(List<String[]> attr2List) {
		this.attr2List = attr2List;
	}

	public List<CommodityInventory> getcInventoryList() {
		return cInventoryList;
	}

	public String[] getDefaultChose() {
		return defaultChose;
	}

	public void setDefaultChose(String[] defaultChose) {
		this.defaultChose = defaultChose;
	}

	public String getAttr1Val() {
		return attr1Val;
	}

	public void setAttr1Val(String attr1Val) {
		this.attr1Val = attr1Val;
	}

	public String getAttr2Val() {
		return attr2Val;
	}

	public void setAttr2Val(String attr2Val) {
		this.attr2Val = attr2Val;
	}

	public String getAttr1Value() {
		if (attr1Value != null)
			return attr1Value;

		for (int i = 0; attr1List != null && i < attr1List.size(); i++) {
			if (Utils.isObjectNotEmpty(attr1Val) && attr1Val.equals(attr1List.get(i)[0])) {
				attr1Value = attr1List.get(i)[1];
				break;
			}
		}

		return attr1Value;
	}

	public void setAttr1Value(String attr1Value) {
		this.attr1Value = attr1Value;
	}

	public String getAttr2Value() {
		if (attr2Value != null)
			return attr2Value;

		for (int i = 0; attr2List != null && i < attr2List.size(); i++) {
			if (Utils.isObjectNotEmpty(attr2Val) && attr2Val.equals(attr2List.get(i)[0])) {
				attr2Value = attr2List.get(i)[1];
				break;
			}
		}
		return attr2Value;
	}

	public void setAttr2Value(String attr2Value) {
		this.attr2Value = attr2Value;
	}

	/***
	 * 商品库存查询
	 * 
	 * @param cInventoryList
	 */
	public void setcInventoryList(List<CommodityInventory> cInventoryList) {

		Map<String, String> attrMap1 = new TreeMap<String, String>();
		Map<String, String> attrMap2 = new TreeMap<String, String>();
		for (int i = 0; cInventoryList != null && i < cInventoryList.size(); i++) {
			CommodityInventory ci = cInventoryList.get(i);
			if (ci.getAttr1() != null && ci.getCpvalue1() != null)
				attrMap1.put(String.valueOf(ci.getAttr1()), ci.getCpvalue1());

			if (ci.getAttr2() != null && ci.getCpvalue2() != null)
				attrMap2.put(String.valueOf(ci.getAttr2()), ci.getCpvalue2());

			// if (flag && ci.getNums() > 0) {//默认颜色尺码
			// defaultChose = new String[] { String.valueOf(ci.getAttr1()),
			// String.valueOf(ci.getAttr2()), String.valueOf(ci.getCpvalue1()),
			// String.valueOf(ci.getCpvalue2()) };
			// flag = false;
			// }

			String[] inStr = { String.valueOf(ci.getNums()), String.valueOf(ci.getPrice()), ci.getImage(),
					ci.getProductCode() };

			inventoryMap.put(
					INVENTORY_KEY + Utils.notNullTrim(String.valueOf(ci.getAttr1())) + "_"
							+ Utils.notNullTrim(String.valueOf(ci.getAttr2())), inStr);

		}

		for (Entry<String, String> e : attrMap1.entrySet()) {
			attr1List.add(new String[] { e.getKey(), e.getValue() });
		}

		for (Entry<String, String> e : attrMap2.entrySet()) {
			attr2List.add(new String[] { e.getKey(), e.getValue() });
		}

		attrMap1 = null;
		attrMap2 = null;

		this.cInventoryList = cInventoryList;
	}

	/***
	 * 获取商品sku
	 * 
	 * @param cid
	 * @param attr1Val
	 *            值小的
	 * @param attr2Val
	 *            值大的
	 * @return
	 */
	public static String getCommoditySku(int cid, int attr1Val, int attr2Val) {
		return String.valueOf(cid) + String.valueOf(Math.min(attr1Val, attr2Val))
				+ String.valueOf(Math.max(attr1Val, attr2Val));
	}

	/***
	 * 获取商品sku
	 * 
	 * @param c
	 * @return
	 */
	public static String getCommoditySku(Commodity c) {
		return getCommoditySku(c.getId(), c.getAttr1Val() == null ? 0 : Utils.strToInteger(c.getAttr1Val()),
				c.getAttr2Val() == null ? 0 : Utils.strToInteger(c.getAttr2Val()));
	}

	/***
	 * 根据商品sku获取商品价格
	 * 
	 * @param sku
	 * @return
	 */
	public static Double getCommodityPrice(Commodity c, String sku) {

		if (c.getInventoryMap() == null)
			return 1000000000d;// 默认价格

		String attr1Val = c.getAttr1Val();
		String attr2Val = c.getAttr2Val();
		if (Utils.isObjectEmpty(attr1Val))
			attr1Val = "0";
		if (Utils.isObjectEmpty(attr2Val))
			attr2Val = "0";

		String[] vals = c.getInventoryMap().get(INVENTORY_KEY + attr1Val + "_" + attr2Val);

		return Utils.strToDouble(Utils.getArrayVal(1, vals));
	}

	public Map<String, String[]> getInventoryMap() {
		return inventoryMap;
	}

	public void setInventoryMap(Map<String, String[]> inventoryMap) {
		this.inventoryMap = inventoryMap;
	}

	public Timestamp getIssueTime() {
		return issueTime;
	}

	public void setIssueTime(Timestamp issueTime) {
		this.issueTime = issueTime;
	}

	public java.lang.String getCause() {
		return cause;
	}

	public void setCause(java.lang.String cause) {
		this.cause = cause;
	}

	public java.lang.Integer getStatus() {
		return status;
	}

	public void setStatus(java.lang.Integer status) {
		this.status = status;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}
	
	

}
