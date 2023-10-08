package functions;

public abstract class AbstractTabulatedFunction {

    protected abstract int findX(double x);

    protected abstract int floorIndexOfX(double x);

    protected abstract double extrapolateLeft(double x);

    protected abstract double extrapolateRight(double x);

    protected abstract double interpolate(double x, int floorIndex);

    protected double interpolate(double x, double leftX, double rightX, double leftY, double rightY){

        return 0;
    }


}
