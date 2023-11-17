package functions;


import exceptions.InterpolationException;
import org.junit.jupiter.api.Test;

import java.util.Iterator;
import java.util.Objects;

import static org.junit.jupiter.api.Assertions.*;

class LinkedListTabulatedFunctionTest {
    double[] xValue = {1, 2, 2.7, 2.9, 5};
    double[] yValue = {1, 2, 3, 4, 5};


    double[] xValue3 = {5, 7};
    double[] yValue3 = {2, 7};
    LinkedListTabulatedFunction linkedListTabulatedFunction=new LinkedListTabulatedFunction(xValue,yValue);

    LinkedListTabulatedFunction linkedListTabulatedFunction2=new LinkedListTabulatedFunction(xValue3,yValue3);

    @Test
    void getCount() {
        assertEquals(5, linkedListTabulatedFunction.getCount());
        assertNotEquals(0, linkedListTabulatedFunction.getCount());
    }

    @Test
    void leftBound() {
        assertEquals(1, linkedListTabulatedFunction.leftBound());
        assertNotEquals(0, linkedListTabulatedFunction.leftBound());
    }

    @Test
    void rightBound() {
        assertEquals(5, linkedListTabulatedFunction.rightBound());
        assertNotEquals(0, linkedListTabulatedFunction.rightBound());
    }

    @Test
    void getX() {
        assertEquals(2, linkedListTabulatedFunction.getX(1));
        assertEquals(2.9, linkedListTabulatedFunction.getX(3));
        assertNotEquals(0, linkedListTabulatedFunction.getX(2));
    }

    @Test
    void getY() {
        assertEquals(1, linkedListTabulatedFunction.getY(0));
        assertEquals(4, linkedListTabulatedFunction.getY(3));
        assertNotEquals(0, linkedListTabulatedFunction.getY(3));
    }

    @Test
    void setY() {
        linkedListTabulatedFunction.setY(0, 0);
        assertEquals(0, linkedListTabulatedFunction.getY(0));
        assertNotEquals(1, linkedListTabulatedFunction.getY(0));
    }

    @Test
    void indexOfX() {
        assertEquals(2,linkedListTabulatedFunction.indexOfX(2.7));
        assertNotEquals(4, linkedListTabulatedFunction.indexOfX(2.9));


    }

    @Test
    void indexOfY() {
        assertEquals(1, linkedListTabulatedFunction.indexOfY(2));
        assertEquals(0, linkedListTabulatedFunction.indexOfY(1));
        assertNotEquals(0, linkedListTabulatedFunction.indexOfY(3));


    }

    @Test
    void floorIndexOfX() {


        assertEquals(5, linkedListTabulatedFunction.floorIndexOfX(7));
        assertNotEquals(0, linkedListTabulatedFunction.floorIndexOfX(6));

        assertEquals(0, linkedListTabulatedFunction.floorIndexOfX(1.5));
        assertEquals(0, linkedListTabulatedFunction.floorIndexOfX(1.7));
        assertEquals(3, linkedListTabulatedFunction.floorIndexOfX(4));
        assertNotEquals(0, linkedListTabulatedFunction.floorIndexOfX(2.5));

        assertEquals(5, linkedListTabulatedFunction.floorIndexOfX(7));
        assertNotEquals(3, linkedListTabulatedFunction.floorIndexOfX(7));
    }

    @Test
    void interpolate() {
        try {
            assertEquals(3,linkedListTabulatedFunction.interpolate(2.7, 2));
            assertNotEquals(0, linkedListTabulatedFunction.interpolate(2.7, 2));
        } catch (InterpolationException interpolationException) {
            fail("InterpolationException not expected");
        }

        try {
            assertEquals(3,linkedListTabulatedFunction.interpolate(3, 2));
            assertNotEquals(0, linkedListTabulatedFunction.interpolate(2.7, 2));
            fail("InterpolationException expected");
        } catch (InterpolationException interpolationException) {
        }
    }

    @Test
    void extrapolateLeft() {
        assertEquals(0, linkedListTabulatedFunction.extrapolateLeft(0));
        assertNotEquals(4, linkedListTabulatedFunction.extrapolateLeft(0));

    }

    @Test
    void extrapolateRight() {
        assertEquals(5, linkedListTabulatedFunction.extrapolateRight(5));
        assertNotEquals(0, linkedListTabulatedFunction.extrapolateRight(10));


    }

    @Test
    void apply(){
        SqrFunction sqrFunction = new SqrFunction();
        LinkedListTabulatedFunction listTabulatedFunction = new LinkedListTabulatedFunction(sqrFunction, 10,100,90);
        assertEquals(10198.988764044945, listTabulatedFunction.apply(101));
        assertEquals(78.98876404494382, listTabulatedFunction.apply(9));

    }

    @Test
    void nodeToString(){
        LinkedListTabulatedFunction.Node node = new LinkedListTabulatedFunction.Node(1, -1);
        assertEquals("(1.0; -1.0)", node.toString());
        assertNotEquals("(1.0; 1.0)", node.toString());
    }

    @Test
    void nodeEquals(){
        LinkedListTabulatedFunction.Node node1 = new LinkedListTabulatedFunction.Node(1, -1);
        LinkedListTabulatedFunction.Node node2 = new LinkedListTabulatedFunction.Node(1, -1);
        LinkedListTabulatedFunction.Node node3 = new LinkedListTabulatedFunction.Node(10, -1);


        assertTrue(node1.equals(node1));
        assertTrue(node1.equals(node2));
        assertTrue(node2.equals(node1));
        assertFalse(node1.equals(node3));


    }

