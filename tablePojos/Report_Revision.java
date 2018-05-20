package tablePojos;

public class Report_Revision {

    private int id;
    private int report_id;
    private int number;
    private String textOperationalActivities;
    private String textOperationalGuidance;
    private String textVocationalTeaching;
    private int hoursOperationalActivities;
    private int hoursOperationalGuidance;
    private int hoursVocationalTeaching;
    private String comment;

    public Report_Revision() {
    }

    public Report_Revision(int report_id, int number, String textOperationalActivities, String textOperationalGuidance, String textVocationalTeaching, int hoursOperationalActivities, int hoursOperationalGuidance, int hoursVocationalTeaching, String comment) {
        this.report_id = report_id;
        this.number = number;
        this.textOperationalActivities = textOperationalActivities;
        this.textOperationalGuidance = textOperationalGuidance;
        this.textVocationalTeaching = textVocationalTeaching;
        this.hoursOperationalActivities = hoursOperationalActivities;
        this.hoursOperationalGuidance = hoursOperationalGuidance;
        this.hoursVocationalTeaching = hoursVocationalTeaching;
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

    public String getTextOperationalActivities() {
        return textOperationalActivities;
    }

    public void setTextOperationalActivities(String textOperationalActivities) {
        this.textOperationalActivities = textOperationalActivities;
    }

    public String getTextOperationalGuidance() {
        return textOperationalGuidance;
    }

    public void setTextOperationalGuidance(String textOperationalGuidance) {
        this.textOperationalGuidance = textOperationalGuidance;
    }

    public String getTextVocationalTeaching() {
        return textVocationalTeaching;
    }

    public void setTextVocationalTeaching(String textVocationalTeaching) {
        this.textVocationalTeaching = textVocationalTeaching;
    }

    public int getHoursOperationalActivities() {
        return hoursOperationalActivities;
    }

    public void setHoursOperationalActivities(int hoursOperationalActivities) {
        this.hoursOperationalActivities = hoursOperationalActivities;
    }

    public int getHoursOperationalGuidance() {
        return hoursOperationalGuidance;
    }

    public void setHoursOperationalGuidance(int hoursOperationalGuidance) {
        this.hoursOperationalGuidance = hoursOperationalGuidance;
    }

    public int getHoursVocationalTeaching() {
        return hoursVocationalTeaching;
    }

    public void setHoursVocationalTeaching(int hoursVocationalTeaching) {
        this.hoursVocationalTeaching = hoursVocationalTeaching;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
