package cn.entity;

import java.util.Date;

public class TbHealth {
	private Integer id;
	private Integer userId;
	private Integer bloodFat;                   //血脂1正常 0异常
	private Integer bloodPressure;              //血压1正常 0异常
	private Integer liver;                      //肝功能1正常 0异常
	private Integer blood;                      //血常规1正常 0异常
	private Integer heartRate;                  //心率1正常 0异常
	private Integer tumorMarker;                //肿瘤标志物1正常 0异常
	private Integer xgRay;                      //x光透视1正常 0异常
	private Integer eent;                       //眼耳鼻咽喉 1正常 0异常
	private Date checkDate;                     //检查时间
	private Date gmtCreate;
	private Date gmtModified;
	private TbUser user;
	private Date minDate;
	private Date maxDate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getBloodFat() {
		return bloodFat;
	}
	public void setBloodFat(Integer bloodFat) {
		this.bloodFat = bloodFat;
	}
	public Integer getBloodPressure() {
		return bloodPressure;
	}
	public void setBloodPressure(Integer bloodPressure) {
		this.bloodPressure = bloodPressure;
	}
	public Integer getLiver() {
		return liver;
	}
	public void setLiver(Integer liver) {
		this.liver = liver;
	}
	public Integer getBlood() {
		return blood;
	}
	public void setBlood(Integer blood) {
		this.blood = blood;
	}
	public Integer getHeartRate() {
		return heartRate;
	}
	public void setHeartRate(Integer heartRate) {
		this.heartRate = heartRate;
	}
	public Integer getTumorMarker() {
		return tumorMarker;
	}
	public void setTumorMarker(Integer tumorMarker) {
		this.tumorMarker = tumorMarker;
	}
	public Integer getXgRay() {
		return xgRay;
	}
	public void setXgRay(Integer xgRay) {
		this.xgRay = xgRay;
	}
	public Integer getEent() {
		return eent;
	}
	public void setEent(Integer eent) {
		this.eent = eent;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	public Date getGmtCreate() {
		return gmtCreate;
	}
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	public Date getGmtModified() {
		return gmtModified;
	}
	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
	public TbUser getUser() {
		return user;
	}
	public void setUser(TbUser user) {
		this.user = user;
	}
	public Date getMinDate() {
		return minDate;
	}
	public void setMinDate(Date minDate) {
		this.minDate = minDate;
	}
	public Date getMaxDate() {
		return maxDate;
	}
	public void setMaxDate(Date maxDate) {
		this.maxDate = maxDate;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TbHealth [blood=");
		builder.append(blood);
		builder.append(", bloodFat=");
		builder.append(bloodFat);
		builder.append(", bloodPressure=");
		builder.append(bloodPressure);
		builder.append(", checkDate=");
		builder.append(checkDate);
		builder.append(", eent=");
		builder.append(eent);
		builder.append(", gmtCreate=");
		builder.append(gmtCreate);
		builder.append(", gmtModified=");
		builder.append(gmtModified);
		builder.append(", heartRate=");
		builder.append(heartRate);
		builder.append(", id=");
		builder.append(id);
		builder.append(", liver=");
		builder.append(liver);
		builder.append(", maxDate=");
		builder.append(maxDate);
		builder.append(", minDate=");
		builder.append(minDate);
		builder.append(", tumorMarker=");
		builder.append(tumorMarker);
		builder.append(", user=");
		builder.append(user);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", xgRay=");
		builder.append(xgRay);
		builder.append("]");
		return builder.toString();
	}
}
