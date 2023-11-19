package io;

import functions.TabulatedFunction;
import functions.factory.ArrayTabulatedFunctionFactory;
import functions.factory.LinkedListTabulatedFunctionFactory;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public abstract class  TabulatedFunctionFileReader {
    public static void main(String[] args) {
        try (
                FileReader arrayFileReader = new FileReader("input/function.txt");
                FileReader listFileReader = new FileReader("input/function.txt")
        ){
            BufferedReader arrayBufferedReader = new BufferedReader(arrayFileReader);
            BufferedReader listBufferedReader = new BufferedReader(listFileReader);
            ArrayTabulatedFunctionFactory arrayFactory = new ArrayTabulatedFunctionFactory();
            LinkedListTabulatedFunctionFactory listFactory = new LinkedListTabulatedFunctionFactory();
            TabulatedFunction ATF = FunctionsIO.readTabulatedFunction(arrayBufferedReader, arrayFactory);
            TabulatedFunction LTF = FunctionsIO.readTabulatedFunction(listBufferedReader, listFactory);
            System.out.println(ATF.toString());
            System.out.println(LTF.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
