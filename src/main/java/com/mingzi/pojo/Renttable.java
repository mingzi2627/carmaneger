package com.mingzi.pojo;


import lombok.Data;

@Data
public class Renttable {

	private Double tableid;

	private Double imprest;

	private Double shouldpayprice;

	private Double price;

	private java.util.Date begindate;

	private java.util.Date shouldreturndate;

	private java.util.Date returndate;

	private Double rentflag;

	private String custid;

	private String carid;

	private String userid;


}
