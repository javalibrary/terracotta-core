package com.tc.admin.common;

import java.util.Date;

import javax.management.j2ee.statistics.Statistic;

import org.jfree.data.time.Second;

import com.tc.stats.statistics.DoubleStatistic;
import com.tc.admin.ConnectionContext;

public class DoubleStatisticPanel extends StatisticPanel {
  private Date date = new Date();

  public DoubleStatisticPanel(ConnectionContext cc) {
    super(cc);
  }

  public void setStatistic(Statistic stat) {
    super.setStatistic(stat);

    DoubleStatistic doubleStat = (DoubleStatistic)stat;
    long            ts         = doubleStat.getLastSampleTime();
    double          value      = doubleStat.getDoubleValue();
    
    date.setTime(ts);

    getTimeSeries().addOrUpdate(new Second(date), value);
  }
  
  public void tearDown() {
    super.tearDown();
    date = null;
  }
}
