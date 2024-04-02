package match.posting;

import java.util.ArrayList;
import java.util.List;

public class WelfareBean {
	private int posting_idx;
    private List<String> welfareContents = new ArrayList<>();
    
    

    public int getPosting_idx() {
		return posting_idx;
	}

	public void setPosting_idx(int posting_idx) {
		this.posting_idx = posting_idx;
	}

	public List<String> getWelfareContents() {
        return welfareContents;
    }

    public void setWelfareContents(List<String> welfareContents) {
        this.welfareContents = welfareContents;
    }

}
