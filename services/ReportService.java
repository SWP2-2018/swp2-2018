package services;

import org.hibernate.Session;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import tablePojos.Report;
import tablePojos.User;

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
            userSession.get(User.class, userId); // Checks if user is in db.
            report.setUser_id(userId);
            userSession.save(report);
            tx.commit();
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
     * Method provides a Report object based on the provided user_id.
     *
     * @param int user_id
     * @throws Exception
     * @return Report
     */
    public Report getByUserId(int user_id){
        Session userSession = null;
        Report report = null;
        try {
            userSession = new Configuration().configure().buildSessionFactory().openSession();
            String query = "FROM Report where user_id= :user_id";
            report = (Report)userSession.createQuery(query).setParameter("user_id",user_id).list().get(0);
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
     * Method updates an existing Report based on the provided Report object.
     *
     * @param int reportId
     * @param Report report
     * @throws Exception
     * @return Report
     */
    public Report update(int reportId, Report report){
        Session userSession = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;
        Report oldReport = null;

        try {
            tx = userSession.beginTransaction();
            oldReport = (Report) userSession.get(Report.class, reportId);

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

        return oldReport;
    }


    public void getAllByUser(int userId){
        // TODO implement
    }
}








