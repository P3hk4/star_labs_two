package operations;

import functions.ArrayTabulatedFunction;
import functions.Point;
import functions.SqrFunction;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class TabulatedFunctionOperationServiceTest {

    @Test
    void asPoints() {
        double[] X = {1,2,3,4,5,6,7,8,9,10};
        double[] Y = {1,4,9,16,25,36,49,64,81,100};
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(X,Y);
        Point[] points = TabulatedFunctionOperationService.asPoints(ATF);
        for (int i = 0; i < points.length; ++i){
            assertEquals(X[i],points[i].x);
            assertEquals(Y[i],points[i].y);
        }

        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF1 = new ArrayTabulatedFunction(sqrFunction, 1,10,10);
        Point[] points1 = TabulatedFunctionOperationService.asPoints(ATF);
        for (int i = 0; i < points1.length; ++i){
            assertEquals(ATF1.getX(i),points1[i].x);
            assertEquals(ATF1.getY(i),points1[i].y);
        }
    }
}