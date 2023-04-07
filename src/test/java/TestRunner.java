import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;

import static org.junit.Assert.assertTrue;

public class TestRunner {

    @Test
    public void run(){
        Results results = Runner.path("classpath:features").parallel(1);
        assertTrue(results.getErrorMessages(),results.getFailCount()==0);
    }

}