package services;

import org.hibernate.Session;
import tablePojos.Report;
import tablePojos.Report_Revision;
import tablePojos.User;

/**
 * Class ReportRevisionService provides methods to communicate with the database regarding the ReportRevisions.
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
    Session session = new Configuration().configure().buildSessionFactory().openSession();
    Transaction tx = null;

    try {
      tx = session.beginTransaction();
      session.get(Report.class, reportId); // Checks if report is in db.
      reportRevision.setReport_id(reportId);
      // TODO Set reportRevision.number
      session.save(reportRevision);
      tx.commit();
    } catch (HibernateException e) {
      if (tx!=null) tx.rollback();
      e.printStackTrace();
    } finally {
      session.close();
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
  public User getById(int reportRevisionId){
    Session session = null;
    Report_Revision reportRevision = null;
    try {
      session = new Configuration().configure().buildSessionFactory().openSession();
      reportRevision = (Report_Revision) session.get(Report_Revision.class, reportRevisionId);
    } catch (Exception e){
      e.printStackTrace();
    } finally {
      if(session != null && session.isOpen()){
        session.close();
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
    Session session = new Configuration().configure().buildSessionFactory().openSession();
    Transaction tx = null;

    try {
      tx = session.beginTransaction();
      Report_Revision oldReportRevsion = (Report_Revision) session.get(Report_Revision.class, reportRevisionId);

      oldReportRevsion.setText1(reportRevision.getText1());
      oldReportRevsion.setText2(reportRevision.getText2());
      oldReportRevsion.setText3(reportRevision.getText3());
      oldReportRevsion.setHours1(reportRevision.getHours1());
      oldReportRevsion.setHours2(reportRevision.getHours2());
      oldReportRevsion.setHours3(reportRevision.getHours3());
      oldReportRevsion.setHours3(reportRevision.getHours3());

      session.update(oldReportRevsion);
      tx.commit();
    } catch (HibernateException e) {
      if (tx!=null) tx.rollback();
      e.printStackTrace();
    } finally {
      session.close();
    }

    return oldReportRevsion;
  }

  public getAllByReport(int reportId){
    // TODO implement
  }
}








