package com.example;

import javax.jws.WebService;
import javax.jws.WebMethod;

@WebService
public class MultiplicationService {

    @WebMethod
    public int multiply(int a, int b) {
        return a * b;
    }
}
