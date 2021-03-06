package com.enovell.km_app_micro_service.dto;

/**
 * km_app_server
 * 巡检地点
 * @author bili
 * @date 2019/7/23
 */
public class CheckPoint {

    /**
     * id : 机房id
     * latitude : 纬度
     * longitude : 经度
     * special : 是否为特殊地点
     * code :  特殊地点需要扫码的二维码（string）
     * name : 机房名称（地点）
     * orgName : 所属机构(手动输入，数据来源暂定)
     * searchCycle : 检查周期（该需要打卡的地点以什么频率进行一次巡检）
     */

//    private int id;
    private String id;
    private double latitude;
    private double longitude;
    private boolean special;//index
    private String code;
    private String name;//index
    private String orgName;//index
    private String searchCycle;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public boolean isSpecial() {
        return special;
    }

    public void setSpecial(boolean special) {
        this.special = special;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getSearchCycle() {
		return searchCycle;
	}

	public void setSearchCycle(String searchCycle) {
		this.searchCycle = searchCycle;
	}
    
}