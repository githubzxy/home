package com.enovell.yunwei.system.web;

import com.enovell.yunwei.system.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**用户登录过滤器
 * @author roy
 * 2014年8月29日-上午10:54:38
 */
public class IsLoginFilter implements Filter {
	
	private UserService userService;
	private FilterConfig c;

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	@Override
	public void destroy() {
		c = null;
	}
	
	private boolean isContains(String container, String[] regx) {
        for (int i = 0; i < regx.length; i++) {
            if (container.indexOf(regx[i]) != -1) {
                return true;
            }
        }
        return false;
    }

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest r = (HttpServletRequest)request;
		HttpServletResponse p = (HttpServletResponse)response;
		Object user = r.getSession().getAttribute("user");
		String userId = null;
		Cookie[] cookies = r.getCookies();
		if(cookies != null){
			for(Cookie c : cookies){
				if(c.getName().equals("railwayUser")){
					userId = c.getValue();
					break;
				}
			}
		}
//		//对静态资源和登录页面进行过滤，不用跳转
//		String excludes = c.getInitParameter("exclude");//从web.xml中获取不过滤参数
//		String[] excludeList = excludes.split(";");
		//首页相关页面不进行登录过滤
		String[] excludeList = new String[] {
				"indexTaskDetail.jsp",
				"indexCircuitWorkOrderDetail.jsp",
				"indexTask.jsp",
				"indexCircuitWorkOrder.jsp",
				"indexOnduty.jsp",
				"indexSaferule.jsp",
				"indexSaferuleDetail.jsp",
				"indexTecrule.jsp",
				"indexTecruleDetail.jsp",
				"indexWorkrule.jsp",
				"indexWorkruleDetail.jsp"
				};
		if(isContains(r.getRequestURI(), excludeList)){
			chain.doFilter(request, response);
			return;
		}
		if(user != null){//session中有已登录用户，正常运行
			chain.doFilter(request, response);
			return;
		}
		if(userId == null){//session中没有登录用户，也没有外系统传入ID，跳转到登录页面
			r.getRequestDispatcher("/logout.jsp").forward(request,response);
			return;
		}
		if(userId != null){//根据外系统传入id获取对应用户
			user = userService.getUserById(userId.toString());
		}
		if(user == null){//外系统传入id无法获取到对应用户，跳转到登录页面
			r.getRequestDispatcher("logout.jsp").forward(request,response);
			return;
		}else{//外系统传入id获取到对应用户,正常运行
			r.getSession().setAttribute("user", user);
			chain.doFilter(request, response);
		}
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	@Override
	public void init(FilterConfig config) throws ServletException {
		ServletContext context = config.getServletContext();  
        ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(context);  
        userService = (UserService) ctx.getBean("userService");
        c = config;
	}

}
