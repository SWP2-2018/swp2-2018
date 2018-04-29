package services;

import org.hibernate.Session;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import tablePojos.Report;
import tablePojos.Report_Revision;

/**
 * Class ReportRevisionService.java provides methods to communicate with the database regarding the ReportRevisions.
 */
public class ReportRevisionService {

  /**
   * Methods persists the provided reportRevision into the database.
   *
   * @param ReportRevision reportRevision
   * @param int reportId
   * @throws Exception
   * @return ReportRevision
   */
  public Report_Revision create(Report_Revision reportRevision, int reportId){
    Session userSession = new Configuration().configure().buildSessionFactory().openSession();
    Transaction tx = null;

    try {
      tx = userSession.beginTransaction();
      userSession.get(Report.class, reportId); // Checks if report is in db.
      reportRevision.setReport_id(reportId);
      // TODO Set reportRevision.number
      userSession.save(reportRevision);
      tx.commit();
    } catch (HibernateException e) {
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
   * @throws Exception
   * @return ReportRevision
   */
  public Report_Revision getById(int reportRevisionId){
    Session userSession = null;
    Report_Revision reportRevision = null;
    try {
      userSession = new Configuration().configure().buildSessionFactory().openSession();
      reportRevision = (Report_Revision) userSession.get(Report_Revision.class, reportRevisionId);
    } catch (Exception e){
      e.printStackTrace();
    } finally {
      if(userSession != null && userSession.isOpen()){
        userSession.close();
      }
    }
    return reportRevision;
  }


  /**
   * Method updates an existing ReportRevision based on the provided ReportRevision object.
   *
   * @param int reportRevisionId
   * @param Report_Revision reportRevision
   * @throws Exception
   * @return Report_Revision
   */
  public Report_Revision update(int reportRevisionId, Report_Revision reportRevision){
    Session userSession = new Configuration().configure().buildSessionFactory().openSession();
    Transaction tx = null;
      Report_Revision oldReportRevsion  = null;

    try {
      tx = userSession.beginTransaction();
      oldReportRevsion = (Report_Revision) userSession.get(Report_Revision.class, reportRevisionId);

      oldReportRevsion.setText1(reportRevision.getText1());
      oldReportRevsion.setText2(reportRevision.getText2());
      oldReportRevsion.setText3(reportRevision.getText3());
      oldReportRevsion.setHours1(reportRevision.getHours1());
      oldReportRevsion.setHours2(reportRevision.getHours2());
      oldReportRevsion.setHours3(reportRevision.getHours3());
      oldReportRevsion.setHours3(reportRevision.getHours3());

      userSession.update(oldReportRevsion);
      tx.commit();
    } catch (HibernateException e) {
      if (tx!=null) tx.rollback();
      e.printStackTrace();
    } finally {
      userSession.close();
    }

    return oldReportRevsion;
  }

  public void getAllByReport(int reportId){
    // TODO implement
  }
}
 







