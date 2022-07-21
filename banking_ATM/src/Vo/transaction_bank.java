package Vo;

public class transaction_bank {

	private int tid;
	private int amount;
	private String transaction_type;
	private UserData custom_id;
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getTransaction_type() {
		return transaction_type;
	}
	public void setTransaction_type(String transaction_type) {
		this.transaction_type = transaction_type;
	}
	public UserData getCustom_id() {
		return custom_id;
	}
	public void setCustom_id(UserData custom_id) {
		this.custom_id = custom_id;
	}
	
	
	
}
