package com.wheducation.util;

public class StringUtil {

	/**
	 * 判断字符串为空
	 * @param context
	 * @return
	 */
	public static boolean isEmpty(String context){
		return context == null || "".equals(context);
	}
	
	/**
	 * 判断字符串不为空
	 * @param context
	 * @return
	 */
	public static boolean isNotEmpty(String context){
		return context != null && !"".equals(context);
	}
}
