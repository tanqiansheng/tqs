package com.angeltqs.crm.common.util;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class TqsUtil {
	
	public static String nowDate (){
		/*
		 * Date date=new Date(); SimpleDateFormat simpleDateFormat = new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); String
		 * time=simpleDateFormat.format(date); Date createTime; try { createTime = new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time); } catch (ParseException
		 * e) { throw new RuntimeException("日期格式化有误"); }
		 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createTime = format.format(date);
	
		return createTime;
	}
	
	public static List<Long> stringToLongList(String string){
        return Arrays.asList(string.split(",")).stream().map(s -> Long.parseLong(s.trim())).collect(Collectors.toList());
 }
	
}
