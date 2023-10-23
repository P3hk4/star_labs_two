package functions;

public class IdentityFunction implements MathFunction, Cloneable{
    public double apply(double x) {
        return x;
    }

    @Override
    public String toString() {
        return "IdentityFunction - Описывает математическую функцию, заданную при создании экземпляра класса. " +
                "На вход принимает исходное значение Double, возвращает значение Double после приминения описанной функции.";
    }

    @Override
    public boolean equals(Object obj) {
        return obj instanceof IdentityFunction;
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
