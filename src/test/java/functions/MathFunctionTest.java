package functions;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MathFunctionTest {

    @Test
    void andThen() {
        LogMathFunction logMathFunction = new LogMathFunction();
        SqrFunction sqrFunction = new SqrFunction();
        CompositeFunction composite = sqrFunction.andThen(logMathFunction);
        CompositeFunction secComposite = logMathFunction.andThen(sqrFunction);
        CompositeFunction thrdComposite = sqrFunction.andThen(sqrFunction).andThen(sqrFunction);
        assertEquals(2,composite.apply(Math.E));
        assertEquals(1,secComposite.apply(Math.E));
        assertEquals(256,thrdComposite.apply(2));
    }
}