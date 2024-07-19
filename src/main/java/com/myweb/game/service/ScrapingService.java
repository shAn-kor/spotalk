import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class ScrapingService {

    // KBO 리그 일정 가져오기 by Selenium, Jsoup
    public void scrapeScheduleKBO() {
        // Selenium WebDriver 설정 (ChromeDriver)
        System.setProperty("webdriver.chrome.driver", "src/lib/chromedriver.exe");

        // 브라우저 창 숨기는 옵션 추가
        ChromeOptions options = new ChromeOptions();
        options.addArguments("headless");
        WebDriver driver = new ChromeDriver(options);

        try {
            // 셀레니움으로 웹 페이지 접근
            driver.get("https://www.koreabaseball.com/Schedule/Schedule.aspx");

            // 셀레니움으로 가져온 HTML을 Jsoup으로 파싱
            Document doc = Jsoup.parse(driver.getPageSource());
            Elements baseballSchedule = doc.select("#tblScheduleList > tbody > tr");

            String currentDay = null;
            for (Element Schedule : baseballSchedule) {
                Element day = Schedule.selectFirst("td.day");
                Element time = Schedule.selectFirst("td.time");
                Element team1 = Schedule.selectFirst("td.play > span");
                Element vs = Schedule.selectFirst("td.play > em");
                Element team2 = Schedule.selectFirst("td.play > span:nth-child(3)");

                if (day != null) {
                    if (currentDay == null || !currentDay.equals(day.text())) {
                        currentDay = day.text();
                    }
                }

                if (time != null) {
                    System.out.println(day);
                    System.out.println(time);
                    System.out.println(team1);
                    System.out.println(vs);
                    System.out.println(team2);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // WebDriver 종료 (쭝요)
            driver.quit();
        }
    }

    public void scrapeScheduleKLeague() {
        // Selenium WebDriver 설정 (ChromeDriver)
        System.setProperty("webdriver.chrome.driver", "src/lib/chromedriver.exe");

        // 브라우저 창 숨기는 옵션 추가
        ChromeOptions options = new ChromeOptions();
        options.addArguments("headless");
        WebDriver driver = new ChromeDriver(options);

        try {
            // 셀레니움으로 웹 페이지 접근
            driver.get("https://m.sports.naver.com/kfootball/schedule/index?category=kleague&date=2024-07-20");
            Thread.sleep(500);

            // 셀레니움으로 가져온 HTML을 Jsoup으로 파싱
            Document doc = Jsoup.parse(driver.getPageSource());
            Elements footballSchedule = doc.select(".ScheduleLeagueType_match_list_container__1v4b0 > div");

            String currentDay = null;
            for (Element Schedule : footballSchedule) {
                Thread.sleep(500);
                Element day = Schedule.selectFirst(".ScheduleLeagueType_title__2Kalm");
                Element time = Schedule.selectFirst(".MatchBox_time__nIEfd");
                Element team1 = Schedule.selectFirst(".MatchBoxTeamArea_team_item__3w5mq:nth-child(1) .MatchBoxTeamArea_team__3aB4O");
                Element team2 = Schedule.selectFirst(".MatchBoxTeamArea_team_item__3w5mq:nth-child(2) .MatchBoxTeamArea_team__3aB4O");

//                if (day != null) {
//                    if (currentDay == null || !currentDay.equals(day.text())) {
//                        currentDay = day.text();
//                    }
//                }
                System.out.println(day);
                System.out.println(time);
                System.out.println(team1);
                System.out.println(team2);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // WebDriver 종료 (쭝요)
            driver.quit();
        }
    }
}