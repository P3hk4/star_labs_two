package functions;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ConstantFunctionTest {

    @Test
    void apply() {
        ConstantFunction constantFunction = new ConstantFunction(42);
        assertEquals(42, constantFunction.apply(100));
        assertEquals(42, constantFunction.apply(-10));
    }

    @Test
    void getConstant() {
        ConstantFunction constantFunction = new ConstantFunction(42);
        assertEquals(42, constantFunction.getConstant());
    }
}