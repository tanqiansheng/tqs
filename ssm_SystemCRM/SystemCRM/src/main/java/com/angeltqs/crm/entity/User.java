package com.angeltqs.crm.entity;

import java.util.Date;

import com.angeltqs.crm.common.util.TqsUtil;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data//包括gets set
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class User {
	 	private Integer uid;

	    private Integer depId;

	    private Integer employeeId;

	    private String userName;

	    private String userPwd;

	    private String createDate;

	    private Byte status;
	  
	 
}

