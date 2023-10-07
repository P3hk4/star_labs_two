package functions;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class SqrFunctionTest {

    @Test
    void apply() {
        SqrFunction sqrFunction = new SqrFunction();
        assertEquals(14.55D*14.55D, sqrFunction.apply(14.55D));
    }
}