package multiplicationclient;

import com.example.MultiplicationService;
import com.example.MultiplicationServiceService;

public class multiplicationclient {
    public static void main(String[] args) {
        MultiplicationServiceService service = new MultiplicationServiceService();
        MultiplicationService port = service.getMultiplicationServicePort();

        int a = 7;
        int b = 6;
        int result = port.multiply(a, b);

        System.out.println("Multiplication of " + a + " and " + b + " is: " + result);
    }
}
