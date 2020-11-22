package com.angeltqs.crm.util;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class tqsUtil {
	
	public static String nowDate (){
		Date date=new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createTime=simpleDateFormat.format(date);
		return createTime;
	}
	
	public static List<Long> stringToLongList(String string){
        return Arrays.asList(string.split(",")).stream().map(s -> Long.parseLong(s.trim())).collect(Collectors.toList());
 }
	
}
