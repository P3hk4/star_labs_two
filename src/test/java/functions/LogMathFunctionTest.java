package functions;

import org.junit.jupiter.api.Test;

import static java.lang.Double.NaN;
import static org.junit.jupiter.api.Assertions.*;

class LogMathFunctionTest {

    @Test
    void apply() {
        LogMathFunction logMathFunction = new LogMathFunction();
        assertEquals(2.302585092994046D, logMathFunction.apply(10));
        assertEquals(1, logMathFunction.apply(Math.E));
        assertEquals(NaN,logMathFunction.apply(-10));
    }
}