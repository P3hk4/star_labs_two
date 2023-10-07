package functions;

public class ConstantFunction implements MathFunction {

    private final double constant;

    public double apply(double x) {
        return this.constant;
    }

    public ConstantFunction(double constant) {
        this.constant = constant;
    }

    public double getConstant(){
        return this.constant;
    }
}
