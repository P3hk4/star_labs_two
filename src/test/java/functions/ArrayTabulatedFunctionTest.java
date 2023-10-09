package functions;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ArrayTabulatedFunctionTest {

    @Test
    void floorIndexOfX() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,100,100);
        assertEquals(15,ATF.floorIndexOfX(16.5));
        assertEquals(99,ATF.floorIndexOfX(110));
        assertEquals(0,ATF.floorIndexOfX(-5));

    }

    @Test
    void extrapolateLeft() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 10,20,11);
        assertEquals(79,ATF.extrapolateLeft(9));
        assertEquals(58,ATF.extrapolateLeft(8));
    }

    @Test
    void extrapolateRight() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,10,10);
        assertEquals(119,ATF.extrapolateRight(11));
        assertEquals(138,ATF.extrapolateRight(12));
    }

    @Test
    void interpolate() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,10,10);
        assertEquals(30.5,ATF.interpolate(5.5,ATF.floorIndexOfX(5.5)));
        assertEquals(72.5,ATF.interpolate(8.5,ATF.floorIndexOfX(8.5)));
        assertEquals(ATF.interpolate(5.5,ATF.floorIndexOfX(5.5)),ATF.interpolate(5.5,ATF.getX(4),ATF.getX(5),ATF.getY(4),ATF.getY(5)));
        assertEquals(ATF.interpolate(8.5,ATF.floorIndexOfX(8.5)),ATF.interpolate(8.5,ATF.getX(7),ATF.getX(8),ATF.getY(7),ATF.getY(8)));

    }

    @Test
    void getCount() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,10,10);
        assertEquals(10,ATF.getCount());
    }

    @Test
    void getX() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,10,10);
        assertEquals(5,ATF.getX(4));
        assertEquals(8,ATF.getX(7));
        assertEquals(2,ATF.getX(1));
    }

    @Test
    void getY() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,10,10);
        assertEquals(25,ATF.getY(4));
        assertEquals(64,ATF.getY(7));
        assertEquals(4,ATF.getY(1));
    }

    @Test
    void setY() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,10,10);
        assertEquals(25,ATF.getY(4));
        ATF.setY(4,36);
        assertEquals(36,ATF.getY(4));
    }

    @Test
    void indexOfX() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,10,10);
        assertEquals(1,ATF.indexOfX(2));
        assertEquals(6,ATF.indexOfX(7));
    }

    @Test
    void indexOfY() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,10,10);
        assertEquals(1,ATF.indexOfY(4));
        assertEquals(6,ATF.indexOfY(49));
    }

    @Test
    void leftBound() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,10,10);
        assertEquals(ATF.xValues[0],ATF.leftBound());
    }

    @Test
    void rightBound() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 1,10,10);
        assertEquals(ATF.xValues[ATF.getCount()-1],ATF.rightBound());
    }

    @Test
    void apply() {
        SqrFunction sqrFunction = new SqrFunction();
        ArrayTabulatedFunction ATF = new ArrayTabulatedFunction(sqrFunction, 10,100,90);
        assertEquals(10198.988764044945,ATF.apply(101));
        assertEquals(78.98876404494382,ATF.apply(9));
        assertEquals(2070.346547153137,ATF.apply(45.5));
    }
}