    @Test
    void nodeHash(){
        LinkedListTabulatedFunction.Node node1 = new LinkedListTabulatedFunction.Node(1, -1);
        LinkedListTabulatedFunction.Node node2 = new LinkedListTabulatedFunction.Node(-1, 1);
        LinkedListTabulatedFunction.Node node3 = new LinkedListTabulatedFunction.Node(1, 1);

        assertEquals(node2.hashCode(), node1.hashCode());
        assertNotEquals(node1.hashCode(), node3.hashCode());


    }

    @Test
    void nodeClone() throws CloneNotSupportedException {
        LinkedListTabulatedFunction.Node node = new LinkedListTabulatedFunction.Node(1.5, -1.5);
        Object clone = node.clone();
        assertTrue(node.equals(clone));
    }

    @Test
    void toStringList(){
        assertEquals("(1.0; 1.0) (2.0; 2.0) (2.7; 3.0) (2.9; 4.0) (5.0; 5.0) ", linkedListTabulatedFunction.toString());
        assertEquals("(5.0; 2.0) (7.0; 7.0) ",linkedListTabulatedFunction2.toString() );
    }

    @Test
    void equalsList(){
        double[] xValue11 = {1, 2, 2.7, 2.9, 5};
        double[] yValue11 = {1, 2, 3, 4, 5};
        double[] xValue22 = {1, 2,};
        double[] yValue22 = {1, 2,};
        LinkedListTabulatedFunction linkedListTabulatedFunction11=new LinkedListTabulatedFunction(xValue11,yValue11);
        LinkedListTabulatedFunction linkedListTabulatedFunction22=new LinkedListTabulatedFunction(xValue22,yValue22);
        assertTrue(linkedListTabulatedFunction.equals(linkedListTabulatedFunction11));
        assertTrue(linkedListTabulatedFunction.equals(linkedListTabulatedFunction));
        assertFalse(linkedListTabulatedFunction.equals(linkedListTabulatedFunction22));
        assertFalse(linkedListTabulatedFunction22.equals(null));
    }

    @Test
    void hashList(){
        double[] xValue11 = {1, 2, 2.7, 2.9, 5};
        double[] yValue11 = {1, 2, 3, 4, 5};
        LinkedListTabulatedFunction linkedListTabulatedFunction11=new LinkedListTabulatedFunction(xValue11,yValue11);
        assertEquals(linkedListTabulatedFunction.hashCode(), linkedListTabulatedFunction11.hashCode());
        assertNotEquals(linkedListTabulatedFunction.hashCode(), linkedListTabulatedFunction2.hashCode());

    }

    @Test
    void cloneList(){
        Object test = linkedListTabulatedFunction.clone();
        assertTrue(linkedListTabulatedFunction.equals(test));
    }

    @Test
    void constructorOne(){
        double[] xValue2 = {5};
        double[] yValue2 = {2};
        assertThrows(IllegalArgumentException.class, () -> {
            LinkedListTabulatedFunction ltf = new LinkedListTabulatedFunction(xValue2, yValue2);
        });
    }

    @Test
    void constructorTwo(){
        AtanMathFunction atan = new AtanMathFunction();
        assertThrows(IllegalArgumentException.class, () -> {
            LinkedListTabulatedFunction ltf = new LinkedListTabulatedFunction(atan,1,2,1);
        });
    }
    @Test
    void getNodeEx(){
        assertThrows(IllegalArgumentException.class, () ->{
            linkedListTabulatedFunction.getNode(-1);
        });
    }
    @Test
    void getXex(){
        assertThrows(IllegalArgumentException.class, () ->{
            linkedListTabulatedFunction.getX(15);
        });
    }
    @Test
    void getYex(){
        assertThrows(IllegalArgumentException.class, () ->{
            linkedListTabulatedFunction.getY(-15);
        });
    }
    @Test
    void setYex(){
        assertThrows(IllegalArgumentException.class, () ->{
            linkedListTabulatedFunction.setY(11, 11);
        });
    }
    @Test
    void floorIndexOfXex(){
        assertThrows(IllegalArgumentException.class, () ->{
            linkedListTabulatedFunction.floorIndexOfX(0);
        });
    }
    @Test
    void indexOfXex(){
        assertThrows(IllegalArgumentException.class, () ->{
            linkedListTabulatedFunction.indexOfX(0);
        });
    }
    @Test
    void indexOfYex(){
        assertThrows(IllegalArgumentException.class, () ->{
            linkedListTabulatedFunction.indexOfY(9);
        });
    }

    @Test
    void iterator() {
        Iterator<Point> iterator = linkedListTabulatedFunction.iterator();
        LinkedListTabulatedFunction.Node node = linkedListTabulatedFunction.getNode(0);
        int i = 0;
        while (iterator.hasNext()) {
            Point point = iterator.next();
            assertEquals(point.x, linkedListTabulatedFunction.getX(i));
            assertEquals(point.y, linkedListTabulatedFunction.getY(i));
            i++;
        }
       i = 0;
        for (Point point : linkedListTabulatedFunction){
            assertEquals(linkedListTabulatedFunction.getX(i),point.x);
            assertEquals(linkedListTabulatedFunction.getY(i),point.y);
            i++;
        }
    }

    @Test
    void newToString(){
        assertEquals(linkedListTabulatedFunction.toString(), "LinkedListTabulatedFunction size = 5\n[1.0; 1.0]\n[2.0; 2.0]\n[2.7; 3.0]\n[2.9; 4.0]\n[5.0; 5.0]");
    }
}