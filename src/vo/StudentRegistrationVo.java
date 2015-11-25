package vo;

public class StudentRegistrationVo {
	private int id;
	private LoginVo s2;
	private String studentnumber;
	private String program;
	private String fn;
	private String ln;
	private String email;
	private String username;
	private String  pass;
	private String conpass;
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
	public String getStudentnumber() {
		return studentnumber;
	}
	public void setStudentnumber(String studentnumber) {
		this.studentnumber = studentnumber;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	public String getFn() {
		return fn;
	}
	public void setFn(String fn) {
		this.fn = fn;
	}
	public String getLn() {
		return ln;
	}
	public void setLn(String ln) {
		this.ln = ln;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getConpass() {
		return conpass;
	}
	public void setConpass(String conpass) {
		this.conpass = conpass;
	}
	
	

}
