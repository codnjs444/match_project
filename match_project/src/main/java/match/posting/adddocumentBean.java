package match.posting;
import java.util.List;

public class adddocumentBean {
	private int posting_idx;
	private List<String> adddocument_document;

    public int getPosting_idx() {
        return posting_idx;
    }
    public void setPosting_idx(int posting_idx) {
        this.posting_idx = posting_idx;
    }
    public List<String> getAdddocument_document() {
        return adddocument_document;
    }
    public void setAdddocument_document(List<String> adddocument_document) {
        this.adddocument_document = adddocument_document;
    }
}