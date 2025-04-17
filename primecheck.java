package server;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author catch
 */
@WebService(serviceName = "primecheck")
public class primecheck {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "checkprime")
    public String checkprime(@WebParam(name = "a") int a) {
    boolean isPrime = true;

    if (a <= 1) {
        isPrime = false;
    } else {
        for (int i = 2; i < a; i++) {
            if (a % i == 0) {
                isPrime = false;
                break;
            }
        }
    }

    if (isPrime) {
        return a + " is a prime number.";
    } else {
        return a + " is not a prime number.";
    }
}


    /**
     * This is a sample web service operation
     */
    
}
