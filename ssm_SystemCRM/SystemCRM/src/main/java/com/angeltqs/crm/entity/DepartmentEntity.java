package com.angeltqs.crm.entity;

import java.io.Serializable;
import java.util.Date;

public class DepartmentEntity implements Serializable {
    /**
     * 部门id
     */
    private Integer departmentId;

    /**
     * 上级部门_id
     */
    private Integer departmentParentId;

    /**
     * name
     */
    private String name;

    /**
     * createtime
     */
    private Date createTime;

    /**
     * lastchangetime
     */
    private Date lastChangeTime;

    /**
     * status
     */
    private Byte status;

    /**
     * crm_department
     */
    private static final long serialVersionUID = 1L;

    /**
     * 部门id
     * @return department_id 部门id
     */
    public Integer getDepartmentId() {
        return departmentId;
    }

    /**
     * 部门id
     * @param departmentId 部门id
     */
    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    /**
     * 上级部门_id
     * @return department_parent_id 上级部门_id
     */
    public Integer getDepartmentParentId() {
        return departmentParentId;
    }

    /**
     * 上级部门_id
     * @param departmentParentId 上级部门_id
     */
    public void setDepartmentParentId(Integer departmentParentId) {
        this.departmentParentId = departmentParentId;
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
     * createtime
     * @return create_time createtime
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * createtime
     * @param createTime createtime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * lastchangetime
     * @return last_change_time lastchangetime
     */
    public Date getLastChangeTime() {
        return lastChangeTime;
    }

    /**
     * lastchangetime
     * @param lastChangeTime lastchangetime
     */
    public void setLastChangeTime(Date lastChangeTime) {
        this.lastChangeTime = lastChangeTime;
    }

    /**
     * status
     * @return status status
     */
    public Byte getStatus() {
        return status;
    }

    /**
     * status
     * @param status status
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
        sb.append(", departmentId=").append(departmentId);
        sb.append(", departmentParentId=").append(departmentParentId);
        sb.append(", name=").append(name);
        sb.append(", createTime=").append(createTime);
        sb.append(", lastChangeTime=").append(lastChangeTime);
        sb.append(", status=").append(status);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}