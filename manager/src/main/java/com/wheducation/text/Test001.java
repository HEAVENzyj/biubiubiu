package com.wheducation.text;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test001 {

	public static void main(String[] args) {
		String str="adadadw";
		String regEx="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		Pattern p=Pattern.compile(regEx);
		Matcher m=p.matcher(str);
		System.out.println(m.find());
	}

}
