package functions;

import org.junit.jupiter.api.Test;

import static java.lang.Math.PI;
import static org.junit.jupiter.api.Assertions.*;

class AtanMathFunctionTest {

    @Test
    void apply() {
        AtanMathFunction atanMathFunction = new AtanMathFunction();
        assertEquals(0, atanMathFunction.apply(0));
        assertEquals((PI / 4), atanMathFunction.apply(1));
        assertNotEquals(1, atanMathFunction.apply(PI/4));
    }
}