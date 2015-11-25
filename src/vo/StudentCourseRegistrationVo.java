package vo;

public class StudentCourseRegistrationVo {
	private int id;
	
	private ScheduleVo s1;
	private LoginVo s2;
	
	public ScheduleVo getS1() {
		return s1;
	}
	public void setS1(ScheduleVo s1) {
		this.s1 = s1;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LoginVo getS2() {
		return s2;
	}
	public void setS2(LoginVo s2) {
		this.s2 = s2;
	}
	

}
