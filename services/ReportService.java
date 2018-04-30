package services;

import org.hibernate.Session;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import tablePojos.Report;
import tablePojos.User;

import java.util.List;

/**
 * Class ReportService provides methods to communicate with the database regarding the Reports.
 */
public class ReportService {

    /**
     * Methods persists the provided report into the database.
     *
     * @param Report report
     * @param int userId
     * @throws Exception
     * @return User
     */
    public Report create(Report report, int userId){
        Session userSession = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = userSession.beginTransaction();
            if (userSession.get(User.class, userId) != null) // Checks if user is in db.
            {
                report.setUser_id(userId);
                userSession.save(report);
                tx.commit();
            }
            else report = null;

        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            userSession.close();
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
        Session userSession = null;
        Report report = null;
        try {
            userSession = new Configuration().configure().buildSessionFactory().openSession();
            report = (Report) userSession.get(Report.class, reportId);
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if(userSession != null && userSession.isOpen()){
                userSession.close();
            }
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
        Session userSession = null;
        List<Report> reportListe = null;
        try {
            userSession = new Configuration().configure().buildSessionFactory().openSession();
            String query = "FROM Report where user_id= :user_id";
            reportListe = userSession.createQuery(query).setParameter("user_id",user_id).list();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if(userSession != null && userSession.isOpen()){
                userSession.close();
            }
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
        Session userSession = null;
        List<Report> reportListe = null;
        try {
            userSession = new Configuration().configure().buildSessionFactory().openSession();
            String query = "FROM Report where status= :status";
            reportListe = userSession.createQuery(query).setParameter("status",status).list();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if(userSession != null && userSession.isOpen()){
                userSession.close();
            }
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
        Session userSession = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;
        Report oldReport = null;

        try {
            tx = userSession.beginTransaction();
            oldReport = userSession.get(Report.class, reportId);

            oldReport.setDate(report.getDate());
            oldReport.setStatus(report.getStatus());

            userSession.update(oldReport);
            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            userSession.close();
        }

        return report;
    }

}








