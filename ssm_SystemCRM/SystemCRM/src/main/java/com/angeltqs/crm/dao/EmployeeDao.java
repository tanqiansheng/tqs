package com.angeltqs.crm.dao;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

import com.angeltqs.crm.entity.EmployeeEntity;
import com.angeltqs.crm.entity.EmployeeEntityExample;
import com.angeltqs.crm.entity.User;

public interface EmployeeDao {
    /**
     *
     * @mbg.generated
     */
    @SelectProvider(type=EmployeeEntitySqlProvider.class, method="countByExample")
    long countByExample(EmployeeEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @DeleteProvider(type=EmployeeEntitySqlProvider.class, method="deleteByExample")
    int deleteByExample(EmployeeEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @Delete({
        "delete from crm_employee",
        "where employee_id = #{employeeId,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer employeeId);

    /**
     *
     * @mbg.generated
     */
	@Options(useGeneratedKeys = true, keyProperty = "employeeId")
    @Insert({
        "insert into crm_employee (employee_id, department_id, ",
        "position_id, name, ",
        "sex, married, education, ",
        "tel, email, sid, ",
        "adders, hire_date, term_date, ",
        "status)",
        "values (#{employeeId,jdbcType=INTEGER}, #{departmentId,jdbcType=INTEGER}, ",
        "#{positionId,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
        "#{sex,jdbcType=TINYINT}, #{married,jdbcType=BIT}, #{education,jdbcType=TINYINT}, ",
        "#{tel,jdbcType=CHAR}, #{email,jdbcType=VARCHAR}, #{sid,jdbcType=CHAR}, ",
        "#{adders,jdbcType=VARCHAR}, #{hireDate,jdbcType=DATE}, #{termDate,jdbcType=DATE}, ",
        "#{status,jdbcType=TINYINT})"
    })
    int insert(EmployeeEntity record);

    /**
     *
     * @mbg.generated
     */
    @InsertProvider(type=EmployeeEntitySqlProvider.class, method="insertSelective")
    @SelectKey(statement="SELECT LAST_INSERT_ID()", keyProperty="employeeId", before=true, resultType=Integer.class)
    int insertSelective(EmployeeEntity record);

    /**
     *
     * @mbg.generated
     */
    @SelectProvider(type=EmployeeEntitySqlProvider.class, method="selectByExample")
    @Results({
        @Result(column="employee_id", property="employeeId", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="department_id", property="departmentId", jdbcType=JdbcType.INTEGER),
        @Result(column="position_id", property="positionId", jdbcType=JdbcType.INTEGER),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sex", property="sex", jdbcType=JdbcType.TINYINT),
        @Result(column="married", property="married", jdbcType=JdbcType.BIT),
        @Result(column="education", property="education", jdbcType=JdbcType.TINYINT),
        @Result(column="tel", property="tel", jdbcType=JdbcType.CHAR),
        @Result(column="email", property="email", jdbcType=JdbcType.VARCHAR),
        @Result(column="sid", property="sid", jdbcType=JdbcType.CHAR),
        @Result(column="adders", property="adders", jdbcType=JdbcType.VARCHAR),
        @Result(column="hire_date", property="hireDate", jdbcType=JdbcType.DATE),
        @Result(column="term_date", property="termDate", jdbcType=JdbcType.DATE),
        @Result(column="status", property="status", jdbcType=JdbcType.TINYINT)
    })
    List<EmployeeEntity> selectByExample(EmployeeEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @Select({
        "select",
        "employee_id, department_id, position_id, name, sex, married, education, tel, ",
        "email, sid, adders, hire_date, term_date, status",
        "from crm_employee",
        "where employee_id = #{employeeId,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="employee_id", property="employeeId", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="department_id", property="departmentId", jdbcType=JdbcType.INTEGER),
        @Result(column="position_id", property="positionId", jdbcType=JdbcType.INTEGER),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sex", property="sex", jdbcType=JdbcType.TINYINT),
        @Result(column="married", property="married", jdbcType=JdbcType.BIT),
        @Result(column="education", property="education", jdbcType=JdbcType.TINYINT),
        @Result(column="tel", property="tel", jdbcType=JdbcType.CHAR),
        @Result(column="email", property="email", jdbcType=JdbcType.VARCHAR),
        @Result(column="sid", property="sid", jdbcType=JdbcType.CHAR),
        @Result(column="adders", property="adders", jdbcType=JdbcType.VARCHAR),
        @Result(column="hire_date", property="hireDate", jdbcType=JdbcType.DATE),
        @Result(column="term_date", property="termDate", jdbcType=JdbcType.DATE),
        @Result(column="status", property="status", jdbcType=JdbcType.TINYINT)
    })
    EmployeeEntity selectByPrimaryKey(Integer employeeId);

    /**
     *
     * @mbg.generated
     */
    @UpdateProvider(type=EmployeeEntitySqlProvider.class, method="updateByExampleSelective")
    int updateByExampleSelective(@Param("record") EmployeeEntity record, @Param("example") EmployeeEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @UpdateProvider(type=EmployeeEntitySqlProvider.class, method="updateByExample")
    int updateByExample(@Param("record") EmployeeEntity record, @Param("example") EmployeeEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @UpdateProvider(type=EmployeeEntitySqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(EmployeeEntity record);

    /**
     *
     * @mbg.generated
     */
    @Update({
        "update crm_employee",
        "set department_id = #{departmentId,jdbcType=INTEGER},",
          "position_id = #{positionId,jdbcType=INTEGER},",
          "name = #{name,jdbcType=VARCHAR},",
          "sex = #{sex,jdbcType=TINYINT},",
          "married = #{married,jdbcType=BIT},",
          "education = #{education,jdbcType=TINYINT},",
          "tel = #{tel,jdbcType=CHAR},",
          "email = #{email,jdbcType=VARCHAR},",
          "sid = #{sid,jdbcType=CHAR},",
          "adders = #{adders,jdbcType=VARCHAR},",
          "hire_date = #{hireDate,jdbcType=DATE},",
          "term_date = #{termDate,jdbcType=DATE},",
          "status = #{status,jdbcType=TINYINT}",
        "where employee_id = #{employeeId,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(EmployeeEntity record);
  
}