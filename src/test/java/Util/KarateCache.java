package Util;

import java.util.HashMap;
import java.util.Map;

public class KarateCache {


    private static Map<String, Object> map = new HashMap<>();

    public void add(String key, Object value){
       map.put(key, value);
    }

    public Object get(String key){
        return map.get(key);
    }

}
