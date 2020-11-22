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

import com.angeltqs.crm.entity.PositionEntity;
import com.angeltqs.crm.entity.PositionEntityExample;

public interface PositionDao {
    /**
     *
     * @mbg.generated
     */
    @SelectProvider(type=PositionEntitySqlProvider.class, method="countByExample")
    long countByExample(PositionEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @DeleteProvider(type=PositionEntitySqlProvider.class, method="deleteByExample")
    int deleteByExample(PositionEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @Delete({
        "delete from crm_position",
        "where position_id = #{positionId,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer positionId);

    /**
     *
     * @mbg.generated
     */
    @Insert({
        "insert into crm_position (position_id, name, ",
        "status)",
        "values (#{positionId,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
        "#{status,jdbcType=TINYINT})"
    })
    @SelectKey(statement="SELECT LAST_INSERT_ID()", keyProperty="positionId", before=true, resultType=Integer.class)
    int insert(PositionEntity record);

    /**
     *
     * @mbg.generated
     */
    @InsertProvider(type=PositionEntitySqlProvider.class, method="insertSelective")
    @SelectKey(statement="SELECT LAST_INSERT_ID()", keyProperty="positionId", before=true, resultType=Integer.class)
    int insertSelective(PositionEntity record);

    /**
     *
     * @mbg.generated
     */
    @SelectProvider(type=PositionEntitySqlProvider.class, method="selectByExample")
    @Results({
        @Result(column="position_id", property="positionId", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="status", property="status", jdbcType=JdbcType.TINYINT)
    })
    List<PositionEntity> selectByExample(PositionEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @Select({
        "select",
        "position_id, name, status",
        "from crm_position",
        "where position_id = #{positionId,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="position_id", property="positionId", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="status", property="status", jdbcType=JdbcType.TINYINT)
    })
    PositionEntity selectByPrimaryKey(Integer positionId);

    /**
     *
     * @mbg.generated
     */
    @UpdateProvider(type=PositionEntitySqlProvider.class, method="updateByExampleSelective")
    int updateByExampleSelective(@Param("record") PositionEntity record, @Param("example") PositionEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @UpdateProvider(type=PositionEntitySqlProvider.class, method="updateByExample")
    int updateByExample(@Param("record") PositionEntity record, @Param("example") PositionEntityExample example);

    /**
     *
     * @mbg.generated
     */
    @UpdateProvider(type=PositionEntitySqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(PositionEntity record);

    /**
     *
     * @mbg.generated
     */
    @Update({
        "update crm_position",
        "set name = #{name,jdbcType=VARCHAR},",
          "status = #{status,jdbcType=TINYINT}",
        "where position_id = #{positionId,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(PositionEntity record);
}