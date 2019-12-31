package com.enovell.yunwei.system.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.system.domain.Menu;

import java.util.List;

/**用户菜单权限业务逻辑接口
 * @author roy
 * 2014年9月2日-下午6:39:32
 */
public interface MenuService {

	/**根据用户获取对应的菜单
	 * @param user
	 * @return
	 */
	List<Menu> getMenuByUser(User user);

}
