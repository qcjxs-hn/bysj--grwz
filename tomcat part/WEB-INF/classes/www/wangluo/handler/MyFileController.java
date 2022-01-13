package www.wangluo.handler;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.apache.catalina.connector.Response;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * 实现文件上传
 *
 *
 */
@Controller
public class MyFileController {
	
	
     	@RequestMapping("/fileUpload")
     	public String fileUpload(HttpServletRequest  req,HttpServletResponse resp,MultipartFile myfile){
     		/*System.out.println("文件 的名称"+myfile.getOriginalFilename());
			//完成后进行页面跳转
			resp.sendRedirect("/index.jsp");*/
			//获取session
			HttpSession session=req.getSession();
			String tpmc=session.getAttribute("tpyhm").toString();
			String cgurl =session.getAttribute("cgurl").toString();
			//System.out.println(tpmc);
			//重命名
			int mzjs=0;
			int mzcd=myfile.getOriginalFilename().length();
			String mzhz="";
			while(mzjs<mzcd){
				mzcd-=1;
				mzhz=myfile.getOriginalFilename().charAt(mzcd)+mzhz;
				if(mzjs==3){
					break;
				}
				mzjs+=1;
			}
			//类型不同
			if(mzhz.equals(".ico")!=true) {
				JOptionPane.showInternalMessageDialog(null, "只能使用ico格式图片！");
				return "http://www.qc-h.xyz/myfileupload.jsp";
			}
			String newusername=tpmc+mzhz;
			System.out.println(mzhz);
			System.out.println(newusername);
			//System.out.println(myfile.getOriginalFilename());
     		//需要把这个文件保存到磁盘上   
     		try {
     			//fileOutputStream文件输出流- 将内存中的数据写入到磁盘中
				FileOutputStream fileOutputStream = new FileOutputStream (new File("H:\\xampp\\tomcat\\webapps\\ROOT\\usertx\\"+newusername)) ;
				
				//先取到数据
				InputStream inputStream = myfile.getInputStream();
				
				
				//实现一个读写过程  
				
				byte [] b=new byte[1024];
				
				int len ;
				
				while( (len=inputStream.read(b))!=-1 ){
					
					fileOutputStream.write(b, 0, len);
				}
				//关闭流
				fileOutputStream.flush();
				fileOutputStream.close();
				inputStream.close();
				tz tz1=new tz();
				tz1.tzView(cgurl);
     		} catch (IOException e) {
				
				e.printStackTrace();
     		}
			return "";
     		
     		
     		
     	}
     	
	
}

