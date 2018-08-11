package com.bean;



public class User {
	private String userName;  //鐢ㄦ埛鍚�
	private String userPwd;   //鐢ㄦ埛瀵嗙爜
	private int userType;     //鐢ㄦ埛绫诲瀷锛�1浠ｈ〃瀛︾敓锛�2浠ｈ〃鑰佸笀锛�
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(String userName,String userPwd,int userType){
		this.userName=userName;
		this.userPwd=userPwd;
		this.userType=userType;
		
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	@Override
	public String toString() {
		return "User [userName=" + userName + ", userPwd=" + userPwd
				+ ", userType=" + userType + "]";
	}
	

}
