package functions;

import java.util.Arrays;

public class ArrayTabulatedFunction extends AbstractTabulatedFunction{

    protected double [] xValues;

    protected double [] yValues;

    protected int count;

    public ArrayTabulatedFunction(double[] xValues, double[] yValues){
        this.count = xValues.length;
        this.xValues = Arrays.copyOf(xValues,xValues.length);
        this.yValues = Arrays.copyOf(yValues,yValues.length);
    }

    public ArrayTabulatedFunction(MathFunction source, double xFrom, double xTo, int count) {
        this.count = count;
        this.xValues = new double[count];
        this.yValues = new double[count];
        if (xFrom < xTo) {
            this.xValues[0] = xFrom;
            this.xValues[count-1] = xTo;
        } else {
            this.xValues[0] = xTo;
            this.xValues[count-1] = xFrom;
        }
        double delta = (this.xValues[count-1]-this.xValues[0])/(count-1);
            this.yValues[0] = source.apply(this.xValues[0]);
            this.yValues[count-1] = source.apply(this.xValues[count-1]);
            for (int i = 1; i < count; i++){
                this.xValues[i] = this.xValues[i-1]+delta;
                this.yValues[i] = source.apply(this.xValues[i]);
            }
    }

    @Override
    protected int floorIndexOfX(double x) {
        if (x < this.leftBound()) return 0;
        if (x > this.rightBound()) return count-1;               //Выход из поиска при искомом значении вне границ значений массива

        // Создаем границы со значениями индексов крайних значений массива
        int leftBorder = 0;
        int rightBorder = this.xValues.length - 1;
        // пока левая и правая границы поиска не равны
        while (leftBorder <= rightBorder) {
            // индекс текущего элемента находится посередине
            int middle = (leftBorder + rightBorder) / 2;    //Находим центральный элемент массива
            double current = this.xValues[middle];    //Находим текущий элемент массива

            if (current == x) {
                // нашли элемент - возвращаем его индекс
                return middle;
            } else if (current < x) {
                // текущий элемент меньше искомого - сдвигаем левую границу
                leftBorder = middle + 1;
            } else {
                // иначе сдвигаем правую границу
                rightBorder = middle - 1;
            }
        }
        // проверили весь массив, но не нашли элемент
        return leftBorder-1;
    }

    @Override
    protected double extrapolateLeft(double x) {
        if (count == 1) return yValues[0];
        return yValues[1]+(((x-xValues[1])/(xValues[0]-xValues[1]))*(yValues[0]-yValues[1]));
    }

    @Override
    protected double extrapolateRight(double x) {
        if (count == 1) return yValues[0];
        return yValues[count-2]+(((x-xValues[count-2])/(xValues[count-1]-xValues[count-2]))*(yValues[count-1]-yValues[count-2]));
    }

    @Override
    protected double interpolate(double x, int floorIndex) {
        if (count == 1) return yValues[0];
        return yValues[floorIndex]+((yValues[floorIndex+1]-yValues[floorIndex])/(xValues[floorIndex+1]-xValues[floorIndex]))*(x-xValues[floorIndex]);
    }

    @Override
    protected double interpolate(double x, double leftX, double rightX, double leftY, double rightY) {
        if (count == 1) return yValues[0];
        return leftY+((rightY-leftY)/(rightX-leftX))*(x-leftX);
    }

    @Override
    public int getCount() {
        return this.count;
    }

    @Override
    public double getX(int index) {
        return this.xValues[index];
    }

    @Override
    public double getY(int index) {
        return this.yValues[index];
    }

    @Override
    public void setY(int index, double value) {
        this.yValues[index] = value;
    }

    @Override
    public int indexOfX(double x) {                 //Поиск индекса значения использует бинарный поиск в массиве
        if ((x < this.leftBound()) || (x > this.rightBound())) return -1;               //Выход из поиска при искомом значении вне границ значений массива
        // Создаем границы со значениями индексов крайних значений массива
        int leftBorder = 0;
        int rightBorder = this.xValues.length - 1;
        // пока левая и правая границы поиска не равны
        while (leftBorder <= rightBorder) {
            // индекс текущего элемента находится посередине
            int middle = (leftBorder + rightBorder) / 2;    //Находим центральный элемент массива
            double current = this.xValues[middle];    //Находим текущий элемент массива

            if (current == x) {
                // нашли элемент - возвращаем его индекс
                return middle;
            } else if (current < x) {
                // текущий элемент меньше искомого - сдвигаем левую границу
                leftBorder = middle + 1;
            } else {
                // иначе сдвигаем правую границу
                rightBorder = middle - 1;
            }
        }
        // проверили весь массив, но не нашли элемент
        return -1;
    }

    @Override
    public int indexOfY(double y) {               //Поиск индекса значения использует бинарный поиск в массиве (Аналогично поиску индекса Х по значению)
        if ((y < this.getY(0)) || (y > this.getY(this.count-1))) return -1;
        //Выход из поиска при искомом значении вне границ значений массива
        // Создаем границы со значениями индексов крайних значений массива
        int leftBorder = 0;
        int rightBorder = this.yValues.length - 1;
        // пока левая и правая границы поиска не равны
        while (leftBorder <= rightBorder) {
            // индекс текущего элемента находится посередине
            int middle = (leftBorder + rightBorder) / 2;    //Находим центральный элемент массива
            double current = this.yValues[middle];    //Находим текущий элемент массива

            if (current == y) {
                // нашли элемент - возвращаем его индекс
                return middle;
            } else if (current < y) {
                // текущий элемент меньше искомого - сдвигаем левую границу
                leftBorder = middle + 1;
            } else {
                // иначе сдвигаем правую границу
                rightBorder = middle - 1;
            }
        }
        // проверили весь массив, но не нашли элемент
        return -1;
    }

    @Override
    public double leftBound() {
        return this.xValues[0];
    }

    @Override
    public double rightBound() {
        return this.xValues[this.count-1];
    }

    @Override
    public double apply(double x) {
        if (x < leftBound()) return extrapolateLeft(x);
        else if (x > rightBound()) return extrapolateRight(x);
        else if (indexOfX(x) != -1) return getY(indexOfX(x));
        else return interpolate(x,floorIndexOfX(x));
    }
}