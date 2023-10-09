package functions;

import org.junit.jupiter.api.Test;

import static java.lang.Math.PI;
import static java.lang.Math.pow;
import static org.junit.jupiter.api.Assertions.*;

class CompositeFunctionTest {
AtanMathFunction atanMathFunction = new AtanMathFunction();
LogMathFunction logMathFunction = new LogMathFunction();
SqrFunction sqrFunction = new SqrFunction();
ZeroFunction zeroFunction = new ZeroFunction();
UnitFunction unitFunction = new UnitFunction();
    public static final double NEGATIVE_INFINITY = -1.0 / 0.0;


    double[] xValue = {1, 2, 2.7, 2.9, 5};
    double[] yValue = {1, 2, 3, 4, 5};
    double[] xValue2 = {5};
    double[] yValue2 = {2};
    LinkedListTabulatedFunction linkedListTabulatedFunction = new LinkedListTabulatedFunction(xValue,yValue);
    LinkedListTabulatedFunction linkedListTabulatedFunction1 = new LinkedListTabulatedFunction(xValue2,yValue2);


    LinkedListTabulatedFunction LTF = new LinkedListTabulatedFunction(sqrFunction,1,100,100);
    ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,100,100);


    @Test
    void apply() {
        CompositeFunction compositeFunction = new CompositeFunction(atanMathFunction, logMathFunction);

        assertEquals(NEGATIVE_INFINITY, compositeFunction.apply(0));
        assertNotEquals(1, compositeFunction.apply(1));

        CompositeFunction compositeFunction1 = new CompositeFunction(logMathFunction, atanMathFunction);
        assertEquals(PI/4, compositeFunction1.apply(Math.E));
        assertNotEquals(1, compositeFunction1.apply(0));

        CompositeFunction multiFunction1 = new CompositeFunction(logMathFunction,sqrFunction);
        assertEquals(4,multiFunction1.apply(Math.E*Math.E));


        for (int i = 0 ; i < ATF.getCount(); ++i ){
            assertEquals(ATF.getX(i),LTF.getX(i));
            assertEquals(ATF.getY(i),LTF.getY(i));
        }

    }
}