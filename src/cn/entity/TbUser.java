package cn.entity;

import java.util.Date;

/**
 * TbUser entity. @author MyEclipse Persistence Tools
 */
public class TbUser  implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String username;                  //用户昵称
	private String password;
	private String realName;                  //真实名字
	private Integer age;                      //年龄
	private Integer sex;                      //性别
	private Integer departmentId;             //部门ID
	private Integer workAge;                  //工龄
	private Integer healthStatus;             //健康状态
	private Integer role;                     //角色  1管理员 2待审核的企业用户 3企业用户
	private String departmentName;
	private Date gmtCreate;
	private Date gmtModified;
	private TbDepartment department;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public Integer getWorkAge() {
		return workAge;
	}
	public void setWorkAge(Integer workAge) {
		this.workAge = workAge;
	}
	public Integer getHealthStatus() {
		return healthStatus;
	}
	public void setHealthStatus(Integer healthStatus) {
		this.healthStatus = healthStatus;
	}
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
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
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public TbDepartment getDepartment() {
		return department;
	}
	public void setDepartment(TbDepartment department) {
		this.department = department;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TbUser [age=");
		builder.append(age);
		builder.append(", department=");
		builder.append(department);
		builder.append(", departmentId=");
		builder.append(departmentId);
		builder.append(", departmentName=");
		builder.append(departmentName);
		builder.append(", gmtCreate=");
		builder.append(gmtCreate);
		builder.append(", gmtModified=");
		builder.append(gmtModified);
		builder.append(", healthStatus=");
		builder.append(healthStatus);
		builder.append(", id=");
		builder.append(id);
		builder.append(", password=");
		builder.append(password);
		builder.append(", realName=");
		builder.append(realName);
		builder.append(", role=");
		builder.append(role);
		builder.append(", sex=");
		builder.append(sex);
		builder.append(", username=");
		builder.append(username);
		builder.append(", workAge=");
		builder.append(workAge);
		builder.append("]");
		return builder.toString();
	}
	
}
