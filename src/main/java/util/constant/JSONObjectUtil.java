package util.constant;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

public class JSONObjectUtil {
    public static JSONObject getJSONSObjectByReader(BufferedReader reqReader) throws IOException, ParseException {
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reqReader.readLine()) != null) {
            System.out.println(line);
            sb.append(line);
        }
        JSONParser parser = new JSONParser();
        return new JSONObject((Map) parser.parse(sb.toString()));
    }
}
