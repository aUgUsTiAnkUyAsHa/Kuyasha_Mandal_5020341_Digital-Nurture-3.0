/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package z.factorymethodpatternexample;

/**
 *
 * @author kuyas
 */
// Document.java
public interface Document {
    void open();
    void save();
    void close();

    public void edit();

    public void print();

    public void calculate();
}

 interface WordDocument extends Document {
    void edit();
}

 interface PdfDocument extends Document {
    void print();
}

interface ExcelDocument extends Document {
    void calculate();
}