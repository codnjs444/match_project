package match.application;

public class ApplicationBean {
	private int application_idx;
	private int posting_idx;
	private int resume_idx;
	private String user_id;
	private String application_like;
	private String application_ignored;
	private String application_sresult;
	private String application_datetime;
	private String application_datetime2;
	
	public int getApplication_idx() {
		return application_idx;
	}
	public void setApplication_idx(int application_idx) {
		this.application_idx = application_idx;
	}
	public int getPosting_idx() {
		return posting_idx;
	}
	public void setPosting_idx(int posting_idx) {
		this.posting_idx = posting_idx;
	}
	public int getResume_idx() {
		return resume_idx;
	}
	public String getApplication_sresult() {
		return application_sresult;
	}
	public void setApplication_sresult(String application_sresult) {
		this.application_sresult = application_sresult;
	}
	public void setResume_idx(int resume_idx) {
		this.resume_idx = resume_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getApplication_like() {
		return application_like;
	}
	public void setApplication_like(String application_like) {
		this.application_like = application_like;
	}
	public String getApplication_ignored() {
		return application_ignored;
	}
	public void setApplication_ignored(String application_ignored) {
		this.application_ignored = application_ignored;
	}
	public String getApplication_datetime() {
		return application_datetime;
	}
	public void setApplication_datetime(String application_datetime) {
		this.application_datetime = application_datetime;
	}
	public String getApplication_datetime2() {
		return application_datetime2;
	}
	public void setApplication_datetime2(String application_datetime2) {
		this.application_datetime2 = application_datetime2;
	}
	
	
}
