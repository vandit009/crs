package vo;

public class CourseVo {
	private int id;
	private DepartmentVo s1;
	private String term;
	private String code;
	private String course;
	private String description;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public DepartmentVo getS1() {
		return s1;
	}
	public void setS1(DepartmentVo s1) {
		this.s1 = s1;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	

}
