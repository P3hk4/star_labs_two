package functions;

import org.junit.Test;

import static org.junit.jupiter.api.Assertions.*;

public class IdentityFunctionTest {

    @Test
    public void apply() {
        MathFunction IdentityFunction = new IdentityFunction();
        assertEquals(14, IdentityFunction.apply(14));
        assertNotEquals(14, IdentityFunction.apply(17));
    }
}