package services;

import org.hibernate.Session;
import tablePojos.User;

/**
 * Class UserService provides methods to communicate with the database regarding the Users.
 */
public class UserService {

    /**
     * Methods persists the provided user into the database.
     *
     * @param User user
     * @throws Exception
     * @return User
     */
    public User create(User user){
        Session session = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(user);
            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }

    /**
     * Method provides a User object based on the provided userId.
     *
     * @param int userId
     * @throws Exception
     * @return User
     */
    public User getById(int userId){
        Session session = null;
        User user = null;
        try {
            session = new Configuration().configure().buildSessionFactory().openSession();
            user = (User) session.get(User.class, userId);
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if(session != null && session.isOpen()){
                session.close();
            }
        }
        return user;
    }


    /**
     * Method updates an existing User based on the provided User object.
     *
     * @param int userId
     * @param User user
     * @throws Exception
     * @return User
     */
    public User update(int userId, User user ){
        Session session = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            User oldUser = (User) session.get(User.class, userId);

            oldUser.setUser(user.getUser());
            oldUser.setPassword(user.getPassword());
            oldUser.setInstructor(user.getInstructor());
            oldUser.setLast_name(user.getLast_name());
            oldUser.setFirst_name(user.getFirst_name());
            oldUser.setJob(user.getJob());
            oldUser.setEducational_year(user.getEducational_year());
            oldUser.setStart_date(user.getStart_date());

            session.update(oldUser);
            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

        return oldUser;
    }
}



