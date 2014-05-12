package com.sand.crypto;

public class SandInterce {
	
	public static final String[] SAND_AC=new String[]{"Q0001","Q0002","0204"};
	public static final String MEMID="-3";
	public static final String MID="888002199990015";
	public static final String DES_KEY="237E5B1590882CFE";
	
	
	private String ac;//ac: 0204(充值) / Q0001(余额查询) / Q0002(交易记录查询)
	private String mid;//mid: 888002199990015 (漕河泾测试识别号)
	private String signCardNo;//singCardNo: 3des密文(测试卡号: 7280005200000011, 
	                          //3des后应该是2D1F938F69C54C0B2109F13446211A22)
	private String memid;//memid: -3(漕河泾固定上送 -3)
	private String sign;//sign: (采用SHA1方式计算, 具体描述在后面)
	public SandInterce() {
		super();
	}
	
	public SandInterce(String ac, String mid, String signCardNo, String memid,
			String sign) {
		super();
		this.ac = ac;
		this.mid = mid;
		this.signCardNo = signCardNo;
		this.memid = memid;
		this.sign = sign;
	}

	public String getAc() {
		return ac;
	}
	public void setAc(String ac) {
		this.ac = ac;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getSignCardNo() {
		return signCardNo;
	}

	public void setSignCardNo(String signCardNo) {
		this.signCardNo = signCardNo;
	}

	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
		
}
