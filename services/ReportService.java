package services;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import tablePojos.Report;
import tablePojos.User;

import java.util.List;

/**
 * Class ReportService provides methods to communicate with the database regarding the Reports.
 */
public class ReportService implements AutoCloseable {

    public Session userSession;

    public ReportService() {
        userSession = new Configuration().configure().buildSessionFactory().openSession();
    }

    /**
     * Methods persists the provided report into the database.
     *
     * @param Report report
     * @param int userId
     * @throws Exception
     * @return User
     */
    public Report create(Report report, int userId){
        Transaction tx = null;

        try {
            tx = userSession.beginTransaction();
            if (userSession.get(User.class, userId) != null) // Checks if user is in db.
            {
                report.setUser_id(userId);
                userSession.save(report);
                tx.commit();
            }
            else
            {
                report = null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            report = null;
            e.printStackTrace();
        }
        return report;
    }

    /**
     * Method provides a Report object based on the provided reportId.
     *
     * @param int reportId
     * @throws Exception
     * @return Report
     */
    public Report getById(int reportId){
        Report report = null;
        try {
            report = (Report) userSession.get(Report.class, reportId);
        } catch (Exception e){
            report = null;
            e.printStackTrace();
        }
        return report;
    }

    /**
     * Method provides a Report List based on the provided user_id.
     *
     * @param int user_id
     * @throws Exception
     * @return List<Report>
     */
    public List<Report> getAllByUserId(int user_id){
        List<Report> reportListe = null;
        try {
            String query = "FROM Report where user_id= :user_id order by id desc";
            reportListe = userSession.createQuery(query).setParameter("user_id",user_id).list();
        } catch (Exception e){
            reportListe = null;
            e.printStackTrace();
        }
        return reportListe;
    }

    /**
     * Method provides a Report List based on the provided status.
     *
     * @param int status
     * @throws Exception
     * @return List<Report>
     */
    public List<Report> getAllByStatus(int status){
        List<Report> reportListe = null;
        try {
            String query = "FROM Report where status= :status order by id desc";
            reportListe = userSession.createQuery(query).setParameter("status",status).list();
        } catch (Exception e){
            reportListe = null;
            e.printStackTrace();
        }
        return reportListe;
    }

    /**
     * Method provides a Report List based on the provided status AND user_id.
     *
     * @param int status
     * @param int user_id
     * @throws Exception
     * @return List<Report>
     */
    public List<Report> getAllByStatusAndUserID(int status,int user_id){
        List<Report> reportListe = null;
        try {
            String query = "FROM Report where status= :status and user_id= :user_id order by id";
            reportListe = userSession.createQuery(query).setParameter("status",status).setParameter("user_id",user_id).list();
        } catch (Exception e){
            reportListe = null;
            e.printStackTrace();
        }
        return reportListe;
    }

    /**
     * Method updates an existing Report based on the provided Report object.
     *
     * @param int reportId
     * @param Report report
     * @throws Exception
     * @return Report
     */
    public Report update(Report report, int reportId){
        Transaction tx = null;
        Report oldReport = null;

        try {
            tx = userSession.beginTransaction();

            oldReport = userSession.get(Report.class, reportId);
            if (oldReport!=null)
            {
                oldReport.setDate(report.getDate());
                oldReport.setStatus(report.getStatus());
                userSession.update(oldReport);
                tx.commit();
            }
            else
            {
                oldReport = null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            oldReport = null;
            e.printStackTrace();
        }
        return oldReport;
    }

    @Override
    public void close() throws Exception {
        if(userSession != null && userSession.isOpen()){
            userSession.close();
        }
    }
}








