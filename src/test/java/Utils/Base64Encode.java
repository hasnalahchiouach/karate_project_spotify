package Utils;
import java.util.Base64;

public class Base64Encode {
    public static String encode(String input) {
        byte[] encodedBytes = Base64.getEncoder().encode(input.getBytes());
        return new String(encodedBytes);
    }
}
