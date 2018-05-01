package com.myhostelmanager.form;

public class NewTenantForm {
	
	private int autoId;
	private String name;
	private String mobile;
	private String email;
	private String id;
	private String doj;
	private String address;
	private String room;
	private int amount;
	private String bId;
	private String hostelName;
	private String dov;
	
	public int getAutoId() {
		return autoId;
	}
	public void setAutoId(int autoId) {
		this.autoId = autoId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public String getHostelName() {
		return hostelName;
	}
	public void setHostelName(String hostelName) {
		this.hostelName = hostelName;
	}
	public String getDov() {
		return dov;
	}
	public void setDov(String dov) {
		this.dov = dov;
	}
	@Override
	public String toString() {
		return "NewTenantForm [name=" + name + ", mobile=" + mobile + ", email=" + email + ", id=" + id + ", doj=" + doj
				+ ", address=" + address + ", room=" + room + ", amount=" + amount + ", bId=" + bId + ", hostelName="
				+ hostelName + "]";
	}
}
