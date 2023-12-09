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

    @PostMapping("/setSettings")
    public void getSettings(@RequestParam("functionSelect") String type){
        System.out.println(type);
    }

    @PostMapping("/createMathFunction")
    public void createMathFunction(@RequestParam("functionSelect") String function, @RequestParam("pointCount") int count,
                                   @RequestParam("xFrom") double xFrom, @RequestParam("xTo") double xTo){
        System.out.println(function);
        System.out.println(count);
        System.out.println(xFrom);
        System.out.println(xTo);

    }
}
