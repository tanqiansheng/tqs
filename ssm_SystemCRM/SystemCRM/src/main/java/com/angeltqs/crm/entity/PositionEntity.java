package com.angeltqs.crm.entity;

import java.io.Serializable;

public class PositionEntity implements Serializable {
    /**
     * 职位ID
     */
    private Integer positionId;

    /**
     * name
     */
    private String name;

    /**
     * status
     */
    private Byte status;

    /**
     * crm_position
     */
    private static final long serialVersionUID = 1L;

    /**
     * 职位ID
     * @return position_id 职位ID
     */
    public Integer getPositionId() {
        return positionId;
    }

    /**
     * 职位ID
     * @param positionId 职位ID
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
        sb.append(", positionId=").append(positionId);
        sb.append(", name=").append(name);
        sb.append(", status=").append(status);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}