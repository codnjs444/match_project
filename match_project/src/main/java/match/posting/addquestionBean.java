package match.posting;

import java.util.List;

public class addquestionBean {
	private int posting_idx;
	private List<String> addquestion_question;

    public List<String> getAddquestion_question() {
		return addquestion_question;
	}
	public void setAddquestion_question(List<String> addquestion_question) {
		this.addquestion_question = addquestion_question;
	}
	public int getPosting_idx() {
        return posting_idx;
    }
    public void setPosting_idx(int posting_idx) {
        this.posting_idx = posting_idx;
    }

}