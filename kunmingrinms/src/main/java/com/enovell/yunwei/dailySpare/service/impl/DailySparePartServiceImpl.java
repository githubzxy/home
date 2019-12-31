
/**
 * 文件名：SparePartServiceImpl.java
 * 版本信息：IRMS1.0
 * 日期：2016-11-30 下午12:02:46
 * Copyright Enovell Corporation 2016
 * 版权所有
 */

package com.enovell.yunwei.dailySpare.service.impl;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.dailySpare.ImportDailySpare;
import com.enovell.yunwei.dailySpare.domain.DailyDeviceName;
import com.enovell.yunwei.dailySpare.domain.DailySpareNorm;
import com.enovell.yunwei.dailySpare.domain.DailySparePart;
import com.enovell.yunwei.dailySpare.domain.DailySpareUseStock;
import com.enovell.yunwei.dailySpare.dto.DailySpareAndNormDTO;
import com.enovell.yunwei.dailySpare.dto.DailySpareAndNormExportDTO;
import com.enovell.yunwei.dailySpare.dto.DailySparePartDTO;
import com.enovell.yunwei.dailySpare.dto.DailySparePartExportDTO;
import com.enovell.yunwei.dailySpare.dto.DailySparePartInfoDTO;
import com.enovell.yunwei.dailySpare.dto.DailySparePartShowDTO;
import com.enovell.yunwei.dailySpare.service.DailyDeviceNameService;
import com.enovell.yunwei.dailySpare.service.DailySpareNormService;
import com.enovell.yunwei.dailySpare.service.DailySparePartService;
import com.enovell.yunwei.dailySpare.service.DailySpareUseStockService;
import com.enovell.yunwei.system.service.OrganizationService;
import com.enovell.yunwei.util.DataExistStatus;
import com.enovell.yunwei.util.GetRootPathUtil;


/**
 * 项目名称：kunmingrinms
 * 类名称：SparePartServiceImpl   
 * 类描述:  备品管理-接口实现类
 * 创建人：ltf 
 * 创建时间：2016-11-30 下午12:02:46
 * 修改人：ltf
 * 修改时间：2016-11-30 下午12:02:46   
 *
 */
@SuppressWarnings("unchecked")
@Service("dailySparePartService")
@Transactional
public class DailySparePartServiceImpl implements DailySparePartService {

    @Autowired
    private SessionFactory sessionFactory;

    @Resource(name = "dailyDeviceNameService")
    DailyDeviceNameService dailyDeviceNameService;

    @Resource(name = "organizationService")
    private OrganizationService organizationService;

    @Resource(name = "dailySpareUseStockService")
    DailySpareUseStockService dailySpareUseStockService;

    @Resource(name = "dailySpareNormService")
    DailySpareNormService dailySpareNormService;
    @Autowired
	private NamedParameterJdbcTemplate template;
    @Resource(name = "jdbcTemplate")
    private JdbcTemplate jdbcTemplate;

    @Override
    public DailySparePart addSparePart(DailySparePart dailySparePart, DailySpareUseStock useStock) {
        sessionFactory.getCurrentSession().save(dailySparePart);//保存
        dailySpareUseStockService.addSpareUseStock(useStock);//保存，添加一条使用记录
        return dailySparePart;
    }

    @Override
    public DailySparePart addSparePart(DailySparePartInfoDTO spareInfo, User user) {
        //将参数转化为日常备品
        DailySparePart dailySparePart = convertSparePartInfoDTOToSparePart(spareInfo);

        //创建一条使用记录
        DailySpareUseStock useStock = new DailySpareUseStock();
        useStock.setAmount(dailySparePart.getAmount());
        useStock.setDate(new Date());
        useStock.setReason("新增");
        useStock.setUser(user);
        useStock.setDailySparePart(dailySparePart);//将备品添加到使用记录中
        useStock.setState(DailySpareUseStock.RUKU);//入库状态
        //保存
        return addSparePart(dailySparePart, useStock);
    }

    /**
     *
     * convertSparePartInfoDTOToSparePart 将前端获取的备品信息转化为日常备品
     * @param spareInfo
     * @return
     */
    private DailySparePart convertSparePartInfoDTOToSparePart(DailySparePartInfoDTO spareInfo) {
        //根据id获取设备名称
        DailyDeviceName sparePartName = dailyDeviceNameService.getDeviceNameById(spareInfo.getDeviceNameId());
        //根据id获取车间
        Organization workShop = organizationService.getOrgChildrenById(spareInfo.getWorkShopId());
        //根据id获取工区
        Organization workArea = null;
        ;
        String workAreaId = spareInfo.getWorkAreaId();
        if (StringUtils.isNotBlank(workAreaId)) {//若workAreaId不为空，则说明有工区
            workArea = organizationService.getOrgChildrenById(workAreaId);
        } else {//若workAreaId为空，则工区名同车间名
            workArea = workShop;
        }
        DailySparePart sp = new DailySparePart();
        sp.setAmount(spareInfo.getAmount());
        sp.setSpeciality(spareInfo.getSpeciality());
        sp.setPlatesName(spareInfo.getPlatesName());
        sp.setSparePartModel(spareInfo.getSparePartModel());
        sp.setWorkShop(workShop);
        sp.setWorkArea(workArea);
        sp.setUnit(spareInfo.getUnit());
        sp.setCreateDate(new Date());//添加日期为当前时间
        sp.setComment(spareInfo.getComment());
        sp.setDeviceProperties(spareInfo.getDeviceProperties());
        sp.setDepositLocation(spareInfo.getDepositLocation());
        sp.setFactory(spareInfo.getFactory());
        sp.setCheckStatus(DailySparePart.NO_CHECK);
        sp.setBuyDate(spareInfo.getBuyDate());
        sp.setBuyReason(spareInfo.getBuyReason());
        sp.setInDate(new Date());
        sp.setSoftwareEdition(spareInfo.getSoftwareEdition());
        sp.setAvailableModle(spareInfo.getAvailableModle());
        sp.setSingleNumber(spareInfo.getSingleNumber());
        return sp;
    }

    @Override
    public DailySparePart updateSparePart(DailySparePart dailySparePart) {
        sessionFactory.getCurrentSession().saveOrUpdate(dailySparePart);
        return dailySparePart;
    }

    @Override
    public DailySparePart updateSparePartNoRecordUseStock(DailySparePart paramSpare) {
        DailySparePart dailySparePart = getSparePartById(paramSpare.getId());
        dailySparePart.setSparePartModel(paramSpare.getSparePartModel());
        dailySparePart.setAmount(paramSpare.getAmount());
        dailySparePart.setComment(paramSpare.getComment());
        dailySparePart.setCheckStatus(DailySparePart.NO_CHECK);
        dailySparePart.setCheckUser(null);
        dailySparePart.setCheckDate(null);
        sessionFactory.getCurrentSession().saveOrUpdate(dailySparePart);
        return dailySparePart;
    }


    @Override
    public DailySparePart inSparePart(DailySparePart paramSpare, User user) {
        DailySparePart dailySparePart = getSparePartById(paramSpare.getId());
        if(dailySparePart.getAmount()!=null) {
        	dailySparePart.setAmount(dailySparePart.getAmount() + paramSpare.getAmount());
        }else {
        	dailySparePart.setAmount(paramSpare.getAmount());
        }
//        dailySparePart.setAmount(dailySparePart.getAmount() + paramSpare.getAmount());//入库，数量增加
        dailySparePart.setComment(paramSpare.getComment());//备注
        dailySparePart.setCheckStatus(DailySparePart.NO_CHECK);
        dailySparePart.setCheckUser(null);
        dailySparePart.setCheckDate(null);
        dailySparePart.setInDate(paramSpare.getInDate());
//        dailySparePart.setInDate(new Date());
        //更新当前备品
        updateSparePart(dailySparePart);
        //添加一条使用记录
        dailySpareUseStockService.addSpareUseStock(paramSpare.getAmount(), "入库", user, dailySparePart, DailySpareUseStock.RUKU);
        return dailySparePart;
    }

    @Override
    public DailySparePart outOrScrapSparePart(DailySparePart paramSpare, User user, String rearon) {
        DailySparePart dailySparePart = getSparePartById(paramSpare.getId());
        dailySparePart.setAmount(dailySparePart.getAmount() - paramSpare.getAmount());//出库，数量减少
        dailySparePart.setCheckStatus(DailySparePart.NO_CHECK);
        dailySparePart.setCheckUser(null);
        dailySparePart.setCheckDate(null);
        //修改原记录
        updateSparePart(dailySparePart);
        //添加一条使用记录
        dailySpareUseStockService.addSpareUseStock(paramSpare.getAmount(), rearon, user, dailySparePart, DailySpareUseStock.CHUKU);
        return dailySparePart;
    }

    @Override
    public DailySparePart ReturnSparePart(DailySparePart paramSpare, User user) {
        DailySparePart dailySparePart = getSparePartById(paramSpare.getId());
        dailySparePart.setAmount(dailySparePart.getAmount() - paramSpare.getAmount());//返厂，数量减少
        dailySparePart.setCheckStatus(DailySparePart.NO_CHECK);
        dailySparePart.setCheckUser(null);
        dailySparePart.setCheckDate(null);
        //修改原记录
        updateSparePart(dailySparePart);
        //添加一条使用记录
        dailySpareUseStockService.addSpareUseStock(paramSpare.getAmount(), "返厂", user, dailySparePart, DailySpareUseStock.CHUKU);
        return dailySparePart;
    }


