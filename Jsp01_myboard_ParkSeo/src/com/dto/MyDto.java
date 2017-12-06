package com.dto;

import java.util.Date;

public class MyDto {
	
/*
 * ��ȣ(MYNO), �ۼ���(MYNAME), ����(MYTITLE), ����(MYCONTENT), ��¥(MYDATE) 
 */

	private int myno;
	private String myname;
	private String mytitle;
	private String mycontent;
	private Date madate;
	
	public MyDto() {
		super();
	}
	
	//insert(�̸�, ����, ����)
	public MyDto(String myname, String mytitle, String mycontent) {
		this.myname = myname;
		this.mytitle = mytitle;
		this.mycontent = mycontent;
	}
	
	//update(��ȣ, ����, ����)
	public MyDto(int myno, String mytitle, String mycontent) {
		this.myno = myno;
		this.mytitle = mytitle;
		this.mycontent = mycontent;
		
	}

	public int getMyno() {
		return myno;
	}

	public void setMyno(int myno) {
		this.myno = myno;
	}

	public String getMyname() {
		return myname;
	}

	public void setMyname(String myname) {
		this.myname = myname;
	}

	public String getMytitle() {
		return mytitle;
	}

	public void setMytitle(String mytitle) {
		this.mytitle = mytitle;
	}

	public String getMycontent() {
		return mycontent;
	}

	public void setMycontent(String mycontent) {
		this.mycontent = mycontent;
	}

	public Date getMadate() {
		return madate;
	}

	public void setMadate(Date madate) {
		this.madate = madate;
	}

	@Override
	public String toString() {
		return "MyDto [myno=" + myno + ", myname=" + myname + ", mytitle=" + mytitle + ", mycontent=" + mycontent
				+ ", madate=" + madate + "]";
	}
	
	
	

}
