package controller;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

@PersistenceCapable
public class TimerPojo implements Serializable {
	
	private String time;
	@Persistent
	private String email;
	private boolean isDelete=false;
	
	public boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}
	public String getEmail(){
		return email;
		
	}
	public void setEmail(String email){
		this.email=email;
	}
	@Persistent
	private Set<Long> Idvalues= new HashSet<Long>();
	
	
public Set<Long> getIdvalues() {
		return Idvalues;
	}
	public void setIdvalues(Set<Long> idvalues) {
		this.Idvalues = idvalues;
	}
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