    @Override
    public void moveSparePart(String id, String workShopId, String workAreaId, double amountMove, User user) {
        Organization workShop = organizationService.getOrgChildrenById(workShopId);//接收车间
        Organization workArea = null;
        if (StringUtils.isNotBlank(workAreaId)) {//若workAreaId不为空，则说明有工区
            workArea = organizationService.getOrgChildrenById(workAreaId);//接收工区
        } else {//若workAreaId为空，则工区名同车间名
            workArea = workShop;
        }
        //根据id查询备品
        DailySparePart dailySparePart = getSparePartById(id);
        //更改原备品记录的数量
        dailySparePart.setAmount(dailySparePart.getAmount() - amountMove);//移库数量减少
        dailySparePart.setCheckStatus(DailySparePart.NO_CHECK);
        dailySparePart.setCheckUser(null);
        dailySparePart.setCheckDate(null);
        //修改
        updateSparePart(dailySparePart);
        //添加一条出库记录
        String rearon = "移库至 - " + workShop.getName() + " / " + workArea.getName();
        dailySpareUseStockService.addSpareUseStock(amountMove, rearon, user, dailySparePart, DailySpareUseStock.CHUKU);

        // 对移出备品，在接收记录上新增或添加数量，同时添加入库记录
        //判断移库的备品是否有重复记录
        DailySparePartDTO dto = new DailySparePartDTO();//查询条件
        dto.setSpeciality(dailySparePart.getSpeciality());
//        dto.setDeviceNameId(dailySparePart.getSparePartName().getId());
        dto.setPlatesName(dailySparePart.getPlatesName());
        dto.setSparePartModel(dailySparePart.getSparePartModel());
        dto.setWorkShopId(workShop.getId());
        dto.setWorkAreaId(workArea.getId());

        DailySparePart spIn = null;
        if (repeatValidate(dto)) {// 若判断有重复的,对已有备品数量进行修改，并添加使用记录
            spIn = getSparePartsByDTO(dto, 0, 1).get(0);//仅一条
            spIn.setAmount(spIn.getAmount() + amountMove);//数量增加
            spIn.setInDate(new Date());
            spIn.setCheckStatus(DailySparePart.NO_CHECK);
            spIn.setCheckUser(null);
            spIn.setCheckDate(null);
            //更新原记录
            updateSparePart(spIn);
            //添加一条使用记录
            String rearonIn = "由 - " + dailySparePart.getWorkShop().getName() + " / " + dailySparePart.getWorkArea().getName() + " - 移入";
            dailySpareUseStockService.addSpareUseStock(amountMove, rearonIn, user, dailySparePart, DailySpareUseStock.RUKU);
            return;
        }
        //无重复的，则直接增加一条备品记录，并添加使用记录
        spIn = new DailySparePart();
        spIn.setAmount(amountMove);
        spIn.setSpeciality(dailySparePart.getSpeciality());
        spIn.setPlatesName(dailySparePart.getPlatesName());
        spIn.setUnit(dailySparePart.getUnit());
        spIn.setSparePartModel(dailySparePart.getSparePartModel());
        spIn.setWorkShop(workShop);
        spIn.setWorkArea(workArea);
        spIn.setFactory(dailySparePart.getFactory());
        spIn.setDeviceProperties(dailySparePart.getDeviceProperties());
        spIn.setDepositLocation(dailySparePart.getDepositLocation());
        spIn.setCreateDate(new Date());//添加日期为当前时间
        spIn.setComment("新增");
        spIn.setInDate(new Date());
        spIn.setBuyDate(dailySparePart.getBuyDate());
        spIn.setBuyReason(dailySparePart.getBuyReason());
        spIn.setSoftwareEdition(dailySparePart.getSoftwareEdition());
        spIn.setCheckStatus(DailySparePart.NO_CHECK);
        spIn.setCheckUser(null);
        spIn.setCheckDate(null);
        spIn.setAvailableModle(dailySparePart.getAvailableModle());
        spIn.setSingleNumber(dailySparePart.getSingleNumber());
        //添加一条使用记录
        DailySpareUseStock useStockIn = new DailySpareUseStock();
        useStockIn.setAmount(amountMove);
        useStockIn.setDate(new Date());
        useStockIn.setReason("由 - " + dailySparePart.getWorkShop().getName() + " / " + dailySparePart.getWorkArea().getName() + " - 移入");
        useStockIn.setDailySparePart(spIn);
        useStockIn.setState(DailySpareUseStock.RUKU);//入库状态
        useStockIn.setUser(user);

        //添加
        addSparePart(spIn, useStockIn);
    }


    /**
     * repeatValidate 判断同一种备品在同一工区是否有重复记录
     * @param dto 设备类别、名称、型号、车间、工区
     * @return
     */
    private boolean repeatValidate(DailySparePartDTO dto) {
        Long n = getSparePartCount(dto);
        if (n == 0) {//不存在相同记录，仅增加数量
            return false;
        } else {//存在相同记录，新增一条记录
            return true;
        }
    }

    /**
     *
     * deleteSparePartsById 根据id,删除数据
     * @param idArr
     */
    private void deleteSparePartsById(String[] idArr) {
        //先删除日常备品对应的使用记录
        List<DailySparePart> dailySparePartList = getSparePartByIds(idArr);
        dailySpareUseStockService.deleteSpareUseStockBySparePart(dailySparePartList);
        //删除日常备品
        String hql = " delete from SparePart sp where sp.id in (:ids) ";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameterList("ids", idArr).executeUpdate();
    }

    @Override
    public void deleteSpareParts(String[] idArr) {
//		deleteSparePartsById(idArr);
        delSparePartsById(idArr);
    }

    /**
     *
     * delSparePartsById 逻辑删除
     * @param idArr
     */
    private void delSparePartsById(String[] idArr) {
        if (idArr != null && idArr.length != 0) {
            for (String id : idArr) {
                DailySparePart dailySparePart = (DailySparePart) sessionFactory
                        .getCurrentSession().load(DailySparePart.class, id);
                dailySparePart.setExist(DataExistStatus.NOT_EXIST);
                sessionFactory.getCurrentSession().saveOrUpdate(dailySparePart);
            }
        }
    }

    @Override
    public DailySparePart getSparePartById(String id) {
        String hql = " FROM DailySparePart e "
                + " LEFT JOIN FETCH e.sparePartName spn "
                + " LEFT JOIN FETCH e.workShop ws "
                + " LEFT JOIN FETCH e.workArea wa "
                + " WHERE e.id =:id ";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("id", id);
        return (DailySparePart) query.uniqueResult();
    }

    @Override
    public List<DailySparePart> getSparePartByIds(String[] ids) {
        String hql = " FROM DailySparePart e "
                + " LEFT JOIN FETCH e.sparePartName spn "
                + " LEFT JOIN FETCH e.workShop ws "
                + " LEFT JOIN FETCH e.workArea wa "
                + " WHERE e.id in (:ids) ";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameterList("ids", ids);
        return query.list();
    }

    /**
     * createSql 封装条件查询hql语句
     * @param dto
     * @param hql
     * @param map
     * @return
     */
    private String createSql(DailySparePartDTO dto, String hql, Map<String, Object> map) {
        if (dto == null) {
            return hql;
        }
        StringBuffer buffer = new StringBuffer();
        buffer.append(hql);
        // 删除字段为空的条件(即未删除)
        buffer.append(" AND e.exist =:exist ");
        map.put("exist", DataExistStatus.EXIST);
        String platesName = dto.getPlatesName();
        if (StringUtils.isNotBlank(platesName)) {//板件名称
        	buffer.append(" AND e.platesName Like :platesName ");
        	map.put("platesName", "%" + platesName.trim() + "%");
        }
        String sparePartModel = dto.getSparePartModel();
        if (StringUtils.isNotBlank(sparePartModel)) {//规格型号
            buffer.append(" AND e.sparePartModel Like :sparePartModel ");
            map.put("sparePartModel", "%" + sparePartModel.trim() + "%");
        }
//        Integer speciality = dto.getSpeciality();
        String speciality = dto.getSpeciality();
        if (StringUtils.isNotBlank(speciality)) {
            buffer.append(" AND e.speciality =:speciality ");
            map.put("speciality", speciality);
        }
//        String deviceNameId = dto.getDeviceNameId();
//        if (StringUtils.isNotBlank(deviceNameId)) {
//            buffer.append(" AND spn.id =:deviceNameId ");
//            map.put("deviceNameId", deviceNameId);
//        }
        if (StringUtils.isNotBlank(dto.getDeviceProperties())) {
            buffer.append(" AND e.deviceProperties =:deviceProperties ");
            map.put("deviceProperties", dto.getDeviceProperties());
        }

        String workShopId = dto.getWorkShopId();
        if (StringUtils.isNotBlank(workShopId)) {
            String[] workShopIds = workShopId.split(",");
            String workShopParam = "(";
            for (int i = 0; i < workShopIds.length; i++) {
                if (i == (workShopIds.length - 1)) {
                    workShopParam += "'" + workShopIds[i] + "') ";
                } else {
                    workShopParam += "'" + workShopIds[i] + "',";
                }
            }
            buffer.append(" AND ws.id in " + workShopParam);
//			map.put("workShopId", workShopId);
        }
        String workAreaId = dto.getWorkAreaId();
        if (StringUtils.isNotBlank(workAreaId)) {
            buffer.append(" AND wa.id =:workAreaId ");
            map.put("workAreaId", workAreaId);
        }

//        if (StringUtils.isNotBlank(dto.getCheckStatus())) {
//            buffer.append(" AND e.checkStatus =:checkStatus ");
//            map.put("checkStatus", dto.getCheckStatus());
//        }

        if (dto.getInStartDate() != null) {
            buffer.append(" AND e.inDate >=:inStartDate ");
            map.put("inStartDate", dto.getInStartDate());
        }
        if (dto.getInEndDate() != null) {
            buffer.append(" AND e.inDate <=:inEndDate ");
            map.put("inEndDate", dto.getInEndDate());
        }
        return buffer.toString();
    }

    @Override
    public List<DailySparePart> getAllSparePartsByDTO(DailySparePartDTO dto) {
        String hql = " FROM DailySparePart e "
//                + " LEFT JOIN FETCH e.sparePartName spn "
                + " LEFT JOIN FETCH e.workShop ws "
                + " LEFT JOIN FETCH e.workArea wa "
                + " WHERE 1 = 1 ";
        Map<String, Object> map = new HashMap<String, Object>();
        hql = createSql(dto, hql, map) + "ORDER BY e.createDate DESC";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        for (Entry<String, Object> entry : map.entrySet()) {
            query.setParameter(entry.getKey(), entry.getValue());
        }
        return query.list();
    }

    @Override
    public List<DailySparePart> getSparePartsByDTO(DailySparePartDTO dto, int first, int max) {
        String hql = " FROM DailySparePart e "
                + " LEFT JOIN FETCH e.sparePartName spn "
                + " LEFT JOIN FETCH e.workShop ws "
                + " LEFT JOIN FETCH e.workArea wa "
                + " LEFT JOIN FETCH e.checkUser us "
                + " WHERE 1 = 1 ";
        Map<String, Object> map = new HashMap<String, Object>();
        hql = createSql(dto, hql, map) + "ORDER BY e.createDate DESC";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setFirstResult(first);
        query.setMaxResults(max);
        for (Entry<String, Object> entry : map.entrySet()) {
            query.setParameter(entry.getKey(), entry.getValue());
        }
        return query.list();
    }

