package controller;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

@SuppressWarnings("serial")
@PersistenceCapable
public class TimerPojo implements Serializable {
	@Persistent
	private Long time;
	@Persistent
	private String email;
	@Persistent
	private Boolean isDelete=false;
	
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
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
	public Long getTime() {
		return time;
	}

	public void setTime(Long time) {
		this.time = time;
	}

}
