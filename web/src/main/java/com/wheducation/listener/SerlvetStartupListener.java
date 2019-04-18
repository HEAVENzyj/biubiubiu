package com.wheducation.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class SerlvetStartupListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent arg0) {
		//将web的项目路径保存在应用范围内
		//web的应用范围
		ServletContext application = arg0.getServletContext();
		//项目路径
		String path = application.getContextPath();
		//保存
		application.setAttribute("APP_PATH", path);
	}

}
