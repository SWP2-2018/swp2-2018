package tablePojos;

import java.util.Date;

public class User {

    private int id;
    private String user;
    private String password;
    private byte instructor;
    private String last_name;
    private String first_name;
    private String job;
    private int educational_year;
    private int instructor_id;
    private Date start_date;

    public User() {
    }

    public User(String user, String password, byte instructor, String last_name, String first_name, String job, int educational_year, int instructor_id, Date start_date) {
        this.user = user;
        this.password = password;
        this.instructor = instructor;
        this.last_name = last_name;
        this.first_name = first_name;
        this.job = job;
        this.educational_year = educational_year;
        this.instructor_id = instructor_id;
        this.start_date = start_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {

        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public byte getInstructor() {
        return instructor;
    }

    public void setInstructor(byte instructor) {
        this.instructor = instructor;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public int getEducational_year() {
        return educational_year;
    }

    public void setEducational_year(int educational_year) {
        this.educational_year = educational_year;
    }

    public int getInstructor_id() {
        return instructor_id;
    }

    public void setInstructor_id(int instructor_id) {
        this.instructor_id = instructor_id;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }
}
