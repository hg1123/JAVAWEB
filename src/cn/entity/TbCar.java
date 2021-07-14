package cn.entity;

import java.util.Date;


public class TbCar  implements java.io.Serializable {

	private Integer id;
	private Date withholdingDate;
	private Date registrationDate;
	private String withholdingNum;
	private String type;
	private String licensePlateNumber;
	private String frameNum;
	private String engineNum;
	private String vehicleMileage;
	private String bodyColor;
	private String vehiclePhotos;
	private String parkingLot;
	private String temporaryCause;
	private String byCarBuckle;
	private String policeOfficer;
	private String toEnter;
	private String withholdingUnits;
	private String status;
	private Date lastModifyTime;
	private String comment;

	// Constructors

	/** default constructor */
	public TbCar() {
	}

	/** minimal constructor */
	public TbCar(Date withholdingDate, Date registrationDate,
			String licensePlateNumber, String vehicleMileage,
			String parkingLot, String policeOfficer) {
		this.withholdingDate = withholdingDate;
		this.registrationDate = registrationDate;
		this.licensePlateNumber = licensePlateNumber;
		this.vehicleMileage = vehicleMileage;
		this.parkingLot = parkingLot;
		this.policeOfficer = policeOfficer;
	}

	/** full constructor */
	public TbCar(Date withholdingDate, Date registrationDate,
			String withholdingNum, String type, String licensePlateNumber,
			String frameNum, String engineNum, String vehicleMileage,
			String bodyColor, String vehiclePhotos, String parkingLot,
			String temporaryCause, String byCarBuckle, String policeOfficer,
			String toEnter, String withholdingUnits, String status,
			Date lastModifyTime, String comment) {
		this.withholdingDate = withholdingDate;
		this.registrationDate = registrationDate;
		this.withholdingNum = withholdingNum;
		this.type = type;
		this.licensePlateNumber = licensePlateNumber;
		this.frameNum = frameNum;
		this.engineNum = engineNum;
		this.vehicleMileage = vehicleMileage;
		this.bodyColor = bodyColor;
		this.vehiclePhotos = vehiclePhotos;
		this.parkingLot = parkingLot;
		this.temporaryCause = temporaryCause;
		this.byCarBuckle = byCarBuckle;
		this.policeOfficer = policeOfficer;
		this.toEnter = toEnter;
		this.withholdingUnits = withholdingUnits;
		this.status = status;
		this.lastModifyTime = lastModifyTime;
		this.comment = comment;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getWithholdingDate() {
		return this.withholdingDate;
	}

	public void setWithholdingDate(Date withholdingDate) {
		this.withholdingDate = withholdingDate;
	}

	public Date getRegistrationDate() {
		return this.registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getWithholdingNum() {
		return this.withholdingNum;
	}

	public void setWithholdingNum(String withholdingNum) {
		this.withholdingNum = withholdingNum;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLicensePlateNumber() {
		return this.licensePlateNumber;
	}

	public void setLicensePlateNumber(String licensePlateNumber) {
		this.licensePlateNumber = licensePlateNumber;
	}

	public String getFrameNum() {
		return this.frameNum;
	}

	public void setFrameNum(String frameNum) {
		this.frameNum = frameNum;
	}

	public String getEngineNum() {
		return this.engineNum;
	}

	public void setEngineNum(String engineNum) {
		this.engineNum = engineNum;
	}

	public String getVehicleMileage() {
		return this.vehicleMileage;
	}

	public void setVehicleMileage(String vehicleMileage) {
		this.vehicleMileage = vehicleMileage;
	}

	public String getBodyColor() {
		return this.bodyColor;
	}

	public void setBodyColor(String bodyColor) {
		this.bodyColor = bodyColor;
	}

	public String getVehiclePhotos() {
		return this.vehiclePhotos;
	}

	public void setVehiclePhotos(String vehiclePhotos) {
		this.vehiclePhotos = vehiclePhotos;
	}

	public String getParkingLot() {
		return this.parkingLot;
	}

	public void setParkingLot(String parkingLot) {
		this.parkingLot = parkingLot;
	}

	public String getTemporaryCause() {
		return this.temporaryCause;
	}

	public void setTemporaryCause(String temporaryCause) {
		this.temporaryCause = temporaryCause;
	}

	public String getByCarBuckle() {
		return this.byCarBuckle;
	}

	public void setByCarBuckle(String byCarBuckle) {
		this.byCarBuckle = byCarBuckle;
	}

	public String getPoliceOfficer() {
		return this.policeOfficer;
	}

	public void setPoliceOfficer(String policeOfficer) {
		this.policeOfficer = policeOfficer;
	}

	public String getToEnter() {
		return this.toEnter;
	}

	public void setToEnter(String toEnter) {
		this.toEnter = toEnter;
	}

	public String getWithholdingUnits() {
		return this.withholdingUnits;
	}

	public void setWithholdingUnits(String withholdingUnits) {
		this.withholdingUnits = withholdingUnits;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getLastModifyTime() {
		return this.lastModifyTime;
	}

	public void setLastModifyTime(Date lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}
