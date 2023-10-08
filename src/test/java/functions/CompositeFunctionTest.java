package functions;

import org.junit.jupiter.api.Test;

import static java.lang.Math.PI;
import static org.junit.jupiter.api.Assertions.*;

class CompositeFunctionTest {
AtanMathFunction atanMathFunction = new AtanMathFunction();
LogMathFunction logMathFunction = new LogMathFunction();
    public static final double NEGATIVE_INFINITY = -1.0 / 0.0;
    @Test
    void apply() {
        CompositeFunction compositeFunction = new CompositeFunction(atanMathFunction, logMathFunction);

        assertEquals(NEGATIVE_INFINITY, compositeFunction.apply(0));
        assertNotEquals(1, compositeFunction.apply(1));

        CompositeFunction compositeFunction1 = new CompositeFunction(logMathFunction, atanMathFunction);
        assertEquals(PI/4, compositeFunction1.apply(Math.E));
        assertNotEquals(1, compositeFunction1.apply(0));
    }
}