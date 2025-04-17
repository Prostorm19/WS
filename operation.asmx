*****
TO ADD IN THE VISUAL STUDIO OPERATION.ASMX.CS FILE
*****


[WebMethod]
public double Add(double a, double b) {
    double sum = a + b;
    return sum;
}

[WebMethod]
public double Multi(double a, double b) {
    double m = a * b;
    return m;
}