    @Override
    public Long getSparePartCount(DailySparePartDTO dto) {
        String hql = " SELECT count(*) FROM DailySparePart e WHERE 1=1 ";
        Map<String, Object> map = new HashMap<String, Object>();

        if (dto != null) {
            String sparePartModel = dto.getSparePartModel();
            if (StringUtils.isNotBlank(sparePartModel)) {//规格型号
                hql += " AND e.sparePartModel Like :sparePartModel ";
                map.put("sparePartModel", "%" + sparePartModel.trim() + "%");
            }
            String speciality = dto.getSpeciality();
            if (speciality != null) {
                hql += " AND e.speciality =:speciality ";
                map.put("speciality", speciality);
            }
            String workShopId = dto.getWorkShopId();
            if (StringUtils.isNotBlank(workShopId)) {
                String[] workShopIds = workShopId.split(",");
                String workShopParam = "(";
                for (int i = 0; i < workShopIds.length; i++) {
                    if (i == (workShopIds.length - 1)) {
                        workShopParam += "'" + workShopIds[i] + "') ";
                    } else {
                        workShopParam += "'" + workShopIds[i] + "',";
                    }
                }
                hql += (" AND e.workShop.id in " + workShopParam);
//				hql+=" AND e.workShop.id =:workShopId ";
//				map.put("workShopId", workShopId);
            }
            String workAreaId = dto.getWorkAreaId();
            if (StringUtils.isNotBlank(workAreaId)) {
                hql += " AND e.workArea.id =:workAreaId ";
                map.put("workAreaId", workAreaId);
            }

        }
        // 删除字段为空的条件(即未删除)
        hql += " AND e.exist =:exist ";
        map.put("exist", DataExistStatus.EXIST);
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        for (Entry<String, Object> entry : map.entrySet()) {
            query.setParameter(entry.getKey(), entry.getValue());
        }
        return (Long) query.uniqueResult();
    }

    @Override
    public List<DailySparePartShowDTO> getSparePartShowDto(DailySparePartDTO dto, int first, int max) {
        List<DailySparePart> sptList = getSparePartsByDTO(dto, first, max);
        List<DailySparePartShowDTO> showDtoList = new ArrayList<DailySparePartShowDTO>();
        for (DailySparePart sp : sptList) {
            DailySparePartShowDTO show = new DailySparePartShowDTO();
            show.setId(sp.getId());
            show.setSpeciality(sp.getSpeciality());
//            if (sp.getSparePartName() != null) {
//                show.setSparePartName(sp.getSparePartName().getName());
//            }
            show.setSparePartModel(sp.getSparePartModel());
            if (sp.getSparePartName() != null) {
                show.setUnit(sp.getUnit());
            }
            show.setAmount(sp.getAmount());
            show.setWorkShop(sp.getWorkShop() != null ? sp.getWorkShop().getName() : null);
            if (sp.getWorkArea() != null) {
                show.setWorkArea(sp.getWorkArea().getName());
            }
            show.setFactory(sp.getFactory());
            show.setDepositLocation(sp.getDepositLocation());
            show.setDeviceProperties(sp.getDeviceProperties());
            show.setComment(sp.getComment());
            show.setCheckStatus(sp.getCheckStatus());
            show.setCheckUser(sp.getCheckUser());
            show.setCheckDate(sp.getCheckDate());
            show.setInDate(sp.getInDate());
            show.setBuyDate(sp.getBuyDate());
            show.setBuyReason(sp.getBuyReason());
            show.setPlatesName(sp.getPlatesName());
            show.setUnit(sp.getUnit());
            show.setAvailableModle(sp.getAvailableModle());
            show.setSingleNumber(sp.getSingleNumber());
            show.setSoftwareEdition(sp.getSoftwareEdition());
            showDtoList.add(show);
        }
        return showDtoList;
    }

    @Override
    public List<Map<String, Object>> getAreaSpareStatisticsByShop(String workShopId) {

        DailySparePartDTO dto = new DailySparePartDTO();
        dto.setWorkShopId(workShopId);
        //根据车间id查询所有备品信息
        List<DailySparePart> dailySparePartList = getAllSparePartsByDTO(dto);
        //遍历备品信息，并合并相同备品记录
        List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
        for (int i = 0; i < dailySparePartList.size(); i++) {
            DailySparePart sp = dailySparePartList.get(i);
            if (i == 0) {//第一条记录无需比较
                Map<String, Object> map = ConvertSpareToMap(sp);
                rows.add(map);
                continue;
            }
            //将当前备品与所有所有map集合中的记录比较，若备品相同（类别、名称、型号、设备名称均相同）， 则合并成一条记录，
            combineSameSparePartData(rows, sp);
        }

        return rows;
    }

    /**
     * combineSameSparePartData
     * 将当前备品与所有所有map集合中的记录比较，若备品相同（类别、名称、型号均相同），
     * 则合并成一条记录，不相同则仍单独成一条数据
     * @param rows
     * @param sp
     */
    private void combineSameSparePartData(
            List<Map<String, Object>> rows, DailySparePart sp) {
        int length = rows.size();
        for (int j = 0; j < length; j++) {
            Map<String, Object> map = rows.get(j);
            String speciality = map.get("speciality") != null ? map.get("speciality").toString() : "";
            String sparePartName = map.get("sparePartName").toString();
            String sparePartModel = map.get("sparePartModel") != null ? map.get("sparePartModel").toString() : "";
            String sparePartDeviceProperties = "";
            String deviceProperties = "";
            if (sp.getDeviceProperties() != null) {
                deviceProperties = sp.getDeviceProperties();
            }
            if (map.get("deviceProperties") != null) {
                sparePartDeviceProperties = map.get("deviceProperties").toString();
            }
            String specialityOther = sp.getSpeciality() != null ? sp.getSpeciality().toString() : "";
            String sparePartNameOther = sp.getSparePartName() != null ? sp.getSparePartName().getName() : "";
            String sparePartModelOther = sp.getSparePartModel() != null ? sp.getSparePartModel().toString() : "";
            //若备品相同（类别、名称、型号均相同），则统计成一条数据
            if (specialityOther.equals(speciality)
                    && sparePartNameOther.equals(sparePartName)
                    && sparePartModelOther.equals(sparePartModel)
                    && deviceProperties.equals(sparePartDeviceProperties)
            ) {
                //由于备品相同（只是在不同地点），将该数据“地点及数量信息”添加到rows集合对应的位置
                if (sp.getWorkArea() != null) {
                    map.put(sp.getWorkArea().getId(), sp.getAmount());
                }
                Double amount = sp.getAmount() != null ? sp.getAmount() : 0;
                //计算总数
                Double sum = (Double) map.get("sum") + amount;
                map.put("sum", sum);
                break;
            }
            //若全部计较完成均不同，则单独成一条数据，并添加至rows集合中
            if (j == length - 1) {
                Map<String, Object> mapNew = ConvertSpareToMap(sp);
                rows.add(mapNew);
            }
        }

    }

    /**
     * ConvertSpareToMap 根据页面需求，将备品转化为map数据
     * @param dailySparePart 备品
     * @return
     */
    private Map<String, Object> ConvertSpareToMap(DailySparePart dailySparePart) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("speciality", dailySparePart.getSpeciality());
//        if (dailySparePart.getSparePartName() != null) {
//            map.put("sparePartName", dailySparePart.getSparePartName().getName());
//            map.put("unit", dailySparePart.getSparePartName().getUnit());
//        } else {
//            map.put("sparePartName", "");
//            map.put("unit", "");
//        }
        map.put("unit", dailySparePart.getUnit());
        map.put("sparePartModel", dailySparePart.getSparePartModel());
        map.put("deviceProperties", dailySparePart.getDeviceProperties());
        map.put("depositLocation", dailySparePart.getDepositLocation());
        map.put("factory", dailySparePart.getFactory());
        map.put("availableModle", dailySparePart.getAvailableModle());
        map.put("singleNumber", dailySparePart.getSingleNumber());
        map.put("platesName", dailySparePart.getPlatesName());
        

