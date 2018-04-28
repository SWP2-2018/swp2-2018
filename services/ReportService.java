package services;

import org.hibernate.Session;
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
        Session session = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.get(User.class, userId); // Checks if user is in db.
            report.setUser_id(userId);
            session.save(report);
            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
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
        Session session = null;
        Report report = null;
        try {
            session = new Configuration().configure().buildSessionFactory().openSession();
            report = (Report) session.get(Report.class, reportId);
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
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
        Session session = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Report oldReport = (Report) session.get(Report.class, reportId);

            oldReport.setDate(report.getDate());
            oldReport.setStatus(report.getStatus());

            session.update(oldReport);
            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

        return oldReport;
    }


    public getAllByUser(int userId){
        // TODO implement
    }
}








