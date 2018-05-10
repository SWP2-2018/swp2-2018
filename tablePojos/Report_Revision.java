package tablePojos;

public class Report_Revision {

    private int id;
    private int report_id;
    private int number;
    private String text1;
    private String text2;
    private String text3;
    private int hours1;
    private int hours2;
    private int hours3;
    private String comment;

    public Report_Revision() {
    }

    public Report_Revision(int report_id, int number, String text1, String text2, String text3, int hours1, int hours2, int hours3, String comment) {
        this.report_id = report_id;
        this.number = number;
        this.text1 = text1;
        this.text2 = text2;
        this.text3 = text3;
        this.hours1 = hours1;
        this.hours2 = hours2;
        this.hours3 = hours3;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReport_id() {

        return report_id;
    }

    public void setReport_id(int report_id) {
        this.report_id = report_id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getText1() {
        return text1;
    }

    public void setText1(String text1) {
        this.text1 = text1;
    }

    public String getText2() {
        return text2;
    }

    public void setText2(String text2) {
        this.text2 = text2;
    }

    public String getText3() {
        return text3;
    }

    public void setText3(String text3) {
        this.text3 = text3;
    }

    public int getHours1() {
        return hours1;
    }

    public void setHours1(int hours1) {
        this.hours1 = hours1;
    }

    public int getHours2() {
        return hours2;
    }

    public void setHours2(int hours2) {
        this.hours2 = hours2;
    }

    public int getHours3() {
        return hours3;
    }

    public void setHours3(int hours3) {
        this.hours3 = hours3;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
