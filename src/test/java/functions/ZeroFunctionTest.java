package functions;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ZeroFunctionTest {

    @Test
    void apply() {
        ZeroFunction zeroFunction = new ZeroFunction();
        assertEquals(0, zeroFunction.apply(0));
        assertEquals(0, zeroFunction.apply(42));
    }

    @Test
    void getConstant() {
        ZeroFunction zeroFunction = new ZeroFunction();
        assertEquals(0, zeroFunction.getConstant());
    }
}