package ui;

import functions.TabulatedFunction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class WebController {

    @Autowired
    private FunctionService functionService;

    @Autowired
    private ParsingService parsingService;

    @RequestMapping("/")
    public String showHomePage(){
        return "homePage";
    }

    @PostMapping("/setSettings")
    public void getSettings(@RequestParam("functionSelect") String type){
        functionService.setSetting(type);
    }

    @PostMapping("/serializeMathFunction")
    @ResponseBody
    public String serializeMathFunction(@RequestParam("functionSelect") String function, @RequestParam("pointCount") int count,
                                   @RequestParam("xFrom") double xFrom, @RequestParam("xTo") double xTo){
        return functionService.serializeMathFunction(function,count,xFrom,xTo);
    }

    @PostMapping("/serializeTabulatedFunction")
    @ResponseBody
    public String serializeTabulatedFunction(@RequestParam("X") String x,@RequestParam("Y") String y){
        return functionService.serializeTabulatedFunction(parsingService.parseStringToDoubleArray(x),parsingService.parseStringToDoubleArray(y));
    }

    @PostMapping("/differentiateMathFunction")
    @ResponseBody
    public String differentiateMathFunction(@RequestParam("functionSelect") String function, @RequestParam("pointCount") int count,
                                   @RequestParam("xFrom") double xFrom, @RequestParam("xTo") double xTo){
        TabulatedFunction tabulatedFunction1 = functionService.createTabulatedFunction(function,count,xFrom,xTo);
        TabulatedFunction tabulatedFunction2 = functionService.differentiateMathFunction(function,count,xFrom,xTo);
        return parsingService.parseTwoTabulatedFunctionToString(tabulatedFunction1,tabulatedFunction2);
    }

    @PostMapping("/differentiateFunction")
    @ResponseBody
    public String differentiateFunction(@RequestParam("X") String x,@RequestParam("Y") String y){
        TabulatedFunction func = functionService.differentiateFunction(parsingService.parseStringToDoubleArray(x),parsingService.parseStringToDoubleArray(y));
        return parsingService.parseTabulatedFunctionToString(func);
    }

    @PostMapping("/calculateOperationResult")
    @ResponseBody
    public String calculateOperationResult(@RequestParam("operationType") String type,
                                           @RequestParam("firstOperand") String firstOperand, @RequestParam("secondOperand") String secondOperand){
        double [] firstX = parsingService.parseStringToDoubleArray(parsingService.getFirstPartOfCombinedString(firstOperand));
        double [] firstY = parsingService.parseStringToDoubleArray(parsingService.getSecondPartOfCombinedString(firstOperand));
        TabulatedFunction firstTF = functionService.createTabulatedFunction(firstX,firstY);
        double [] secondX = parsingService.parseStringToDoubleArray(parsingService.getFirstPartOfCombinedString(secondOperand));
        double [] secondY = parsingService.parseStringToDoubleArray(parsingService.getSecondPartOfCombinedString(secondOperand));
        TabulatedFunction secondTF = functionService.createTabulatedFunction(secondX,secondY);
        return parsingService.parseTabulatedFunctionToString(functionService.calculateOperation(type,firstTF,secondTF));
    }
    @PostMapping("/serializeOperationResult")
    @ResponseBody
    public String serializeOperationResult(@RequestParam("X") String x,@RequestParam("Y") String y){
        return functionService.serializeTabulatedFunction(parsingService.parseStringToDoubleArray(x),parsingService.parseStringToDoubleArray(y));
    }

    @PostMapping("/getMathFunction")
    @ResponseBody
    public String getMathFunction(@RequestParam("functionSelect") String function, @RequestParam("pointCount") int count,
                                  @RequestParam("xFrom") double xFrom, @RequestParam("xTo") double xTo){
        TabulatedFunction tabulatedFunction = functionService.createTabulatedFunction(function,count,xFrom,xTo);
        return parsingService.parseTabulatedFunctionToString(tabulatedFunction);
    }


    @PostMapping("/calculateMathOperationResult")
    @ResponseBody
    public String calculateMathOperationResult(@RequestParam("operationType") String type,
                                  @RequestParam("firstOperand") String firstOperand,@RequestParam("functionSelect") String function, @RequestParam("pointCount") int count,
                                  @RequestParam("xFrom") double xFrom, @RequestParam("xTo") double xTo){
        double [] firstX = parsingService.parseStringToDoubleArray(parsingService.getFirstPartOfCombinedString(firstOperand));
        double [] firstY = parsingService.parseStringToDoubleArray(parsingService.getSecondPartOfCombinedString(firstOperand));
        TabulatedFunction firstTF = functionService.createTabulatedFunction(firstX,firstY);
        TabulatedFunction secondTF = functionService.createTabulatedFunction(function,count,xFrom,xTo);
        return parsingService.parseTwoTabulatedFunctionToString(secondTF,functionService.calculateOperation(type,firstTF,secondTF));
    }





}
