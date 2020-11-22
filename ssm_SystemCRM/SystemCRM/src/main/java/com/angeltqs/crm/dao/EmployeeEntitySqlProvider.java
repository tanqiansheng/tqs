package com.angeltqs.crm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.angeltqs.crm.entity.EmployeeEntity;
import com.angeltqs.crm.entity.EmployeeEntityExample;
import com.angeltqs.crm.entity.EmployeeEntityExample.Criteria;
import com.angeltqs.crm.entity.EmployeeEntityExample.Criterion;

public class EmployeeEntitySqlProvider {
 
    public String countByExample(EmployeeEntityExample example) {
        SQL sql = new SQL();
        sql.SELECT("count(*)").FROM("crm_employee");
        applyWhere(sql, example, false);
        return sql.toString();
    }

    /**
     *
     * @mbg.generated
     */
    public String deleteByExample(EmployeeEntityExample example) {
        SQL sql = new SQL();
        sql.DELETE_FROM("crm_employee");
        applyWhere(sql, example, false);
        return sql.toString();
    }

    /**
     *
     * @mbg.generated
     */
    public String insertSelective(EmployeeEntity record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("crm_employee");
        
        sql.VALUES("employee_id", "#{employeeId,jdbcType=INTEGER}");
        
        if (record.getDepartmentId() != null) {
            sql.VALUES("department_id", "#{departmentId,jdbcType=INTEGER}");
        }
        
        if (record.getPositionId() != null) {
            sql.VALUES("position_id", "#{positionId,jdbcType=INTEGER}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getSex() != null) {
            sql.VALUES("sex", "#{sex,jdbcType=TINYINT}");
        }
        
        if (record.getMarried() != null) {
            sql.VALUES("married", "#{married,jdbcType=BIT}");
        }
        
        if (record.getEducation() != null) {
            sql.VALUES("education", "#{education,jdbcType=TINYINT}");
        }
        
        if (record.getTel() != null) {
            sql.VALUES("tel", "#{tel,jdbcType=CHAR}");
        }
        
        if (record.getEmail() != null) {
            sql.VALUES("email", "#{email,jdbcType=VARCHAR}");
        }
        
        if (record.getSid() != null) {
            sql.VALUES("sid", "#{sid,jdbcType=CHAR}");
        }
        
        if (record.getAdders() != null) {
            sql.VALUES("adders", "#{adders,jdbcType=VARCHAR}");
        }
        
        if (record.getHireDate() != null) {
            sql.VALUES("hire_date", "#{hireDate,jdbcType=DATE}");
        }
        
        if (record.getTermDate() != null) {
            sql.VALUES("term_date", "#{termDate,jdbcType=DATE}");
        }
        
        if (record.getStatus() != null) {
            sql.VALUES("status", "#{status,jdbcType=TINYINT}");
        }
        
        return sql.toString();
    }

    /**
     *
     * @mbg.generated
     */
    public String selectByExample(EmployeeEntityExample example) {
        SQL sql = new SQL();
        if (example != null && example.isDistinct()) {
            sql.SELECT_DISTINCT("employee_id");
        } else {
            sql.SELECT("employee_id");
        }
        sql.SELECT("department_id");
        sql.SELECT("position_id");
        sql.SELECT("name");
        sql.SELECT("sex");
        sql.SELECT("married");
        sql.SELECT("education");
        sql.SELECT("tel");
        sql.SELECT("email");
        sql.SELECT("sid");
        sql.SELECT("adders");
        sql.SELECT("hire_date");
        sql.SELECT("term_date");
        sql.SELECT("status");
        sql.FROM("crm_employee");
        applyWhere(sql, example, false);
        
        if (example != null && example.getOrderByClause() != null) {
            sql.ORDER_BY(example.getOrderByClause());
        }
        
        return sql.toString();
    }

    /**
     *
     * @mbg.generated
     */
    public String updateByExampleSelective(Map<String, Object> parameter) {
        EmployeeEntity record = (EmployeeEntity) parameter.get("record");
        EmployeeEntityExample example = (EmployeeEntityExample) parameter.get("example");
        
        SQL sql = new SQL();
        sql.UPDATE("crm_employee");
        
        if (record.getEmployeeId() != null) {
            sql.SET("employee_id = #{record.employeeId,jdbcType=INTEGER}");
        }
        
        if (record.getDepartmentId() != null) {
            sql.SET("department_id = #{record.departmentId,jdbcType=INTEGER}");
        }
        
        if (record.getPositionId() != null) {
            sql.SET("position_id = #{record.positionId,jdbcType=INTEGER}");
        }
        
        if (record.getName() != null) {
            sql.SET("name = #{record.name,jdbcType=VARCHAR}");
        }
        
        if (record.getSex() != null) {
            sql.SET("sex = #{record.sex,jdbcType=TINYINT}");
        }
        
        if (record.getMarried() != null) {
            sql.SET("married = #{record.married,jdbcType=BIT}");
        }
        
        if (record.getEducation() != null) {
            sql.SET("education = #{record.education,jdbcType=TINYINT}");
        }
        
        if (record.getTel() != null) {
            sql.SET("tel = #{record.tel,jdbcType=CHAR}");
        }
        
        if (record.getEmail() != null) {
            sql.SET("email = #{record.email,jdbcType=VARCHAR}");
        }
        
        if (record.getSid() != null) {
            sql.SET("sid = #{record.sid,jdbcType=CHAR}");
        }
        
        if (record.getAdders() != null) {
            sql.SET("adders = #{record.adders,jdbcType=VARCHAR}");
        }
        
        if (record.getHireDate() != null) {
            sql.SET("hire_date = #{record.hireDate,jdbcType=DATE}");
        }
        
        if (record.getTermDate() != null) {
            sql.SET("term_date = #{record.termDate,jdbcType=DATE}");
        }
        
        if (record.getStatus() != null) {
            sql.SET("status = #{record.status,jdbcType=TINYINT}");
        }
        
        applyWhere(sql, example, true);
        return sql.toString();
    }

    /**
     *
     * @mbg.generated
     */
    public String updateByExample(Map<String, Object> parameter) {
        SQL sql = new SQL();
        sql.UPDATE("crm_employee");
        
        sql.SET("employee_id = #{record.employeeId,jdbcType=INTEGER}");
        sql.SET("department_id = #{record.departmentId,jdbcType=INTEGER}");
        sql.SET("position_id = #{record.positionId,jdbcType=INTEGER}");
        sql.SET("name = #{record.name,jdbcType=VARCHAR}");
        sql.SET("sex = #{record.sex,jdbcType=TINYINT}");
        sql.SET("married = #{record.married,jdbcType=BIT}");
        sql.SET("education = #{record.education,jdbcType=TINYINT}");
        sql.SET("tel = #{record.tel,jdbcType=CHAR}");
        sql.SET("email = #{record.email,jdbcType=VARCHAR}");
        sql.SET("sid = #{record.sid,jdbcType=CHAR}");
        sql.SET("adders = #{record.adders,jdbcType=VARCHAR}");
        sql.SET("hire_date = #{record.hireDate,jdbcType=DATE}");
        sql.SET("term_date = #{record.termDate,jdbcType=DATE}");
        sql.SET("status = #{record.status,jdbcType=TINYINT}");
        
        EmployeeEntityExample example = (EmployeeEntityExample) parameter.get("example");
        applyWhere(sql, example, true);
        return sql.toString();
    }

    /**
     *
     * @mbg.generated
     */
    public String updateByPrimaryKeySelective(EmployeeEntity record) {
        SQL sql = new SQL();
        sql.UPDATE("crm_employee");
        
        if (record.getDepartmentId() != null) {
            sql.SET("department_id = #{departmentId,jdbcType=INTEGER}");
        }
        
        if (record.getPositionId() != null) {
            sql.SET("position_id = #{positionId,jdbcType=INTEGER}");
        }
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getSex() != null) {
            sql.SET("sex = #{sex,jdbcType=TINYINT}");
        }
        
        if (record.getMarried() != null) {
            sql.SET("married = #{married,jdbcType=BIT}");
        }
        
        if (record.getEducation() != null) {
            sql.SET("education = #{education,jdbcType=TINYINT}");
        }
        
        if (record.getTel() != null) {
            sql.SET("tel = #{tel,jdbcType=CHAR}");
        }
        
        if (record.getEmail() != null) {
            sql.SET("email = #{email,jdbcType=VARCHAR}");
        }
        
        if (record.getSid() != null) {
            sql.SET("sid = #{sid,jdbcType=CHAR}");
        }
        
        if (record.getAdders() != null) {
            sql.SET("adders = #{adders,jdbcType=VARCHAR}");
        }
        
        if (record.getHireDate() != null) {
            sql.SET("hire_date = #{hireDate,jdbcType=DATE}");
        }
        
        if (record.getTermDate() != null) {
            sql.SET("term_date = #{termDate,jdbcType=DATE}");
        }
        
        if (record.getStatus() != null) {
            sql.SET("status = #{status,jdbcType=TINYINT}");
        }
        
        sql.WHERE("employee_id = #{employeeId,jdbcType=INTEGER}");
        
        return sql.toString();
    }

