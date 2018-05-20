package tablePojos;

import java.util.Date;

public class Report {
    private int id;
    private Date date;
    private int status;
    private int user_id;
    private int reportCount;

    public Report(int id, Date date, int status, int user_id, int reportCount) {
        this.id = id;
        this.date = date;
        this.status = status;
        this.user_id = user_id;
        this.reportCount = reportCount;
    }
    public Report() {
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getReportCount() {
        return reportCount;
    }

    public void setReportCount(int reportCount) {
        this.reportCount = reportCount;
    }
}
