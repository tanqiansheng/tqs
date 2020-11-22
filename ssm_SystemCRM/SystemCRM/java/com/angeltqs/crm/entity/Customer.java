package com.angeltqs.crm.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data//包括gets et
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Customer {
	private Integer cid;

    private Integer uid;

    private String name;

    private String country;

    private String address;

    private String url;

    private String email;

    private String phone;

    private String fax;

    private String other;

    private String industry;

    private String annualRevenue;

    private String bankofdeposit;

    private String bankAccount;

    private Date createTime;

    private Date updateTime;

    private Date lastTime;
}
