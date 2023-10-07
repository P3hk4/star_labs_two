package functions;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class SqrFunctionTest {

    @Test
    void apply() {
        SqrFunction sqrFunction = new SqrFunction();
        double num = 14.55D;
        assertEquals(num*num, sqrFunction.apply(num));
    }
}