package vo;

public class ScheduleVo {
	private int id;
	private CourseVo s2;
	private DepartmentVo s1;
	private String day;
	private String startdate;
	private String enddate;
	private String st;
	private String et;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getSt() {
		return st;
	}
	public void setSt(String st) {
		this.st = st;
	}
	public String getEt() {
		return et;
	}
	public void setEt(String et) {
		this.et = et;
	}
	public CourseVo getS2() {
		return s2;
	}
	public void setS2(CourseVo s2) {
		this.s2 = s2;
	}
	public DepartmentVo getS1() {
		return s1;
	}
	public void setS1(DepartmentVo s1) {
		this.s1 = s1;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	
	

}
