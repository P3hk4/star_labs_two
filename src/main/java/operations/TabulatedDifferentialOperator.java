package operations;

import functions.Point;
import functions.TabulatedFunction;
import functions.factory.ArrayTabulatedFunctionFactory;
import functions.factory.TabulatedFunctionFactory;

public class TabulatedDifferentialOperator implements DifferentialOperator<TabulatedFunction>{
    private TabulatedFunctionFactory factory;

    public TabulatedDifferentialOperator(){
        this.factory = new ArrayTabulatedFunctionFactory();
    }

    public TabulatedDifferentialOperator(TabulatedFunctionFactory tabulatedFunctionFactory){
        this.factory = tabulatedFunctionFactory;
    }

    public TabulatedFunctionFactory getF(){
        return this.factory;
    }

    public void setF(TabulatedFunctionFactory tabulatedFunctionFactory){
        this.factory = tabulatedFunctionFactory;
    }
    @Override
    public TabulatedFunction derive(TabulatedFunction function) {
        Point[] arrayOfPoints = TabulatedFunctionOperationService.asPoints(function);
        double[] xValue = new double[function.getCount()];
        double[] yValue = new double[function.getCount()];
        int i = 0;
        while (i < (xValue.length-1)) {
            xValue[i] = arrayOfPoints[i].x;
            yValue[i] = (arrayOfPoints[i + 1].y - arrayOfPoints[i].y) / (arrayOfPoints[i + 1].x - arrayOfPoints[i].x);
            i++;
        }
        xValue[i] = arrayOfPoints[i].x;
        yValue[i] = yValue[i - 1];
        return factory.create(xValue, yValue);

    }
}
