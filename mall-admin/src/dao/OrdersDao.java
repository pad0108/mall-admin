package dao;
import java.util.*;
import vo.*;
import java.sql.*;
import commons.*;

public class OrdersDao {
	//
	public ArrayList<OrdersAndProduct> selectOrdersStateList() throws Exception{
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		//데이터 베이스 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
			      
		//sql문 생성
		String sql = "select distinct orders_state from orders";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
		OrdersAndProduct oap = new OrdersAndProduct();
		oap.setOrders(new Orders());
		oap.setProduct(new Product());
		//oap.orders.ordersState = rs.getString("orders_state");
		oap.getOrders().setOrdersState(rs.getString("orders_state"));
	    	  //리스트 출력
	    	  list.add(oap);
	      }
	      conn.close();
	      return list;
	}
	
	//전체 리스트 출력
	public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception{
		 ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
	      
		//데이터 베이스 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
	     
	      //sql 문 생성
	      String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.members_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id order by orders_id desc";
	      PreparedStatement stmt = conn.prepareStatement(sql);
	      ResultSet rs = stmt.executeQuery();
	      
	      while(rs.next()) {
	         OrdersAndProduct oap = new OrdersAndProduct();
	        /* oap.orders = new Orders();
	         oap.product = new Product();
	         oap.orders.ordersId = rs.getInt("o.orders_id");
	         oap.orders.productId = rs.getInt("o.product_id");
	         oap.product.productName = rs.getString("p.product_name");
	         oap.orders.ordersAmount = rs.getInt("o.orders_amount");
	         oap.orders.ordersPrice = rs.getInt("o.orders_price");
	         oap.orders.membersEmail = rs.getString("o.members_email");
	         oap.orders.ordersAddr = rs.getString("o.orders_addr");
	         oap.orders.ordersState = rs.getString("o.orders_state");
	         oap.orders.ordersDate = rs.getString("o.orders_date"); */
	         oap.setOrders(new Orders());
	         oap.setProduct(new Product());
	         oap.getOrders().setOrdersId(rs.getInt("o.orders_id"));
	         oap.getOrders().setProductId(rs.getInt("o.product_id"));
	         oap.getProduct().setProductName(rs.getString("p.product_name"));
	         oap.getOrders().setOrdersAmount(rs.getInt("o.orders_amount"));
	         oap.getOrders().setOrdersPrice(rs.getInt("o.orders_price"));
	         oap.getOrders().setMembersEmail(rs.getString("o.members_email"));
	         oap.getOrders().setOrdersAddr(rs.getString("o.orders_addr"));
	         oap.getOrders().setOrdersState(rs.getString("o.orders_state"));
	         oap.getOrders().setOrdersDate(rs.getString("o.orders_date"));
	         
	         
	         //리스트 출력
	         list.add(oap);
	      }
	      //데이터베이스 닫기
	      conn.close();
	      return list;   
	}
	//선택 값에 따른 리스트 출력
	public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState) throws Exception{
		 ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
	      
		//데이터 베이스 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//sql 문 생성
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.members_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id where orders_state = ? order by product_id desc";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ordersState);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			/*oap.orders = new Orders();
			oap.product = new Product();
			oap.orders.ordersId = rs.getInt("o.orders_id");
			oap.orders.productId = rs.getInt("o.product_id");
			oap.product.productName = rs.getString("p.product_name");
			oap.orders.ordersAmount = rs.getInt("o.orders_amount");
			oap.orders.ordersPrice = rs.getInt("o.orders_price");
			oap.orders.membersEmail = rs.getString("o.members_email");
			oap.orders.ordersAddr = rs.getString("o.orders_addr");
			oap.orders.ordersState = rs.getString("o.orders_state");
			oap.orders.ordersDate = rs.getString("o.orders_date");*/
			oap.setOrders(new Orders());
	         oap.setProduct(new Product());
	         oap.getOrders().setOrdersId(rs.getInt("o.orders_id"));
	         oap.getOrders().setProductId(rs.getInt("o.product_id"));
	         oap.getProduct().setProductName(rs.getString("p.product_name"));
	         oap.getOrders().setOrdersAmount(rs.getInt("o.orders_amount"));
	         oap.getOrders().setOrdersPrice(rs.getInt("o.orders_price"));
	         oap.getOrders().setMembersEmail(rs.getString("o.members_email"));
	         oap.getOrders().setOrdersAddr(rs.getString("o.orders_addr"));
	         oap.getOrders().setOrdersState(rs.getString("o.orders_state"));
	         oap.getOrders().setOrdersDate(rs.getString("o.orders_date"));
			//리스트 출력
			list.add(oap);
			}
			//데이터베이스 닫기
			conn.close();
			return list;   
		
	}
	
	//선택 값을 수정하는 리스트
	public void updateOrdersState(Orders orders) throws Exception{
		//데이터 베이스 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
	     
		//sql 문 생성
		String sql = "update orders set orders_state = ? where orders_id = ?";
		//데이터베이스 접속
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orders.getOrdersState());
		stmt.setInt(2, orders.getOrdersId());
		//결과 수정
		stmt.executeLargeUpdate();
	}
	
/*	public Orders selectOrdersOne(int ordersId) throws Exception {
		//데이터 베이스 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select orders_id, orders_state from orders where orders_id = ?";
		return null;
	}
*/
}
