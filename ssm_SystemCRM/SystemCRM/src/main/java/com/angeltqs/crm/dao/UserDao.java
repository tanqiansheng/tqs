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
@Repository
public interface UserDao {
	//查询所有
	@Select("select * from crm_user")
	public List<User> findAll();
	
	//添加
	@Options(useGeneratedKeys=true,keyProperty="u.uid")
	@Insert("insert into crm_user (dep_id,employee_id,user_name,user_pwd,create_date,status) values (#{u.depId},#{u.employeeId},#{u.userName},#{u.userPwd},#{u.createDate},#{u.status} )")
	
	public Boolean addUser(@Param("u")  User u);
	//修改
	@Update("update crm_user set dep_id=#{u.depId},employee_id=#{u.employeeId},user_name=#{u.userName},user_pwd=#{u.userPwd},create_date=#{u.createDate},status=#{u.status} where uid=#{u.uid}")
	public Boolean updateUser(@Param("u") User u);
	
	//删除
	@Delete("delete  from crm_user where uid=#{uid}")
	public Boolean deleteUser(Integer uid);
	
	//按ID查询
	@Select("select * from crm_user where uid=#{uid}")
	public User selecteByID(Integer uid);
	
	//批量插入
	@Options(useGeneratedKeys=true,keyProperty="uid")
	@Insert("<script>"+
	"insert into crm_user (dep_id,employee_id,user_name,user_pwd,create_date,status) values"
	+ "<foreach collection='list' item='u' separator=',' > "
	+ "(#{u.depId},#{u.employeeId},#{u.userName},#{u.userPwd},#{u.createDate},#{u.status})"
	+ "</foreach>"
	+ "</script>"
			)
	public int addUsers(@Param("list") List<User> users);
	
	//分页
	@Select( " SELECT * FROM crm_user  WHERE uid >= (  SELECT uid FROM crm_user  ORDER BY uid LIMIT #{pageIndexStart},1 )  ORDER BY uid LIMIT #{pageSize} "  )
	public List<User> selectPageList(@Param("pageIndexStart") int pageIndexStart, @Param("pageSize") int pageSize);

	@Select("  select count(uid) from crm_user ")
	public Long countBySize();
	//批量删除
	@Delete(" <script> delete  from crm_user where uid in <foreach collection='ids' open='(' item='uid' separator=',' close=')' > #{uid} </foreach> </script>"  )
	public void deleteUsers(@Param("ids")Integer[] ids);
	
	
	@Select("select * from crm_user where  "
									+ "dep_id like concat('%',#{keyWord},'%')or "
									+ "user_name like concat('%',#{keyWord},'%')or "
									+ "create_date like concat('%',#{keyWord},'%')or "
									+ "employee_id like concat('%',#{keyWord},'%') "
									+ "limit #{i},#{rows} ")
	public List<User>  findByCombination(@Param("i") int i, @Param("rows")Integer rows, @Param("keyWord")String keyWord);
	
	@Select("select count(uid) from crm_user where "
			+ "dep_id like concat('%',#{keyWord},'%')or "
			+ "user_name like concat('%',#{keyWord},'%')or "
			+ "create_date like concat('%',#{keyWord},'%')or "
			+ "employee_id like concat('%',#{keyWord},'%') ")
	public Integer  countFindByCombination(@Param("i") int i, @Param("rows")Integer rows, @Param("keyWord")String keyWord);

	
	@Select ("select * from crm_user where user_name=#{user_name} and user_pwd=#{user_pwd}")
	public User findByuser_nameaAnduser_pwd(@Param("user_name") String user_name,@Param("user_pwd")String user_pwd);
	
	
}
/*<select id="selectAdminByKeyword" resultMap="BaseResultMap">
select id, login_acct, user_pswd, user_name, user_pwd, create_time
from t_admin
where 
	login_acct like concat("%",#{keyword},"%") or 
	user_name like concat("%",#{keyword},"%") or 
	user_pwd like concat("%",#{keyword},"%")
</select>*/