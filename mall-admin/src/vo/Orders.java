package vo;
// 테이블 위치 적기
//ex) mall.orders table
public class Orders {
	private int ordersId;
	private int productId;
	private int ordersAmount;
	private int ordersPrice;
	private String membersEmail;
	public int getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(int ordersId) {
		this.ordersId = ordersId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getOrdersAmount() {
		return ordersAmount;
	}
	public void setOrdersAmount(int ordersAmount) {
		this.ordersAmount = ordersAmount;
	}
	public int getOrdersPrice() {
		return ordersPrice;
	}
	public void setOrdersPrice(int ordersPrice) {
		this.ordersPrice = ordersPrice;
	}
	public String getMembersEmail() {
		return membersEmail;
	}
	public void setMembersEmail(String membersEmail) {
		this.membersEmail = membersEmail;
	}
	public String getOrdersAddr() {
		return ordersAddr;
	}
	public void setOrdersAddr(String ordersAddr) {
		this.ordersAddr = ordersAddr;
	}
	public String getOrdersState() {
		return ordersState;
	}
	public void setOrdersState(String ordersState) {
		this.ordersState = ordersState;
	}
	public String getOrdersDate() {
		return ordersDate;
	}
	public void setOrdersDate(String ordersDate) {
		this.ordersDate = ordersDate;
	}
	private String ordersAddr;
	private String ordersState;
	private String ordersDate;
}
