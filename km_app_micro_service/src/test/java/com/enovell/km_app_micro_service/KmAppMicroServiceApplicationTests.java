package com.enovell.km_app_micro_service;

import javax.xml.namespace.QName;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.apache.cxf.transport.http.HTTPConduit;
import org.apache.cxf.transports.http.configuration.HTTPClientPolicy;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class KmAppMicroServiceApplicationTests {

	@Test
	public void contextLoads() {
		System.out.println("一个全新的微服务创建好了");
	}
	@Test
	public void test() {
		// 创建动态客户端
		JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
		Client client = dcf.createClient("http://localhost:7003/services/kmDataInterfaceService?wsdl");
		
		HTTPConduit conduit = (HTTPConduit) client.getConduit();
		HTTPClientPolicy httpClientPolicy = new HTTPClientPolicy();
		httpClientPolicy.setConnectionTimeout(2000);  //连接超时
		httpClientPolicy.setAllowChunking(false);    //取消块编码
		httpClientPolicy.setReceiveTimeout(120000);     //响应超时
		conduit.setClient(httpClientPolicy);
		
		// 需要密码的情况需要加上用户名和密码
		// client.getOutInterceptors().add(new ClientLoginInterceptor(USER_NAME,
		// PASS_WORD));
		Object[] objects = new Object[2];
		try {
			// invoke("方法名",参数1,参数2,参数3....);
			objects[0] = client.invoke("getKmRecordData", "A");
			System.out.println("返回数据:" + objects[0]);
			objects[1] = client.invoke("getKmInformationData", "B");
			System.out.println("返回数据:" + objects[1]);
		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test2() {
		 try {   
             String endpoint = "http://192.168.0.82:7003/services/kmDataInterfaceService?wsdl";
             Service service = new Service();
             Call call = (Call) service.createCall();
             call.setTargetEndpointAddress(endpoint);
             call.setOperationName(new QName("http://service.km_big_data_interface.enovell.com/", "getKmRecordData"));//WSDL里面描述的接口名称   
             call.addParameter("LastTime",org.apache.axis.encoding.XMLType.XSD_DATE,javax.xml.rpc.ParameterMode.IN);//接口的参数   
             call.setReturnType(org.apache.axis.encoding.XMLType.XSD_STRING);//设置返回类型     
             String temp = "2019-03-15 00:00:00";   
             String result = (String)call.invoke(new Object[]{temp});
             //给方法传递参数，并且调用方法   
             System.out.println("result is "+result);   
	      
		 }   
		 catch (Exception e) {   
			 System.err.println(e.toString());   
		 }   
	}

}
