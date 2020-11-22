package com.angeltqs.crm.entity;

import java.io.Serializable;
import java.util.Date;

public class EmployeeEntity implements Serializable {
    /**
     * 员工id
     */
    private Integer employeeId;

    /**
     * 部门_id
     */
    private Integer departmentId;

    /**
     * position_id
     */
    private Integer positionId;

    /**
     * name
     */
    private String name;

    /**
     * sex
     */
    private Byte sex;

    /**
     * 婚否
     */
    private Boolean married;

    /**
     * 学历
     */
    private Byte education;

    /**
     * 电话
     */
    private String tel;

    /**
     * email
     */
    private String email;

    /**
     * 身份证号
     */
    private String sid;

    /**
     * 家庭地址
     */
    private String adders;

    /**
     * 入职日期
     */
    private Date hireDate;

    /**
     * 离职日期
     */
    private Date termDate;

    /**
     * 状态
     */
    private Byte status;

    /**
     * crm_employee
     */
    private static final long serialVersionUID = 1L;

    /**
     * 员工id
     * @return employee_id 员工id
     */
    public Integer getEmployeeId() {
        return employeeId;
    }

    /**
     * 员工id
     * @param employeeId 员工id
     */
    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    /**
     * 部门_id
     * @return department_id 部门_id
     */
    public Integer getDepartmentId() {
        return departmentId;
    }

    /**
     * 部门_id
     * @param departmentId 部门_id
     */
    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    /**
     * position_id
     * @return position_id position_id
     */
    public Integer getPositionId() {
        return positionId;
    }

    /**
     * position_id
     * @param positionId position_id
     */
    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    /**
     * name
     * @return name name
     */
    public String getName() {
        return name;
    }

    /**
     * name
     * @param name name
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * sex
     * @return sex sex
     */
    public Byte getSex() {
        return sex;
    }

    /**
     * sex
     * @param sex sex
     */
    public void setSex(Byte sex) {
        this.sex = sex;
    }

    /**
     * 婚否
     * @return married 婚否
     */
    public Boolean getMarried() {
        return married;
    }

    /**
     * 婚否
     * @param married 婚否
     */
    public void setMarried(Boolean married) {
        this.married = married;
    }

    /**
     * 学历
     * @return education 学历
     */
    public Byte getEducation() {
        return education;
    }

    /**
     * 学历
     * @param education 学历
     */
    public void setEducation(Byte education) {
        this.education = education;
    }

    /**
     * 电话
     * @return tel 电话
     */
    public String getTel() {
        return tel;
    }

    /**
     * 电话
     * @param tel 电话
     */
    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    /**
     * email
     * @return email email
     */
    public String getEmail() {
        return email;
    }

    /**
     * email
     * @param email email
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * 身份证号
     * @return sid 身份证号
     */
    public String getSid() {
        return sid;
    }

    /**
     * 身份证号
     * @param sid 身份证号
     */
    public void setSid(String sid) {
        this.sid = sid == null ? null : sid.trim();
    }

    /**
     * 家庭地址
     * @return adders 家庭地址
     */
    public String getAdders() {
        return adders;
    }

    /**
     * 家庭地址
     * @param adders 家庭地址
     */
    public void setAdders(String adders) {
        this.adders = adders == null ? null : adders.trim();
    }

    /**
     * 入职日期
     * @return hire_date 入职日期
     */
    public Date getHireDate() {
        return hireDate;
    }

    /**
     * 入职日期
     * @param hireDate 入职日期
     */
    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    /**
     * 离职日期
     * @return term_date 离职日期
     */
    public Date getTermDate() {
        return termDate;
    }

    /**
     * 离职日期
     * @param termDate 离职日期
     */
    public void setTermDate(Date termDate) {
        this.termDate = termDate;
    }

    /**
     * 状态
     * @return status 状态
     */
    public Byte getStatus() {
        return status;
    }

    /**
     * 状态
     * @param status 状态
     */
    public void setStatus(Byte status) {
        this.status = status;
    }

    /**
     *
     * @mbg.generated
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", employeeId=").append(employeeId);
        sb.append(", departmentId=").append(departmentId);
        sb.append(", positionId=").append(positionId);
        sb.append(", name=").append(name);
        sb.append(", sex=").append(sex);
        sb.append(", married=").append(married);
        sb.append(", education=").append(education);
        sb.append(", tel=").append(tel);
        sb.append(", email=").append(email);
        sb.append(", sid=").append(sid);
        sb.append(", adders=").append(adders);
        sb.append(", hireDate=").append(hireDate);
        sb.append(", termDate=").append(termDate);
        sb.append(", status=").append(status);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}