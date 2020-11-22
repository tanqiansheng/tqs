package com.angeltqs.crm.dao;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.angeltqs.crm.entity.User;


/*private Integer uid;

private Integer depId;

private Integer employeeId;

private String username;

private String userpwd;

private Date createdate;

private Byte status;
*/

@Repository
public interface UserDao {
	//查询所有
	@Select("select * from tb_user")
	public List<User> findAll();
	
	//添加
	@Options(useGeneratedKeys=true,keyProperty="u.uid")
	@Insert("insert into tb_user (depId,employeeId,username,userpwd,createdate,status) values (#{u.depId},#{u.employeeId},#{u.username},#{u.userpwd},#{u.createdate},#{u.status} )")
	
	public Boolean addUser(@Param("u")  User u);
	//修改
	@Update("update tb_user set depId=#{u.depId},employeeId=#{u.employeeId},username=#{u.username},userpwd=#{u.userpwd},createdate=#{u.createdate},,createdate=#{u.status} where uid=#{u.uid}")
	public Boolean updateUser(@Param("u") User u);
	
	//删除
	@Delete("delete  from tb_user where uid=#{uid}")
	public Boolean deleteUser(Integer uid);
	
	//按ID查询
	@Select("select * from tb_user where uid=#{uid}")
	public User selecteByID(Integer uid);
	
	//批量插入
	@Options(useGeneratedKeys=true,keyProperty="uid")
	@Insert("<script>"+
	"insert into tb_user (dep_id,employee_id,username,userpwd,createdate,status) values"
	+ "<foreach collection='list' item='u' separator=',' > "
	+ "(#{u.depId},#{u.employeeId},#{u.username},#{u.userpwd},#{u.createdate},#{u.status})"
	+ "</foreach>"
	+ "</script>"
			)
	public int addUsers(@Param("list") List<User> users);
	
	//分页
	@Select( " SELECT * FROM tb_user  WHERE uid >= (  SELECT uid FROM tb_user  ORDER BY uid LIMIT #{pageIndexStart},1 )  ORDER BY uid LIMIT #{pageSize} "  )
	public List<User> selectPageList(@Param("pageIndexStart") int pageIndexStart, @Param("pageSize") int pageSize);

	@Select("  select count(uid) from tb_user ")
	public Long countBySize();
	//批量删除
	@Delete(" <script> delete  from tb_user where uid in <foreach collection='ids' open='(' item='uid' separator=',' close=')' > #{uid} </foreach> </script>"  )
	public void deleteUsers(@Param("ids")Integer[] ids);
	
	
	@Select("select * from tb_user where ss "
									+ "dep_id like concat('%',#{keyWord},'%')or "
									+ "user_name like concat('%',#{keyWord},'%')or "
									+ "create_date like concat('%',#{keyWord},'%')or "
									+ "employee_id like concat('%',#{keyWord},'%') "
									+ "limit #{i},#{rows} ")
	public List<User>  findByCombination(@Param("i") int i, @Param("rows")Integer rows, @Param("keyWord")String keyWord);
	
	@Select("select count(uid) from tb_user where ss"
			+ "dep_id like concat('%',#{keyWord},'%')or "
			+ "user_name like concat('%',#{keyWord},'%')or "
			+ "create_date like concat('%',#{keyWord},'%')or "
			+ "employee_id like concat('%',#{keyWord},'%') ")
	public Integer  countFindByCombination(@Param("i") int i, @Param("rows")Integer rows, @Param("keyWord")String keyWord);
	
	
}
/*<select id="selectAdminByKeyword" resultMap="BaseResultMap">
select id, login_acct, user_pswd, user_name, userpwd, create_time
from t_admin
where 
	login_acct like concat("%",#{keyword},"%") or 
	user_name like concat("%",#{keyword},"%") or 
	userpwd like concat("%",#{keyword},"%")
</select>*/