package cn.entity;

import java.util.Date;

public class TbDepartment {
	private Integer id;
	private String name;
	private Integer sortNum;
	private Date gmtCreate;
	private Date gmtModified;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSortNum() {
		return sortNum;
	}
	public void setSortNum(Integer sortNum) {
		this.sortNum = sortNum;
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
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TbDepartment [gmtCreate=");
		builder.append(gmtCreate);
		builder.append(", gmtModified=");
		builder.append(gmtModified);
		builder.append(", id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", sortNum=");
		builder.append(sortNum);
		builder.append("]");
		return builder.toString();
	}
}
