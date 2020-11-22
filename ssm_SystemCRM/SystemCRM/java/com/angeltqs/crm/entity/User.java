package com.angeltqs.crm.entity;

import com.angeltqs.crm.util.tqsUtil;

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

	    private String username;

	    private String userpwd;

	    private String createdate;

	    private Integer status;
	    
	  
	 
}

