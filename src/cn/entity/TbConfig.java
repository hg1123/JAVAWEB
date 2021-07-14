package cn.entity;

import java.util.Date;

public class TbConfig {
	private Integer id;
	private Date nextCheckDate;
	public Date getNextCheckDate() {
		return nextCheckDate;
	}
	public void setNextCheckDate(Date nextCheckDate) {
		this.nextCheckDate = nextCheckDate;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TbConfig [id=");
		builder.append(id);
		builder.append(", nextCheckDate=");
		builder.append(nextCheckDate);
		builder.append("]");
		return builder.toString();
	}
}
