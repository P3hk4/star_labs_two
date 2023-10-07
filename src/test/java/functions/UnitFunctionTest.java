package functions;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UnitFunctionTest {

    @Test
    void apply() {
        UnitFunction unitFunction = new UnitFunction();
        assertEquals(1, unitFunction.apply(1));
        assertEquals(1, unitFunction.apply(42));
    }

    @Test
    void getConstant() {
        UnitFunction unitFunction = new UnitFunction();
        assertEquals(1, unitFunction.getConstant());
    }
}