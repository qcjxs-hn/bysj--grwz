package www.wangluo.handler;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
@Controller
public class tz {
	@RequestMapping("/tz")
	public String tzView(String cgurl) {
		System.out.println("11111");
		System.out.println("redirect:https://www.qc-h.xyz/zhuye/index.jsp?"+cgurl);
		String newurl="redirect:https://www.qc-h.xyz/zhuye/index.jsp?"+cgurl;
		return newurl;
		
	}

}
