package services;

import org.hibernate.Session;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import tablePojos.Report;
import tablePojos.Report_Revision;

import java.util.List;

/**
 * Class ReportRevisionService.java provides methods to communicate with the database regarding the ReportRevisions.
 */
public class ReportRevisionService {

    /**
     * Methods persists the provided reportRevision into the database.
     *
     * @param ReportRevision reportRevision
     * @param int            reportId
     * @return ReportRevision
     * @throws Exception
     */
    public Report_Revision create(Report_Revision reportRevision, int reportId) {

        Session userSession = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = userSession.beginTransaction();
            if (userSession.get(Report.class, reportId) != null) {
                String query = "FROM Report_Revision where report_id= :report_id order by number desc";
                List<Report_Revision> rrL = userSession.createQuery(query).setParameter("report_id", reportId).list();

                if (rrL.size() > 0) { // Pruefe ob min. 1 Revision vorhanden ist
                    reportRevision.setNumber(rrL.get(0).getNumber() + 1);
                } else // Keine Revision vorhanden
                {
                    reportRevision.setNumber(0);
                }
                userSession.save(reportRevision);
                tx.commit();
                userSession.close();

            } else { // Kein Report Eintrag gefunden
                reportRevision = null;
            }
        }
        catch (HibernateException e){
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            userSession.close();
        }

        return reportRevision;

    }

    /**
     * Method provides a ReportRevision object based on the provided reportRevisionId.
     *
     * @param int reportRevisionId
     * @return ReportRevision
     * @throws Exception
     */
    public Report_Revision getById(int reportRevisionId) {
        Session userSession = null;
        Report_Revision reportRevision = null;
        try {
            userSession = new Configuration().configure().buildSessionFactory().openSession();
            reportRevision = (Report_Revision) userSession.get(Report_Revision.class, reportRevisionId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (userSession != null && userSession.isOpen()) {
                userSession.close();
            }
        }
        return reportRevision;
    }


    /**
     * Method provides a ReportRevision List based on the provided reportRevisionReportId.
     *
     * @param int reportRevisionReportId
     * @return List<ReportRevision>
     * @throws Exception
     */

    public List<Report_Revision> getAllByReportId(int reportRevisionReportId) {
        Session userSession = null;
        List<Report_Revision> reportListe = null;
        try {
            userSession = new Configuration().configure().buildSessionFactory().openSession();
            String query = "FROM Report_Revision where report_id= :reportRevisionReportId";
            reportListe = userSession.createQuery(query).setParameter("reportRevisionReportId", reportRevisionReportId).list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (userSession != null && userSession.isOpen()) {
                userSession.close();
            }
        }
        return reportListe;
    }


    /**
     * Method updates an existing ReportRevision based on the provided ReportRevision object.
     *
     * @param int             reportRevisionId
     * @param Report_Revision reportRevision
     * @return Report_Revision
     * @throws Exception
     */
    public Report_Revision update(Report_Revision reportRevision, int reportRevisionId) {
        Session userSession = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;
        Report_Revision oldReportRevsion = null;

        try {
            tx = userSession.beginTransaction();
            oldReportRevsion = userSession.get(Report_Revision.class, reportRevisionId);

            oldReportRevsion.setText1(reportRevision.getText1());
            oldReportRevsion.setText2(reportRevision.getText2());
            oldReportRevsion.setText3(reportRevision.getText3());
            oldReportRevsion.setHours1(reportRevision.getHours1());
            oldReportRevsion.setHours2(reportRevision.getHours2());
            oldReportRevsion.setHours3(reportRevision.getHours3());

            userSession.update(oldReportRevsion);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            userSession.close();
        }

        return oldReportRevsion;
    }

}
 