        if (dailySparePart.getWorkArea() != null) {
            map.put(dailySparePart.getWorkArea().getId(), dailySparePart.getAmount());
        }
        map.put("sum", dailySparePart.getAmount() != null ? dailySparePart.getAmount() : 0);//默认为第一条记录的数量，//后续添加时重新计算并设置
        return map;
    }

    @Override
    public List<Map<String, Object>> getShopSpareStatistics() {
        String hql = " SELECT s.speciality, sp.name, s.sparePartModel, sp.unit, ws.id, sum(s.amount),s.factory,s.availableModle,s.singleNumber,s.platesName,s.depositLocation,s.deviceProperties  "
                + " FROM DailySparePart s "
                + " left join s.sparePartName sp "
                + " left join s.workShop ws "
//				+ " left join s.spareType " 
                + " WHERE s.exist =:exist "
                + " GROUP BY s.speciality, sp.name, s.deviceProperties,s.sparePartModel,s.depositLocation,s.factory,s.availableModle,s.singleNumber,s.platesName,sp.unit, ws.id "
                + " ORDER BY s.speciality ";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("exist", DataExistStatus.EXIST);
        List<Object[]> objArrList = query.list();

        //遍历结果集，合并相同备品记录（具体到车间）
        List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
        for (int i = 0; i < objArrList.size(); i++) {
            Object[] objArr = objArrList.get(i);
            if (i == 0) {//第一条记录无需比较
                Map<String, Object> map = convertObjArrToMap(objArr);
                rows.add(map);
                continue;
            }
            combineData(rows, objArr);
        }
        return rows;
    }

    /**
     * combineData 合并重复记录（具体到车间）
     * @param rows
     * @param objArr
     */
    private void combineData(List<Map<String, Object>> rows, Object[] objArr) {
        Integer speciality = Integer.parseInt(objArr[0].toString());//设备类别
        String sparePartName = objArr[1].toString();//设备名称
        String sparePartModel = objArr[2].toString();//规格型号
        String workShopId = objArr[4].toString();//车间id
        Double amount = Double.parseDouble(objArr[5].toString());//数量
        String deviceProperties = "";
        if (objArr[8] != null) {
            deviceProperties = objArr[8].toString();
        }
        int length = rows.size();
        for (int j = 0; j < length; j++) {
            Map<String, Object> map = rows.get(j);
            String specialityMap = map.get("speciality").toString();
            String sparePartNameMap = map.get("sparePartName").toString();
            String sparePartModelMap = map.get("sparePartModel").toString();
            //若备品相同（类别、名称、型号均相同），则统计成一条数据
            if (speciality.toString().equals(specialityMap)
                    && sparePartName.equals(sparePartNameMap)
                    && sparePartModel.equals(sparePartModelMap)
                    && map.get("deviceProperties").equals(deviceProperties)) {
                //由于备品相同（只是在不同地点），将该数据“地点及数量信息”添加到rows集合对应的位置
                map.put(workShopId, amount);
                //计算总数
                Double sum = (Double) map.get("sum") + amount;
                map.put("sum", sum);
                break;
            }
            //若全部计较完成均不同，则单独成一条数据，并添加至rows集合中
            if (j == length - 1) {
                Map<String, Object> mapNew = convertObjArrToMap(objArr);
                rows.add(mapNew);
            }
        }
    }


    /**
     * convertObjArrToMap 将返回的结果集封装至List<Map>集合(用于备品统计)
     * @param
     * @return
     */
    private Map<String, Object> convertObjArrToMap(Object[] objArr) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("speciality", Integer.parseInt(objArr[0].toString()));//设备类别
        map.put("sparePartName", objArr[1].toString());//设备名称
        map.put("sparePartModel", objArr[2].toString());//规格型号
        map.put("unit", Integer.parseInt(objArr[3].toString()));//单位
        map.put(objArr[4].toString(), Double.parseDouble(objArr[5].toString()));//key为车间id，value为数量
        map.put("sum", Double.parseDouble(objArr[5].toString()));//数量
        if (objArr[6] != null) {
            map.put("factory", objArr[6].toString());
        } else {
            map.put("factory", "");
        }
        if (objArr[7] != null) {
            map.put("depositLocation", objArr[7].toString());
        } else {
            map.put("depositLocation", "");
        }

        if (objArr[8] != null) {
            map.put("deviceProperties", objArr[8].toString());
        } else {
            map.put("deviceProperties", "");
        }
        if (objArr[9] != null) {
            map.put("availableModle", objArr[8].toString());
        } else {
            map.put("availableModle", "");
        }
        if (objArr[10] != null) {
            map.put("singleNumber", objArr[8].toString());
        } else {
            map.put("singleNumber", "");
        }
        return map;
    }

    @Override
    public List<DailySpareAndNormDTO> getSpareAndNormByDto(DailySpareAndNormDTO dto, int start, int limit) {
        String hql = " SELECT s.speciality, sp.id, sp.name, ws.name, sum(s.amount),s.factory,s.availableModle,s.singleNumber,s.depositLocation,s.deviceProperties  "
                + " FROM DailySparePart s "
                + " left join s.sparePartName sp "
                + " left join s.workShop ws "
//				+ " left join s.spareType " 
                + " WHERE 1=1 ";
        Map<String, Object> hqlMap = new HashMap<String, Object>();
        Integer speciality = dto.getSpeciality();
        if (speciality != null) {
            hql += " AND s.speciality =:speciality ";
            hqlMap.put("speciality", speciality);
        }
        if (dto.getDeviceProperties() != null) {
            hql += " AND s.deviceProperties =:deviceProperties ";
            hqlMap.put("deviceProperties", dto.getDeviceProperties());
        }
        String deviceNameId = dto.getDeviceNameId();
        if (StringUtils.isNotBlank(deviceNameId)) {
            hql += " AND sp.id =:deviceNameId ";
            hqlMap.put("deviceNameId", deviceNameId);
        }
        String workShopId = dto.getWorkShopId();
        if (StringUtils.isNotBlank(workShopId)) {
            String[] workShopIds = workShopId.split(",");
            String workShopParam = "(";
            for (int i = 0; i < workShopIds.length; i++) {
                if (i == (workShopIds.length - 1)) {
                    workShopParam += "'" + workShopIds[i] + "') ";
                } else {
                    workShopParam += "'" + workShopIds[i] + "',";
                }
            }
            hql += " AND ws.id in " + workShopParam;
//			hql+=" AND ws.id =:workShopId ";
//			hqlMap.put("workShopId", workShopId);
        }
        hql += " AND s.exist =:exist ";
        hqlMap.put("exist", DataExistStatus.EXIST);
        hql += " GROUP BY s.speciality, sp.id, sp.name, ws.name ,s.factory,s.availableModle,s.singleNumber,s.depositLocation,s.deviceProperties";
        hql += " ORDER BY s.speciality ";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        for (Entry<String, Object> entry : hqlMap.entrySet()) {
            query.setParameter(entry.getKey(), entry.getValue());
        }
        List<Object[]> objArrList = query.list();
        //遍历集合，将集合元素转化为SpareAndNormDTO
        List<DailySpareAndNormDTO> snDtoList = convertObjectToDto(objArrList);
        //查询所有备品指标
        List<DailySpareNorm> normList = dailySpareNormService.getAllSpareNorms();
        //将SpareNorm的设备名称id和指标值赋值给map
        Map<String, Double> map = encapsulationSpareNorm(normList);
        //根据状态遍历dto,过滤掉不满足条件条件的数据
        String status = dto.getStatus();
        List<DailySpareAndNormDTO> result = getSpareAndNormDTOListByStatus(status, snDtoList, map);
        List<DailySpareAndNormDTO> list = new ArrayList<DailySpareAndNormDTO>();
        //		query.setFirstResult(start);
//		query.setMaxResults(limit);
        if (result.size() - start > limit) {
            list = result.subList(start, start + limit);
        } else {
            list = result.subList(start, result.size());
        }
        return list;
    }

    /**
     * convertObjectToDto 将查询的部分结果集封装到Dto
     * @param objArrList
     * @return
     */
    private List<DailySpareAndNormDTO> convertObjectToDto(List<Object[]> objArrList) {
        List<DailySpareAndNormDTO> snDtoList = new ArrayList<DailySpareAndNormDTO>();
        for (Object[] objArr : objArrList) {
            DailySpareAndNormDTO snDto = new DailySpareAndNormDTO();
            snDto.setSpeciality(Integer.parseInt(objArr[0].toString()));//备品类别
            snDto.setDeviceNameId(objArr[1].toString());//备品名称id
            snDto.setDeviceName(objArr[2].toString());//备品名称
            snDto.setWorkShop(objArr[3].toString());//所属车间
            snDto.setAmount(Double.parseDouble(objArr[4].toString()));//现有数量
            if (objArr[5] != null) {
                snDto.setFactory(objArr[5].toString());
            } else {
                snDto.setFactory("");
            }

            if (objArr[6] != null) {
                snDto.setDepositLocation(objArr[6].toString());
            } else {
                snDto.setDepositLocation("");
            }

            if (objArr[7] != null) {
                snDto.setDeviceProperties(objArr[7].toString());
            } else {
                snDto.setDeviceProperties("");
            }
            if (objArr[8] != null) {
                snDto.setAvailableModle(objArr[8].toString());
            } else {
                snDto.setAvailableModle("");
            }
            if (objArr[9] != null) {
                snDto.setSingleNumber(objArr[9].toString());
            } else {
                snDto.setSingleNumber("");
            }
            snDtoList.add(snDto);
//			System.out.println(snDto);
        }
        return snDtoList;
    }

    /**
     * encapsulationSpareNorm 将SpareNorm的设备名称id和指标值封装至map
     * @param normList
     * @return
     */
    private Map<String, Double> encapsulationSpareNorm(List<DailySpareNorm> normList) {
        Map<String, Double> map = new HashMap<String, Double>();
        for (DailySpareNorm sn : normList) {
            String key = sn.getDailyDeviceName().getId();
            Double value = sn.getNormValue();
            map.put(key, value);
        }
        return map;
    }

    /**
     * getSpareAndNormDTOListByStatus 根据状态遍历dto,过滤掉不满足条件及无指标状态的Dto
     * @param snDtoList 查询的Dto
     * @param map
     * @return
     */
    private List<DailySpareAndNormDTO> getSpareAndNormDTOListByStatus(
            String status, List<DailySpareAndNormDTO> snDtoList, Map<String, Double> map) {
        List<DailySpareAndNormDTO> result = new ArrayList<DailySpareAndNormDTO>();
        //当status不为空时，判断每条记录是否达标，并返回满足条件的记录
        if (StringUtils.isNotBlank(status)) {
            for (DailySpareAndNormDTO snDto : snDtoList) {
                Double normValue = map.get(snDto.getDeviceNameId());//通过“结果dto的设备名称id“获取对应的指标值
                if (normValue == null) {//若设备无指标，则指标为0
                    normValue = 0.0;
                }
                String istandard = DailySpareAndNormDTO.isStandard(snDto.getAmount(), normValue);
                if (status.equals(istandard)) {//仅保留满足status条件的
                    snDto.setStatus(status);
                    if (status.equals(DailySpareAndNormDTO.NOT_STANDARD)) {
                        snDto.setNot_standard(true);
                    }
                    snDto.setNormValue(normValue);
                    result.add(snDto);//将满足条件的记录添加到最终结果集合中
                }
            }
            return result;
        }
        //若无status条件，仅判断每条记录是否达标
        for (DailySpareAndNormDTO snDto : snDtoList) {
            Double normValue = map.get(snDto.getDeviceNameId());//通过“结果dto的设备名称id“获取对应的指标值
            if (normValue == null) {//若设备无指标，则指标为0
                normValue = 0.0;
            }
            Double val = snDto.getAmount() - normValue;
            if (val >= 0.0) {//达标
                snDto.setStatus(DailySpareAndNormDTO.STANDARD);
                snDto.setNormValue(normValue);
            } else {
                snDto.setStatus(DailySpareAndNormDTO.NOT_STANDARD);//不达标
                snDto.setNormValue(normValue);
                snDto.setNot_standard(true);
            }
            result.add(snDto);
        }
        return result;
    }

    @Override
    public Long getSpareAndNormByDtoCount(DailySpareAndNormDTO dto) {
        return (long) getSpareAndNormByDto(dto, 0, Integer.MAX_VALUE).size();
    }

    
    @Override
    public Workbook importExcel(MultipartFile file, User user) throws Exception {
    	//用来保存日常备品的数据
        List<DailySparePart> dailySpareParts = new ArrayList<DailySparePart>();
        //用来保存非空验证的数据
        List<List<String>> testNullDatas = new ArrayList<List<String>>();
        //用来保存设备数据验证后的数据
        List<Map<String, String>> equipmentDatas = new ArrayList<Map<String, String>>();
        //用来保存工区车间数据验证后的数据
        List<Map<String, String>> WorkshopAreaDatas = new ArrayList<Map<String, String>>();
        //用来保存设备单位验证后的数据
        List<String> deciceUnitDatas = new ArrayList<>();
        //用来保存设备属性验证后的数据
        List<String> checkDevicePropertiesDatas = new ArrayList<>();
        //用来保存导入的文件中的序号数据
        List<String> numbers = new ArrayList<String>();
        
        InputStream inputStream;
        try {
            inputStream = file.getInputStream();
            Workbook workbook = WorkbookFactory.create(inputStream);
            Sheet sheet = workbook.getSheetAt(0);
            List<Organization> workShops = organizationService.getAllWorkshop();
            
            
            int rightOrFail = 1;//1-数据没有问题 0-数据有问题
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                Row row = sheet.getRow(i);
                String number = "";
                //如果序号列的数据不为空
                if (row.getCell(0) != null) {
                    number = ((int) row.getCell(0).getNumericCellValue()) + "";
                }
                numbers.add(number);
                //非空验证
                List<String> testNullData = testNotNullData(row);//完成
                testNullDatas.add(testNullData);
                //设备数据和车间工区数据验证
                List<Map<String, String>> analysisReault = analysisRowData(row, workShops);//完成
                //设备验证后的数据
                Map<String, String> equipmentData = analysisReault.get(0);
                equipmentDatas.add(equipmentData);
                //工区车间验证后的数据
                Map<String, String> WorkshopAreaData = analysisReault.get(1);
                WorkshopAreaDatas.add(WorkshopAreaData);
                //设备单位数据验证
//                String deciceUnitData = row.getCell(4);
//                deciceUnitDatas.add(deciceUnitData);
                //设备属性数据验证
//                Integer checkDevicePropertiesData = checkDeviceProperties(row.getCell(12));
//                checkDevicePropertiesDatas.add(checkDevicePropertiesData);
                
                if ( //设备数据没有问题
                        equipmentData.get("testResult").equals("11")
                                //车间工区数据没有问题
                                && WorkshopAreaData.get("testResult").equals("11")
                                //不该为空的数据不为空
                                && testNullData.size() == 1
                                //单位数据没有问题
//                                && deciceUnitData != 0
                                //设备属性验证没有问题
//                                && checkDevicePropertiesData != 0
                                //并且上一行的数据验证也没有问题
                                && rightOrFail == 1) {

                    //验证的所有结果没有问题
                    rightOrFail = 1;

                } else {
                    //验证的结果有问题
                    rightOrFail = 0;
                }
                if (rightOrFail == 0) {
                    continue;
                }
                //验证的所有结果没有问题
                if (rightOrFail == 1) {
                    DailySparePart saprePart = new DailySparePart();
                    //设置设备所属系统
                    saprePart.setDeviceProperties(row.getCell(1).getStringCellValue());
                    //设置设备类别
                    saprePart.setSpeciality(row.getCell(2).getStringCellValue());
                    //quyy加 2017-8-22 添加了导入的字段
                    //设置板件名称
                    saprePart.setPlatesName(row.getCell(3).getStringCellValue());
                    //设置板件设备可用型号
                    saprePart.setAvailableModle(row.getCell(4).getStringCellValue());
                    //设置设备或单板编号
                    saprePart.setSingleNumber(row.getCell(5).getStringCellValue());
                    //设置规格型号
                    saprePart.setSparePartModel(row.getCell(6).toString());
                    //设置单位
                    saprePart.setUnit(row.getCell(7).getStringCellValue());
                    //设置入库原因
                    saprePart.setBuyReason(row.getCell(9).getStringCellValue());
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    //设置入库时间
                    saprePart.setInDate(dateFormat.parse(row.getCell(10).getStringCellValue()));
                    //设置软件版本
                    saprePart.setSoftwareEdition(row.getCell(11).toString());
                 
                    //--------------添加结束---------------//
                    Organization workShop = new Organization();
                    //设置车间id
                    workShop.setId(WorkshopAreaData.get("workShopId"));
                    //设置车间
                    saprePart.setWorkShop(workShop);
                    //设置设备属性
                    //工区数据不为空
                    if (StringUtils.isNotBlank(row.getCell(12).getStringCellValue())) {
                        Organization workArea = new Organization();
                        //设置工区id
                        workArea.setId(WorkshopAreaData.get("workAreaId"));
                        //设置工区
                        saprePart.setWorkArea(workArea);
                    }
                    //设置数量
                    if (row.getCell(8).getCellType() == Cell.CELL_TYPE_STRING) {
                        saprePart.setAmount(Double.valueOf(row.getCell(8).getStringCellValue()));
                    } else if (row.getCell(8).getCellType() == Cell.CELL_TYPE_NUMERIC) {
                        saprePart.setAmount(row.getCell(8).getNumericCellValue());
                    }
                    //厂家数据不为空
                    if (StringUtils.isNotBlank(row.getCell(14).getStringCellValue())) {
                        //设置厂家
                        saprePart.setFactory(row.getCell(14).getStringCellValue());
                    }
                    //存放地点数据不为空
                    if (StringUtils.isNotBlank(row.getCell(15).getStringCellValue())) {
                        //设置存放地点
                        saprePart.setDepositLocation(row.getCell(15).getStringCellValue());
                    }
                    //备注数据不为空
                    if (StringUtils.isNotBlank(row.getCell(16).getStringCellValue())) {
                        //设置备注
                        saprePart.setComment(row.getCell(16).getStringCellValue());
                    }
                    saprePart.setCheckStatus(DailySparePart.NO_CHECK);

//					String uuid = UUID.randomUUID().toString().replace("-", "");
//					saprePart.setId(uuid);
                    dailySpareParts.add(saprePart);
                }
            }
            if (rightOrFail == 1) {
                for (DailySparePart dailySparePart : dailySpareParts) {
                    //创建一条使用记录
                    /**
                     * 修改人：luoyan 2017-8-7 判断是否重复，如果重复，在原数据上加数量
                     */
                    if (isRepeat(dailySparePart)) {
                        inSparePart(dailySparePart, user);
                        continue;
                    }
                    /**
                     * 修改：quyy  2017-8-22 添加备品入库记录
                     */
                    DailySpareUseStock useStock = new DailySpareUseStock();
                    useStock.setAmount(dailySparePart.getAmount());
                    useStock.setDate(new Date());
                    useStock.setReason("导入");
                    useStock.setUser(user);
                    useStock.setDailySparePart(dailySparePart);//将备品添加到使用记录中
                    useStock.setState(DailySpareUseStock.RUKU);//入库状态
                    //保存
                    addSparePart(dailySparePart, useStock);
                }
                return null;
            } else {
                return createFailExcel(file.getOriginalFilename(), testNullDatas, equipmentDatas, WorkshopAreaDatas, deciceUnitDatas, checkDevicePropertiesDatas, numbers);
            }
        } catch (Exception e) {
        	return createFailExcel(file.getOriginalFilename(), testNullDatas, equipmentDatas, WorkshopAreaDatas, deciceUnitDatas, checkDevicePropertiesDatas, numbers);
        }
    }
