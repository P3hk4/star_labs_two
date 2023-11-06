package operations;

import functions.MathFunction;
import functions.SqrFunction;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MiddleSteppingDifferentialOperatorTest {

    @Test
    void derive() {
        SteppingDifferentialOperator middleSteppingDifferentialOperator = new MiddleSteppingDifferentialOperator(1);
        SqrFunction sqrFunction = new SqrFunction();
        MathFunction deferentialSqrFunction = middleSteppingDifferentialOperator.derive(sqrFunction);
        assertEquals(24, deferentialSqrFunction.apply(12), 1);
        assertEquals(40, deferentialSqrFunction.apply(20), 1);
    }
}