    /**
     *
     * @mbg.generated
     */
    protected void applyWhere(SQL sql, EmployeeEntityExample example, boolean includeExamplePhrase) {
        if (example == null) {
            return;
        }
        
        String parmPhrase1;
        String parmPhrase1_th;
        String parmPhrase2;
        String parmPhrase2_th;
        String parmPhrase3;
        String parmPhrase3_th;
        if (includeExamplePhrase) {
            parmPhrase1 = "%s #{example.oredCriteria[%d].allCriteria[%d].value}";
            parmPhrase1_th = "%s #{example.oredCriteria[%d].allCriteria[%d].value,typeHandler=%s}";
            parmPhrase2 = "%s #{example.oredCriteria[%d].allCriteria[%d].value} and #{example.oredCriteria[%d].criteria[%d].secondValue}";
            parmPhrase2_th = "%s #{example.oredCriteria[%d].allCriteria[%d].value,typeHandler=%s} and #{example.oredCriteria[%d].criteria[%d].secondValue,typeHandler=%s}";
            parmPhrase3 = "#{example.oredCriteria[%d].allCriteria[%d].value[%d]}";
            parmPhrase3_th = "#{example.oredCriteria[%d].allCriteria[%d].value[%d],typeHandler=%s}";
        } else {
            parmPhrase1 = "%s #{oredCriteria[%d].allCriteria[%d].value}";
            parmPhrase1_th = "%s #{oredCriteria[%d].allCriteria[%d].value,typeHandler=%s}";
            parmPhrase2 = "%s #{oredCriteria[%d].allCriteria[%d].value} and #{oredCriteria[%d].criteria[%d].secondValue}";
            parmPhrase2_th = "%s #{oredCriteria[%d].allCriteria[%d].value,typeHandler=%s} and #{oredCriteria[%d].criteria[%d].secondValue,typeHandler=%s}";
            parmPhrase3 = "#{oredCriteria[%d].allCriteria[%d].value[%d]}";
            parmPhrase3_th = "#{oredCriteria[%d].allCriteria[%d].value[%d],typeHandler=%s}";
        }
        
        StringBuilder sb = new StringBuilder();
        List<Criteria> oredCriteria = example.getOredCriteria();
        boolean firstCriteria = true;
        for (int i = 0; i < oredCriteria.size(); i++) {
            Criteria criteria = oredCriteria.get(i);
            if (criteria.isValid()) {
                if (firstCriteria) {
                    firstCriteria = false;
                } else {
                    sb.append(" or ");
                }
                
                sb.append('(');
                List<Criterion> criterions = criteria.getAllCriteria();
                boolean firstCriterion = true;
                for (int j = 0; j < criterions.size(); j++) {
                    Criterion criterion = criterions.get(j);
                    if (firstCriterion) {
                        firstCriterion = false;
                    } else {
                        sb.append(" and ");
                    }
                    
                    if (criterion.isNoValue()) {
                        sb.append(criterion.getCondition());
                    } else if (criterion.isSingleValue()) {
                        if (criterion.getTypeHandler() == null) {
                            sb.append(String.format(parmPhrase1, criterion.getCondition(), i, j));
                        } else {
                            sb.append(String.format(parmPhrase1_th, criterion.getCondition(), i, j,criterion.getTypeHandler()));
                        }
                    } else if (criterion.isBetweenValue()) {
                        if (criterion.getTypeHandler() == null) {
                            sb.append(String.format(parmPhrase2, criterion.getCondition(), i, j, i, j));
                        } else {
                            sb.append(String.format(parmPhrase2_th, criterion.getCondition(), i, j, criterion.getTypeHandler(), i, j, criterion.getTypeHandler()));
                        }
                    } else if (criterion.isListValue()) {
                        sb.append(criterion.getCondition());
                        sb.append(" (");
                        List<?> listItems = (List<?>) criterion.getValue();
                        boolean comma = false;
                        for (int k = 0; k < listItems.size(); k++) {
                            if (comma) {
                                sb.append(", ");
                            } else {
                                comma = true;
                            }
                            if (criterion.getTypeHandler() == null) {
                                sb.append(String.format(parmPhrase3, i, j, k));
                            } else {
                                sb.append(String.format(parmPhrase3_th, i, j, k, criterion.getTypeHandler()));
                            }
                        }
                        sb.append(')');
                    }
                }
                sb.append(')');
            }
        }
        
        if (sb.length() > 0) {
            sql.WHERE(sb.toString());
        }
    }
}