//    @Override
//    public Workbook importExcel(MultipartFile file, User user) throws Exception {
//  
//        try {
//        	ImportDailySpare importDailySpare= new 	ImportDailySpare ();
//        	 List<DailySparePart> dailySpareParts = importDailySpare.getExcelInfo(file);
//                for (DailySparePart dailySparePart : dailySpareParts) {
//					List<Organization> workShops = organizationService.getAllWorkshop();
//					 String workShopId ="";
//					 for (Organization organization : workShops) {
//						 if (organization.getName().equals(dailySparePart.getWorkShop().getName())) {
//				              workShopId = organization.getId();
//				            }
//					 }
//						   Organization workShop = new Organization();
//		                    //设置车间id
//		                    workShop.setId(workShopId);
//		                    //设置车间
//		                    dailySparePart.setWorkShop(workShop);
//		             List<Organization> workAreas = organizationService.getChildrenByPid(dailySparePart.getWorkShop().getId());
//					 String workAreaId ="";
//					 for (Organization organization : workAreas) {
//						 if (organization.getName().equals(dailySparePart.getWorkArea().getName())) {
//							 workAreaId = organization.getId();
//				            }
//					 }
//						   Organization workArea = new Organization();
//		                    //设置车间id
//						   workArea.setId(workAreaId);
//		                    //设置车间
//		                    dailySparePart.setWorkArea(workArea);
//		                    dailySparePart.setCreateDate(new Date());//添加日期为当前时间
//                    //创建一条使用记录
//                    /**
//                     * 修改人：luoyan 2017-8-7 判断是否重复，如果重复，在原数据上加数量
//                     */
//                    if (isRepeat(dailySparePart)) {
//                        inSparePart(dailySparePart, user);
//                        continue;
//                    }
//                    /**
//                     * 修改：quyy  2017-8-22 添加备品入库记录
//                     */
//                    DailySpareUseStock useStock = new DailySpareUseStock();
//                    useStock.setAmount(dailySparePart.getAmount());
//                    useStock.setDate(new Date());
//                    useStock.setReason("导入");
//                    useStock.setUser(user);
//                    useStock.setDailySparePart(dailySparePart);//将备品添加到使用记录中
//                    useStock.setState(DailySpareUseStock.RUKU);//入库状态
//                    //保存
//                    addSparePart(dailySparePart, useStock);
//                }
//                return null;
//        } catch (Exception e) {
//        	return createFailExcel(file.getOriginalFilename());
//        }
//    }

    /**
     * 判断数据是否重复
     * isRepeat
     * @param saprePart
     * @return
     * @author luoyan
     */
    private boolean isRepeat(DailySparePart saprePart) {
        DailySparePartDTO dto = new DailySparePartDTO();
        dto.setSpeciality(saprePart.getSpeciality());
//        dto.setDeviceNameId(saprePart.getSparePartName().getId());
        dto.setSparePartModel(saprePart.getSparePartModel());
        dto.setWorkShopId(saprePart.getWorkShop().getId());
        dto.setWorkAreaId(saprePart.getWorkArea().getId());
        long result = getSparePartCount(dto);
        if (result != 0) { //如果重复，则只存在一条重复的数据才符合业务逻辑
            List<DailySparePartShowDTO> showDtoList = getSparePartShowDto(dto, 0, 10);
            for (DailySparePartShowDTO s : showDtoList) {
                saprePart.setId(s.getId());
            }
            return true; //重复
        }
        return false; //不重复
    }

    /**
     *
     * createFailExcel 这里添加描述信息
     * @param fileName
     * @param testNullDatas 非空验证的数据
     * @param equipmentDatas 设备数据验证后的数据
     * @param WorkshopAreaDatas 工区车间数据验证后的数据
     * @param deciceUnitDatas 设备单位验证后的数据
     * @param numbers 导入的文件中的序号数据
     * @return 错误文件路径
     * @author quyy
     */
    private Workbook createFailExcel(String fileName,
                                     List<List<String>> testNullDatas,
                                     List<Map<String, String>> equipmentDatas,
                                     List<Map<String, String>> WorkshopAreaDatas,
                                     List<String> deciceUnitDatas,//不使用了
                                     List<String> checkDevicePropertiesDatas,//不使用了
                                     List<String> numbers
    ) {
        //错误输入文件的模块文件路径
        String rootPath = GetRootPathUtil.getRootPath();
        String templateFilePath = rootPath + "/kunmingrinms/Template/spareParts/errorMsg_template.xls";
        Workbook workbookTemplate = null;
        try {
            //读取模板文件
            FileInputStream inputStream = new FileInputStream(templateFilePath);
            workbookTemplate = WorkbookFactory.create(inputStream);
            Sheet sheetTemplate = workbookTemplate.getSheetAt(0);
            int rowNumTemplate = 1;
            for (int i = 0; i < numbers.size(); i++) {
                rowNumTemplate = wirteFailExcel(i + 2, numbers.get(i), fileName, sheetTemplate,
//                      	testNullDatas.get(i), equipmentDatas.get(i), WorkshopAreaDatas.get(i), deciceUnitDatas.get(i), checkDevicePropertiesDatas.get(i), rowNumTemplate);
                testNullDatas.get(i), equipmentDatas.get(i), WorkshopAreaDatas.get(i), rowNumTemplate);
            }
            inputStream.close();
            return workbookTemplate;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return workbookTemplate;
    }

    /**
     *
     * wirteFailExcel 将错误信息写进excel中
     * @param rowNum 行数
     * @param number 序号
     * @param fileName 文件名称
     * @param testNullData 不为空的验证结果
     * @param equipmentData 设备数据的验证结果
     * @param WorkshopAreaData 工区车间数据的验证结果
     * @param deciceUnitData 设备单位的数据验证结果
     * @param rowNumTemplate 错误输入文件的当前行数
     * @return
     * @author quyy
     */
    private int wirteFailExcel(int rowNum,
                               String number,
                               String fileName,
                               Sheet sheet,
                               List<String> testNullData,
                               Map<String, String> equipmentData,
                               Map<String, String> WorkshopAreaData,
//                               String deciceUnitData,
//                               String checkDevicePropertiesData,
                               int rowNumTemplate
    ) {
        try {
            if (testNullData.size() != 1) {//非空验证的数据有问题
                for (int i = 1; i < testNullData.size(); i++) {
                    Row row = sheet.createRow(rowNumTemplate);
                    createCell(row, fileName, "sheet0", "没有填写数据，此项为必填项", number, rowNum, testNullData.get(i));
                    rowNumTemplate++;
                }
            }else {
				Row row = sheet.createRow(rowNumTemplate);
//				createCell(row, fileName, "sheet0", "购置时间格式不正确", number, rowNum, "G");
				createCell(row, fileName, "sheet0", "入库时间格式不正确", number, rowNum, "K");
            }
            if (!equipmentData.get("testResult").equals("11")) {//设备数据有问题
                Row row = sheet.createRow(rowNumTemplate);
                String errorContent = "";
                String cellNum =null;
                if (equipmentData.get("testResult").equals("21")) {
                    errorContent = "此设备所属系统不存在";
                    cellNum = "B";
                } else {
                    errorContent = "此设备所属系统下的设备类别不存在";
                    cellNum = "C";
                }
                createCell(row, fileName, "sheet0", errorContent, number, rowNum, cellNum);
                rowNumTemplate++;
            }
            if (!WorkshopAreaData.get("testResult").equals("11")) {//车间工区数据有问题
                Row row = sheet.createRow(rowNumTemplate);
                String errorContent = "";
                String cellNum = null;
                if (WorkshopAreaData.get("testResult").trim().equals("21")) {
                    errorContent = "此车间数据不存在";
                    cellNum = "M";
                } else {
                    errorContent = "此车间下的工区不存在";
                    cellNum = "N";
                }
                createCell(row, fileName, "sheet0", errorContent, number, rowNum, cellNum);
                rowNumTemplate++;
            }
//            if (deciceUnitData == null) {//设备单位数据有问题
//                Row row = sheet.createRow(rowNumTemplate);
//                createCell(row, fileName, "sheet0", "此单位数据不存在", number, rowNum, "E");
//                rowNumTemplate++;
//            }
//            if (checkDevicePropertiesData == null) {//设备单位数据有问题
//                Row row = sheet.createRow(rowNumTemplate);
//                createCell(row, fileName, "sheet0", "此设备属性数据不存在或者有问题", number, rowNum, "M");
//                rowNumTemplate++;
//            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowNumTemplate;
    }

    /**
     *
     * createCell 创建单元格
     * @param row
     * @param cellData1 第一列 文件名称
     * @param cellData2 第二列 所属sheet页
     * @param cellData3 第三列 错误描述
     * @param cellData4 第四列 序号
     * @param cellData5 第五列 行
     * @param cellData6 第六列 列
     * @return
     * @author quyy
     */
    private boolean createCell(Row row, String cellData1, String cellData2, String cellData3, String cellData4, int cellData5, String cellData6) {
        Cell cell1 = row.createCell(0);
        cell1.setCellValue(cellData1);//设置文件名称
        Cell cell2 = row.createCell(1);
        cell2.setCellValue(cellData2);//设置所属sheet页
        Cell cell3 = row.createCell(2);
        cell3.setCellValue(cellData3);//设置错误描述
        Cell cell4 = row.createCell(3);
        cell4.setCellValue(cellData4);//设置序号
        Cell cell5 = row.createCell(4);
        cell5.setCellValue(cellData5);//设置行
        Cell cell6 = row.createCell(5);
        cell6.setCellValue(cellData6);//设置列
        return true;
    }

    /**
     *
     * analysisRowData 分析每行数据
     * @param row
     * @return List<Map < String , String>>
     * @author quyy
     */
    private List<Map<String, String>> analysisRowData(Row row, List<Organization> workShops) {
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();
        //设备数据验证结果
        Map<String, String> equipmentResult = testEquipmentData(row.getCell(1), row.getCell(2));
        //车间工区数据验证结果
        Map<String, String> WorkshopAreaResult = testWorkshopArea(row.getCell(12), row.getCell(13), workShops);
        result.add(equipmentResult);
        result.add(WorkshopAreaResult);
        return result;
    }

    /**
     *
     * testEquipmentData 验证设备所属系统和设备类别
     * @param equipmentClass 设备所属系统
     * @param equipmentName 设备类别
     * @return Map<String , String> 11-两个数据都没有问题 21-此设备所属系统不存在 12-此设备所属系统下的设备类别不存在
     * @author quyy
     */
	private Map<String, String> testEquipmentData(Cell equipmentClass, Cell equipmentName) {
		Map<String, String> result = new HashMap<String, String>();// 存放返回结果
		if (equipmentClass.getStringCellValue().isEmpty()) {//空验证
			result.put("testResult", "21");// 存放验证结果 设备所属系统没有填写
			return result;
		}
		if (equipmentName.getStringCellValue().isEmpty()) {//空验证
			result.put("testResult", "12");// 存放验证结果 设备类别没有填写
			return result;
		}
		String deviceCategory = equipmentClass.getStringCellValue();
		if (StringUtils.isNotBlank(deviceCategory)) {
			List<String> system = checkSystemExist(deviceCategory);
			if(system.size()==0){
				result.put("testResult", "21");// 存放验证结果 设备所属系统有填写但与数据库中的不匹配
				return result;
			}
		}
		result.put("deviceCategory", deviceCategory);// 存放设备所属系统 设备所属系统为数据库中存在的
		List<String> devices = getTypeBySystem(deviceCategory);
		for (String dailyDeviceName : devices) {
			if (equipmentName.getStringCellValue().equals(dailyDeviceName)) {
				result.put("equipmentName", dailyDeviceName);// 存放设备类别 设备类别有填写且与数据库匹配
				result.put("testResult", "11");// 存放验证结果，两个数据验证出来都无误
				return result;
			}
		}
		result.put("testResult", "12");// 存放验证结果 设备类别有填写但与数据库中的不匹配
		return result;
	}

    /**
     * 根据设备类型获取设备编号
     * @param stringCellValue 设备类型名字
     * @return
     */
//    private Integer getDeviceCategory(String stringCellValue) {
//        Map<Integer,String> specialityMap = getSpecialityMap();
//        for (Entry entry: specialityMap.entrySet()) {
//            if(entry.getValue().equals(stringCellValue)){
//                return (Integer) entry.getKey();
//            }
//        }
//        return 0;
//    }

    /**
     *
     * testWorkshopArea 验证车间和工区
     * @param workShop 车间
     * @param workArea 工区
     * @return Map<Integer , String>  11-两个数据都没有问题 21-此车间数据不存在 12-此车间下的工区不存在
     * @author quyy
     */
    private Map<String, String> testWorkshopArea(Cell workShop, Cell workArea, List<Organization> workShops) {
        Map<String, String> result = new HashMap<String, String>();
        if (workShop.getStringCellValue().isEmpty()) {
            result.put("testResult", "21");//存放验证数据的结果 车间没有填写
            return result;
        }
        if (workArea.getStringCellValue().isEmpty()) {
            result.put("testResult", "12");//存放验证数据的结果 工区没有填写
            return result;
        }
        String workShopId = "";
        String workAreaId = "";
        for (Organization organization : workShops) {
            if (organization.getName().equals(workShop.getStringCellValue())) {
                workShopId = organization.getId();
                result.put("workShopId", workShopId);//存放车间的id
            }
        }
        if (workShopId.equals("")) {
            result.put("testResult", "21");//存放验证数据的结果 车间有填写但与数据库不匹配
            return result;
        }
        List<Organization> workAreas = organizationService.getChildrenByPid(workShopId);
        for (Organization organization : workAreas) {
            if (workArea.getStringCellValue().equals(organization.getName())) {
                workAreaId = organization.getId();
                result.put("workAreaId", workAreaId);//存放工区的id 工区有填写且匹配
                result.put("testResult", "11");//存放验证数据的结果，验证无差错
                return result;
            }else if(workArea.getStringCellValue().equals(workShop.getStringCellValue())){
            	result.put("workAreaId", workShopId);//工区存放车间的id 工区有填写且匹配（此时代表备件所属车间）
                result.put("testResult", "11");//存放验证数据的结果，验证无差错
                return result;
            }
        }
        result.put("testResult", "12");//存放验证数据的结果 工区有填写但不匹配
        return result;
    }

    /**
     *
     * testNotNullData 验证不为空的数据
     * @param row
     * @return 返回不该为空的数据的列数，验证没有错误返回0,list的size为1
     * @author quyy
     */
    private List<String> testNotNullData(Row row) {
        List<String> result = new ArrayList<String>();
        result.add("A");
//        if (row.getCell(1) == null || row.getCell(1).getStringCellValue().isEmpty()) {//设备所属系统列(B)数据不存在
//        	result.add("B");
//        }
//        if (row.getCell(2) == null || row.getCell(2).getStringCellValue().isEmpty()) {//设备类别列(C)数据不存在
//        	result.add("C");
//        }
        if (row.getCell(6) == null || row.getCell(6).getStringCellValue().isEmpty()) {//规格型号列(G)数据不存在或为空
            result.add("G");
        }
        if (row.getCell(8) == null) {//数据列数据不存在
            result.add("I");
        }
        if (row.getCell(8).getCellType() == Cell.CELL_TYPE_BLANK) {//数量列数据为空
        	 result.add("I");
        }
        if (row.getCell(8).getCellType() == Cell.CELL_TYPE_STRING) {
            if (row.getCell(8).getStringCellValue().isEmpty()) {//数量列数据为空
                result.add("I");
            }
        }
        if (row.getCell(9) == null || row.getCell(9).getStringCellValue().isEmpty()) {//入库原因列(J)数据不存在或为空
            result.add("J");
        }
        if (row.getCell(10) == null || row.getCell(10).getStringCellValue().isEmpty()) {//入库时间列(K)数据不存在或为空
        	result.add("K");
        }
//        if (row.getCell(12) == null || row.getCell(12).getStringCellValue().isEmpty()) {//所属车间列(M)数据不存在或为空
//        	result.add("M");
//        }
//        if (row.getCell(13) == null || row.getCell(13).getStringCellValue().isEmpty()) {//所属工区列(N)数据不存在或为空
//        	result.add("N");
//        }
        return result;
    }

    /**
     * todo 写死的虚高改
     * checkDeviceProperties 验证设备属性是否存在
     * @param deviceProperties
     * @return
     * @author quyy
     */
    private Integer checkDeviceProperties(Cell deviceProperties) {
        Integer result = 0;
        if (deviceProperties.getStringCellValue().isEmpty()) {
            return 0;
        }
        String UnitName = deviceProperties.getStringCellValue();
        if (UnitName.equals("通信线路系统")) {
            return 1;
        } else if (UnitName.equals("传输系统")) {
            return 1;
        } else if (UnitName.equals("接入网系统")) {
            return 1;
        } else if (UnitName.equals("同步系统")) {
            return 1;
        } else if (UnitName.equals("数据通信系统")) {
            return 1;
        } else if (UnitName.equals("调度通信系统")) {
            return 1;
        } else if (UnitName.equals("会议通信系统")) {
            return 1;
        } else if (UnitName.equals("广播与站场通信系统")) {
            return 1;
        } else if (UnitName.equals("报话系统")) {
            return 1;
        } else if (UnitName.equals("日常通信系统")) {
            return 1;
        } else if (UnitName.equals("综合视频监控系统")) {
            return 1;
        } else if (UnitName.equals("通信电源系统")) {
            return 1;
        } else if (UnitName.equals("动环系统")) {
            return 1;
        } else if (UnitName.equals("综合网管系统")) {
            return 1;
        } else if (UnitName.equals("无线列调系统")) {
            return 1;
        } else if (UnitName.equals("GSM-R系统")) {
            return 1;
        } else if (UnitName.equals("防灾系统")) {
            return 1;
        } else if (UnitName.equals("专线电路接入设备")) {
            return 1;
        } else if (UnitName.equals("机房设备-地线及防雷")) {
            return 1;
        } else if (UnitName.equals("机房设备-空调")) {
            return 1;
        } else if (UnitName.equals("机房设备-消防")) {
            return 1;
        } else if (UnitName.equals("机房设备-其他")) {
            return 1;
        } else if (UnitName.equals("仪器仪表")) {
            return 1;
        } else {
            result = 0;
        }
        return result;
    }

    /**
     * todo 写死的需要改
     * getDeviceUnitByName 根据单位名称获得其对应的数字编号
     * @param unitNameCell
     * @return
     * @author quyy
     */
    private Integer getDeviceUnitByName(Cell unitNameCell) {
        Integer result = 0;
        if (unitNameCell == null || StringUtils.isBlank(unitNameCell.getStringCellValue())) {
            return 1;
        }
        String UnitName = unitNameCell.getStringCellValue();
        if (UnitName.equals("他")) {
            result = 3110156;
        } else if (UnitName.equals("台")) {
            result = 10044;
        } else if (UnitName.equals("公里")) {
            result = 10045;
        } else if (UnitName.equals("套")) {
            result = 10046;
        } else if (UnitName.equals("块")) {
            result = 10047;
        } else if (UnitName.equals("个")) {
            result = 10048;
        } else if (UnitName.equals("条")) {
            result = 10049;
        } else if (UnitName.equals("他")) {
            result = 3110156;
        } else if (UnitName.equals("米")) {
            result = 310118;
        } else if (UnitName.equals("把")) {
            result = 310119;
        } else if (UnitName.equals("件")) {
            result = 310120;
        } else if (UnitName.equals("升")) {
            result = 310121;
        } else if (UnitName.equals("顶")) {
            result = 310122;
        } else if (UnitName.equals("根")) {
            result = 310123;
        } else if (UnitName.equals("KM")) {
            result = 310124;
        } else if (UnitName.equals("M")) {
            result = 310125;
        } else if (UnitName.equals("座")) {
            result = 310126;
        } else {
            result = 0;
        }
        return result;
    }

    //----------------------------全部导出Excel-----------------------------

    /**
     * 日常备品-导出至Excel
     * getSparePartExportDto
     * @param dto 查询条件封装
     * @return
     * @author luoyan
     */
    @Override
    public List<DailySparePartExportDTO> getSparePartExportDto(DailySparePartDTO dto) {
        List<DailySparePart> sptList = getAllSparePartsByDTO(dto);
        List<DailySparePartExportDTO> exportDtoList = new ArrayList<DailySparePartExportDTO>();
        DailySparePartExportDTO export;
        for (DailySparePart sp : sptList) {
            export = new DailySparePartExportDTO();
//            export.setSpeciality(emergencySpeciality(sp.getSpeciality()));
//            export.setSpeciality(sp.getSpeciality());
//            if (sp.getSparePartName() != null) {
//                export.setSparePartName(sp.getSparePartName().getName());
//            }
//            export.setSparePartModel(sp.getSparePartModel());
//            if (sp.getSparePartName() != null) {
//                export.setUnit(emergencyUnit(sp.getSparePartName().getUnit()));
//            }
//            export.setAmount(sp.getAmount());
//            export.setComment(sp.getComment());
            //设备所属系统
            if (sp.getDeviceProperties() != null) {
                export.setDeviceProperties(sp.getDeviceProperties());
            }
            //设备类别
            if (sp.getSpeciality() != null) {
            	export.setSpeciality(sp.getSpeciality());
            }
            //板件名称
            if (sp.getPlatesName() != null) {
            	export.setPlatesName(sp.getPlatesName());
            }
            //板件可用设备型号
        
            	export.setAvailableModle(sp.getAvailableModle());
         
            //设备或单板编号
            if (sp.getSingleNumber()!= null) {
            	export.setSingleNumber(sp.getSingleNumber());
            }
            //规格型号
            if (sp.getSparePartModel()!= null) {
            	export.setSparePartModel(sp.getSparePartModel());
            }
            //单位
         
                export.setUnit(sp.getUnit());
         
            //数量
            if (sp.getUnit() != null) {
                export.setAmount(sp.getAmount());
             }
            //入库原因
            if (sp.getBuyReason() != null) {
                export.setBuyReason(sp.getBuyReason());
            }
            //入库时间
            if (sp.getInDate() != null) {
                export.setInDate(sp.getInDate());
            }
            //软件版本
            if (sp.getSoftwareEdition() != null) {
                export.setSoftwareEdition(sp.getSoftwareEdition());
            }
            //所属车间
            if (sp.getWorkArea() != null) {
            	export.setWorkShop(sp.getWorkShop().getName());
            }
            //所属工区
            if (sp.getWorkArea() != null) {
               export.setWorkArea(sp.getWorkArea().getName());
            }
            //厂家
            if (sp.getFactory() != null) {
                export.setFactory(sp.getFactory());
            }
            //存放地点
            if (sp.getDepositLocation() != null) {
                export.setDepositLocation(sp.getDepositLocation());
            }
            //备注
                export.setComment(sp.getComment());
//            if (StringUtils.isNotBlank(sp.getCheckStatus())) {
//                export.setCheckStatus(checkStatusChinese(sp.getCheckStatus()));
//            }
//            if (sp.getCheckDate() != null) {
//                export.setCheckDate(sp.getCheckDate());
//            }
//            if (sp.getCheckUser() != null) {
//                export.setCheckUserName(sp.getCheckUser().getName());
//            }
            exportDtoList.add(export);
        }
        return exportDtoList;
    }

    /**
     * 审核状态转为中文
     * checkStatusChinese
     * @param status
     * @return
     * @author luoyan
     * quyy改  上面switch写法  不适用jdk1.6
     */
    private String checkStatusChinese(String status) {
        if (status.equals(DailySparePart.NO_CHECK)) {
            return "待审核";
        }
        if (status.equals(DailySparePart.CHECK_NOT_PASS)) {
            return "审核不通过";
        }
        if (status.equals(DailySparePart.CHECK_PASS)) {
            return "审核通过";
        }
        return "";
    }

    /**
     * todo 日常设备单位转为中文
     * emergencyUnit
     * @param unit
     * @return
     * @author luoyan
     */
    private String emergencyUnit(Integer unit) {
        switch (unit) {
            case 3110156:
                return "他";
            case 10044:
                return "台";
            case 10045:
                return "公里";
            case 10046:
                return "套";
            case 10047:
                return "块";
            case 10048:
                return "个";
            case 10049:
                return "条";
            case 310118:
                return "米";
            case 310119:
                return "把";
            case 310120:
                return "件";
            case 310121:
                return "升";
            case 310122:
                return "顶";
            case 310123:
                return "根";
            case 310124:
                return "KM";
            case 310125:
                return "M";
            case 310126:
                return "座";
        }
        return "";
    }

    /**
     * todo 日常设备类别转为中文
     * emergencySpeciality
     * @param speciality
     * @return
     * @author luoyan
     */
    public String emergencySpeciality(Integer speciality) {
        Map<Integer,String> specialityMap = getSpecialityMap();
        return specialityMap.get(speciality)!=null ? specialityMap.get(speciality) : "";
    }

    /**
     * 导出至Excel（用于高铁、普铁无线、普铁有线统计）
     * getExpSpareAndNorm
     * @param dto
     * @return
     * @author luoyan
     */
    @Override
    public List<DailySpareAndNormExportDTO> getExpSpareAndNorm(DailySpareAndNormDTO dto) {
        List<DailySpareAndNormDTO> satList = getAllSpareAndNormByDto(dto);
        List<DailySpareAndNormExportDTO> exportDtoList = new ArrayList<DailySpareAndNormExportDTO>();
        DailySpareAndNormExportDTO satDTO;
        for (DailySpareAndNormDTO sa : satList) {
            satDTO = new DailySpareAndNormExportDTO();
            satDTO.setSpeciality(emergencySpeciality(sa.getSpeciality()));
            if (sa.getDeviceName() != null) {
                satDTO.setDeviceName(sa.getDeviceName());
            }
            if (sa.getWorkShop() != null) {
                satDTO.setWorkShop(sa.getWorkShop());
            }
            satDTO.setDepositLocation(sa.getDepositLocation());
            satDTO.setDeviceProperties(sa.getDeviceProperties());
            satDTO.setFactory(sa.getFactory());
            satDTO.setAmount(sa.getAmount());
            satDTO.setNormValue(sa.getNormValue());
            satDTO.setStatus(emergencyStatus(sa.getStatus()));
            exportDtoList.add(satDTO);
        }
        return exportDtoList;
    }

    /**
     * 日常设备状态转为中文（1--达标 2--不达标）
     * emergencyStatus
     * @param status
     * @return
     * @author luoyan
     */
    private String emergencyStatus(String status) {
        if (status.equals(DailySpareAndNormDTO.STANDARD)) {
            return "达标";
        } else if (status.equals(DailySpareAndNormDTO.NOT_STANDARD)) {
            return "不达标";
        } else {
            return "";
        }

    }

    /**
     * 查询全部数据（不分页）
     * （用于高铁、普铁无线、普铁有线统计）
     * getAllSpareAndNormByDto
     * @param dto
     * @return
     * @author luoyan
     */
    private List<DailySpareAndNormDTO> getAllSpareAndNormByDto(DailySpareAndNormDTO dto) {
        String hql = " SELECT s.speciality, sp.id, sp.name, ws.name, sum(s.amount),s.factory,s.depositLocation,s.deviceProperties  "
                + " FROM DailySparePart s "
                + " left join s.sparePartName sp "
                + " left join s.workShop ws "
//				+ " left join s.spareType " 
                + " WHERE 1=1 ";
        Map<String, Object> hqlMap = new HashMap<String, Object>();
        Integer speciality = dto.getSpeciality();
        if (speciality != null) {
            hql += " AND s.speciality =:speciality ";
            hqlMap.put("speciality", speciality);
        }
        String deviceNameId = dto.getDeviceNameId();
        if (StringUtils.isNotBlank(deviceNameId)) {
            hql += " AND sp.id =:deviceNameId ";
            hqlMap.put("deviceNameId", deviceNameId);
        }
        if (StringUtils.isNotBlank(dto.getDeviceProperties())) {
            hql += " AND s.deviceProperties =:deviceProperties ";
            hqlMap.put("deviceProperties", dto.getDeviceProperties());
        }
        String workShopId = dto.getWorkShopId();
        if (StringUtils.isNotBlank(workShopId)) {
            String[] workShopIds = workShopId.split(",");
            String workShopParam = "(";
            for (int i = 0; i < workShopIds.length; i++) {
                if (i == (workShopIds.length - 1)) {
                    workShopParam += "'" + workShopIds[i] + "') ";
                } else {
                    workShopParam += "'" + workShopIds[i] + "',";
                }
            }
            hql += " AND ws.id in " + workShopParam;
//			hql+=" AND ws.id =:workShopId ";
//			hqlMap.put("workShopId", workShopId);
        }
        hql += " AND s.exist =:exist ";
        hqlMap.put("exist", DataExistStatus.EXIST);
        hql += " GROUP BY s.speciality,s.factory,s.depositLocation,s.deviceProperties,sp.id, sp.name, ws.name  ";
        hql += " ORDER BY s.speciality ";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        for (Entry<String, Object> entry : hqlMap.entrySet()) {
            query.setParameter(entry.getKey(), entry.getValue());
        }
        List<Object[]> objArrList = query.list();
        //遍历集合，将集合元素转化为SpareAndNormDTO
        List<DailySpareAndNormDTO> snDtoList = convertObjectToDto(objArrList);
        //查询所有备品指标
        List<DailySpareNorm> normList = dailySpareNormService.getAllSpareNorms();
        //将SpareNorm的设备名称id和指标值赋值给map
        Map<String, Double> map = encapsulationSpareNorm(normList);
        //根据状态遍历dto,过滤掉不满足条件条件的数据
        String status = dto.getStatus();
        List<DailySpareAndNormDTO> result = getSpareAndNormDTOListByStatus(status, snDtoList, map);
        return result;
    }
    //----------------------------导出结束--------------------------------

    @Override
    public void auditSparePass(String ids, User user) {
        List<DailySparePart> spList = getSparePartByIds(ids.split(","));
        Date date = new Date();
        for (DailySparePart sp : spList) {
            sp.setCheckStatus(DailySparePart.CHECK_PASS);
            sp.setCheckUser(user);
            sp.setCheckDate(date);
            sessionFactory.getCurrentSession().saveOrUpdate(sp);
        }

    }

    @Override
    public void auditSpareNoPass(String ids, User user) {
        List<DailySparePart> spList = getSparePartByIds(ids.split(","));
        Date date = new Date();
        for (DailySparePart sp : spList) {
            sp.setCheckStatus(DailySparePart.CHECK_NOT_PASS);
            sp.setCheckUser(user);
            sp.setCheckDate(date);
            sessionFactory.getCurrentSession().saveOrUpdate(sp);
        }
    }

    /**
     * 设备类型和设备型号对应map
     * @return
     */
    private Map<Integer,String> getSpecialityMap(){
        Map<Integer,String> specialityMap = new HashMap<>();
//        specialityMap.put(117,"应急中心设备");
//        specialityMap.put(116,"高速应急设备");
//        specialityMap.put(115,"普速应急设备");
        specialityMap.put(10003,"视屏监控设备");
        specialityMap.put(10004,"传输及接入网设备");
        specialityMap.put(10005,"通信线路设备");
        specialityMap.put(10006,"会议设备");
        specialityMap.put(10007,"通信电源设备");
        specialityMap.put(10008,"数调设备");
        specialityMap.put(20001,"通信线路及附属设备");
        specialityMap.put(20002,"传输网设备");
        specialityMap.put(20003,"接入网设备");
        specialityMap.put(20004,"同步设备");
        specialityMap.put(20005,"数据网设备");
        specialityMap.put(20006,"调度通信设备");
        specialityMap.put(20007,"会议通信设备");
        specialityMap.put(20008,"广播与站场通信设备");
        specialityMap.put(20009,"报话设备");
        specialityMap.put(200010,"应急通信设备");
        specialityMap.put(200011,"综合视频监控设备");
        specialityMap.put(200012,"通信电源及机房环境监控设备");
        specialityMap.put(200013,"专线电路接入设备");
        specialityMap.put(200014,"综合网管设备");
        specialityMap.put(200015,"机房设备");
        specialityMap.put(200016,"无线列调设备");
        specialityMap.put(200017,"GSM-R设备");
        return specialityMap;
    }

    private List<String> checkSystemExist(String systemName) {
    	String sql ="select t.system_ from system_and_devicetype t where t.system_ = :systemName";
    	Map<String,Object> paramMap = new HashMap<String,Object>();
    	paramMap.put("systemName",systemName);
    	List<String> list=template.queryForList(sql,paramMap, String.class);
    	return list;
    }
	@Override
	public List<String> getTypeBySystem(String systemName) {
		String sql ="select t.device_type_ from system_and_devicetype t where t.system_ = :systemName";
		Map<String,Object> paramMap = new HashMap<String,Object>();
        paramMap.put("systemName",systemName);
		List<String> list=template.queryForList(sql,paramMap, String.class);
		return list;
	}
	@Override
	public List<String> getSystemName() {
		String sql ="select t.system_ from system_and_devicetype t ";
		Map<String,Object> paramMap = new HashMap<String,Object>();
		List<String> list=template.queryForList(sql,paramMap, String.class);
		List<String> result = removeDuplicate(list);
		return result;
	}
	
	private List<String> removeDuplicate(List<String> list){  
		List<String> result = new ArrayList<String>();  
        for(int i=0;i<list.size();i++){  
            if(!result.contains(list.get(i))){  
            	result.add(list.get(i));  
            }  
        }  
        return result;  
    } 

}
