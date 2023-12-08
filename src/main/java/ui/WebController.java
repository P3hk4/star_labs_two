package ui;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;


@Controller
public class WebController {

    @RequestMapping("/")
    public String showHomePage(Model model){
        return "homePage";
    }

    @PostMapping("/getSettings")
    public String getSettings(@RequestParam("tabulatedFunctionType") String type){
        System.out.println(type);
        return "redirect:homePage";
    }

    @PostMapping("/createMathFunction")
    public String createMathFunction(HttpServletRequest request){
        System.out.println(request.getParameter("functionSelect"));
        System.out.println(request.getParameter("pointCountInput"));
        System.out.println(request.getParameter("xFromInput"));
        System.out.println(request.getParameter("xToInput"));
        return "homePage";
    }
}
