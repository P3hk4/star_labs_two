package io;

import functions.ArrayTabulatedFunction;
import functions.LinkedListTabulatedFunction;
import functions.TabulatedFunction;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class TabulatedFunctionFileOutputStream {
    public static void main(String[] args) {
        try (BufferedOutputStream arrayFile = new BufferedOutputStream(new FileOutputStream("output/array function.bin"));
             BufferedOutputStream listFile = new BufferedOutputStream(new FileOutputStream("output/linked list function.bin"))) {
            double[] xValue = {1, 3, 5, 7};
            double[] yValue = {2, 4, 6, 8};
            TabulatedFunction arrayFunction = new ArrayTabulatedFunction(xValue, yValue);
            TabulatedFunction listFunction = new LinkedListTabulatedFunction(xValue, yValue);

            FunctionsIO.writeTabulatedFunction(arrayFile, arrayFunction);
            FunctionsIO.writeTabulatedFunction(listFile, listFunction);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
