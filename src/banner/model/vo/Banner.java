package banner.model.vo;

public class Banner implements java.io.Serializable{
	public static final long SerializableUID = 6666L;
	
	
	private int bannerNo;
	private String bannerTitle;
	private String bannerChk;
	private String bannerOk;
	private String bannerOriginal;
	private String bannerRename;
	private String bannerSize;
	
	public Banner() {}

	public Banner(int bannerNo, String bannerTitle, String bannerChk, String bannerOk, String bannerOriginal,
			String bannerRename, String bannerSize) {
		super();
		this.bannerNo = bannerNo;
		this.bannerTitle = bannerTitle;
		this.bannerChk = bannerChk;
		this.bannerOk = bannerOk;
		this.bannerOriginal = bannerOriginal;
		this.bannerRename = bannerRename;
		this.bannerSize = bannerSize;
	}

	public void setBannerNo(int bannerNo) {
		this.bannerNo = bannerNo;
	}

	public void setBannerTitle(String bannerTitle) {
		this.bannerTitle = bannerTitle;
	}

	public void setBannerChk(String bannerChk) {
		this.bannerChk = bannerChk;
	}

	public void setBannerOk(String bannerOk) {
		this.bannerOk = bannerOk;
	}

	public void setBannerOriginal(String bannerOriginal) {
		this.bannerOriginal = bannerOriginal;
	}

	public void setBannerRename(String bannerRename) {
		this.bannerRename = bannerRename;
	}

	public void setBannerSize(String bannerSize) {
		this.bannerSize = bannerSize;
	}

	public static long getSerializableuid() {
		return SerializableUID;
	}

	public int getBannerNo() {
		return bannerNo;
	}

	public String getBannerTitle() {
		return bannerTitle;
	}

	public String getBannerChk() {
		return bannerChk;
	}

	public String getBannerOk() {
		return bannerOk;
	}

	public String getBannerOriginal() {
		return bannerOriginal;
	}

	public String getBannerRename() {
		return bannerRename;
	}

	public String getBannerSize() {
		return bannerSize;
	}

	@Override
	public String toString() {
		return "Banner [bannerNo=" + bannerNo + ", bannerTitle=" + bannerTitle + ", bannerChk=" + bannerChk
				+ ", bannerOk=" + bannerOk + ", bannerOriginal=" + bannerOriginal + ", bannerRename=" + bannerRename
				+ ", bannerSize=" + bannerSize + "]";
	}
	
	


}
