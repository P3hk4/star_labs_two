package functions;

import org.junit.jupiter.api.Test;

import static java.lang.Double.NaN;
import static org.junit.jupiter.api.Assertions.*;

class LogMathFunctionTest {

    @Test
    void apply() {
        LogMathFunction logMathFunction = new LogMathFunction();
        assertEquals(2.3, logMathFunction.apply(10), 2.3*0.05);
        assertEquals(1, logMathFunction.apply(Math.E));
        assertEquals(NaN,logMathFunction.apply(-10));
    }
}