package util.utils;

import java.io.PrintWriter;

import static util.constant.BadWords.BADWORDS;

public class CheckBadWords {
    public static boolean isBadWord(String[] words) {
        for (String str : words) {
            for (String badWords : BADWORDS) {
                if (str.contains(badWords)) {
                    return true;
                }
            }
        }
        return false;
    }
}
