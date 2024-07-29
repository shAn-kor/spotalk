package com.myweb.listener;

import com.myweb.user.model.UserDTO;
import com.myweb.user.service.UserService;
import com.myweb.user.service.UserServiceImpl;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.Calendar;
import java.util.Date;

@WebListener
public class DailyTaskScheduler implements ServletContextListener {
    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        scheduler = Executors.newSingleThreadScheduledExecutor();

        // 현재 시간으로부터 자정까지의 시간을 계산
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 24);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        Date midnight = calendar.getTime();

        long initialDelay = midnight.getTime() - System.currentTimeMillis();
        if (initialDelay < 0) {
            initialDelay += TimeUnit.DAYS.toMillis(1);
        }

        scheduler.scheduleAtFixedRate(() -> {
            // 여기에 매일 자정에 실행할 코드를 작성
            System.out.println("매일 자정에 실행되는 작업");

            UserService service = new UserServiceImpl();
            service.updateGrade();

        }, initialDelay, TimeUnit.DAYS.toMillis(1), TimeUnit.MILLISECONDS);
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        scheduler.shutdownNow();
    }
}
