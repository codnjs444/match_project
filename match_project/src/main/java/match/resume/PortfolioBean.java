package match.resume;

import java.util.List;

public class PortfolioBean {
    private int resume_idx;
    private List<String> portfolio_name;
    private List<String> portfolio_url;
    private List<String> portfolio_fname;
    private List<String> portfolio_extension;
    private List<String> portfolio_udate;
    
    public int getResume_idx() {
        return resume_idx;
    }
    public void setResume_idx(int resume_idx) {
        this.resume_idx = resume_idx;
    }
    public List<String> getPortfolio_name() {
        return portfolio_name;
    }
    public void setPortfolio_name(List<String> portfolio_name) {
        this.portfolio_name = portfolio_name;
    }
    public List<String> getPortfolio_url() {
        return portfolio_url;
    }
    public void setPortfolio_url(List<String> portfolio_url) {
        this.portfolio_url = portfolio_url;
    }
    public List<String> getPortfolio_fname() {
        return portfolio_fname;
    }
    public void setPortfolio_fname(List<String> portfolio_fname) {
        this.portfolio_fname = portfolio_fname;
    }
    public List<String> getPortfolio_extension() {
        return portfolio_extension;
    }
    public void setPortfolio_extension(List<String> portfolio_extension) {
        this.portfolio_extension = portfolio_extension;
    }
    public List<String> getPortfolio_udate() {
        return portfolio_udate;
    }
    public void setPortfolio_udate(List<String> portfolio_udate) {
        this.portfolio_udate = portfolio_udate;
    }
}