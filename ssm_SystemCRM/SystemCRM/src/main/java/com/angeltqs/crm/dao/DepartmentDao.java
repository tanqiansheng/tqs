package com.angeltqs.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

import com.angeltqs.crm.entity.DepartmentEntity;
import com.angeltqs.crm.entity.DepartmentEntityExample;

public interface DepartmentDao {
    /**
     *
     * @mbg.generated
     */
    @SelectProvider(type=DepartmentEntitySqlProvider.class, method="countByExample")
    long countByExample(DepartmentEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @DeleteProvider(type=DepartmentEntitySqlProvider.class, method="deleteByExample")
    int deleteByExample(DepartmentEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @Delete({
        "delete from crm_department",
        "where department_id = #{departmentId,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer departmentId);

    /**
     *
     * @mbg.generated
     */
    @Insert({
        "insert into crm_department (department_id, department_parent_id, ",
        "name, create_time, ",
        "last_change_time, status)",
        "values (#{departmentId,jdbcType=INTEGER}, #{departmentParentId,jdbcType=INTEGER}, ",
        "#{name,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
        "#{lastChangeTime,jdbcType=TIMESTAMP}, #{status,jdbcType=TINYINT})"
    })
    @SelectKey(statement="SELECT LAST_INSERT_ID()", keyProperty="departmentId", before=true, resultType=Integer.class)
    int insert(DepartmentEntity record);

    /**
     *
     * @mbg.generated
     */
    @InsertProvider(type=DepartmentEntitySqlProvider.class, method="insertSelective")
    @SelectKey(statement="SELECT LAST_INSERT_ID()", keyProperty="departmentId", before=true, resultType=Integer.class)
    int insertSelective(DepartmentEntity record);

    /**
     *
     * @mbg.generated
     */
    @SelectProvider(type=DepartmentEntitySqlProvider.class, method="selectByExample")
    @Results({
        @Result(column="department_id", property="departmentId", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="department_parent_id", property="departmentParentId", jdbcType=JdbcType.INTEGER),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="create_time", property="createTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="last_change_time", property="lastChangeTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="status", property="status", jdbcType=JdbcType.TINYINT)
    })
    List<DepartmentEntity> selectByExample(DepartmentEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @Select({
        "select",
        "department_id, department_parent_id, name, create_time, last_change_time, status",
        "from crm_department",
        "where department_id = #{departmentId,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="department_id", property="departmentId", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="department_parent_id", property="departmentParentId", jdbcType=JdbcType.INTEGER),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="create_time", property="createTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="last_change_time", property="lastChangeTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="status", property="status", jdbcType=JdbcType.TINYINT)
    })
    DepartmentEntity selectByPrimaryKey(Integer departmentId);

    /**
     *
     * @mbg.generated
     */
    @UpdateProvider(type=DepartmentEntitySqlProvider.class, method="updateByExampleSelective")
    int updateByExampleSelective(@Param("record") DepartmentEntity record, @Param("example") DepartmentEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @UpdateProvider(type=DepartmentEntitySqlProvider.class, method="updateByExample")
    int updateByExample(@Param("record") DepartmentEntity record, @Param("example") DepartmentEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @UpdateProvider(type=DepartmentEntitySqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(DepartmentEntity record);

    /**
     *
     * @mbg.generated
     */
    @Update({
        "update crm_department",
        "set department_parent_id = #{departmentParentId,jdbcType=INTEGER},",
          "name = #{name,jdbcType=VARCHAR},",
          "create_time = #{createTime,jdbcType=TIMESTAMP},",
          "last_change_time = #{lastChangeTime,jdbcType=TIMESTAMP},",
          "status = #{status,jdbcType=TINYINT}",
        "where department_id = #{departmentId,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(DepartmentEntity record);
}