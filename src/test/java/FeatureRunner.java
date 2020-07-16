import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

public class FeatureRunner {

    @Karate.Test
    Karate metaWeatherTest() {
        return new Karate().tags("@meta_weather").relativeTo(getClass());
    }
    @Karate.Test
    Karate bookIt(){
        return  new Karate().tags("@bookit").relativeTo(getClass());
    }

    @Karate.Test
    Karate spartan() {
        return new Karate ().tags ( "@spartan" ).relativeTo ( getClass () );
    }

    @Test
    void testParallel (){
        Results results = Runner.path("classpath:features").parallel(8);
    }

    @Karate.Test
    Karate zippopotam() {
        return new Karate ().tags ( "@zippopotam" ).relativeTo ( getClass () );
    }
}
