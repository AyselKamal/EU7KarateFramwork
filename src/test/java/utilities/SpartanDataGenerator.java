package utilities;

import com.github.javafaker.Faker;

import java.util.HashMap;
import java.util.Map;

public class SpartanDataGenerator {
    public static Map<String,Object> createSpartan() {

        Faker faker= new Faker();
        String name = faker.name().firstName();
        String gender = faker.demographic().sex();
     long phone= Long.parseLong(faker.numerify("##########"));

        Map <String,Object> newspartan = new HashMap<>();
        newspartan.put("name",name);
        newspartan.put("gender", gender);
        newspartan.put("phone", phone);



       return newspartan;
    }
}
