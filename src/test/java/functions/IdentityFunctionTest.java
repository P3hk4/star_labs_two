package functions;

import org.junit.Test;

import static org.junit.jupiter.api.Assertions.*;

public class IdentityFunctionTest {

    @Test
    public void apply() {
        MathFunction identityFunction = new IdentityFunction();
        assertEquals(14, identityFunction.apply(14));
        assertNotEquals(14, identityFunction.apply(17));
    }

    @Test
    public void equals() {
        MathFunction firstIdentityFunction = new IdentityFunction();
        MathFunction secondIdentityFunction = new IdentityFunction();
        MathFunction constantFunction = new ConstantFunction(5.5);
        assertTrue(firstIdentityFunction.equals(secondIdentityFunction));
        assertFalse(firstIdentityFunction.equals(constantFunction));
    }

    @Test
    public void hashCodeTest() {
        MathFunction firstIdentityFunction = new IdentityFunction();
        MathFunction firstIdentityFunctionCopy = firstIdentityFunction;
        MathFunction secondIdentityFunction = new IdentityFunction();
        assertEquals(firstIdentityFunction.hashCode(), firstIdentityFunctionCopy.hashCode());
        assertNotEquals(firstIdentityFunction.hashCode(), secondIdentityFunction.hashCode());
    }

    @Test
    public void cloneTest() throws CloneNotSupportedException {
        MathFunction firstIdentityFunction = new IdentityFunction();
        Object firstIdentityFunctionClone = ((IdentityFunction) firstIdentityFunction).clone();
        assertNotEquals(firstIdentityFunction.hashCode(), firstIdentityFunctionClone.hashCode());
    }
}