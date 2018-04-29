package services;

import org.hibernate.Session;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
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
        Session userSession = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = userSession.beginTransaction();
            userSession.save(user);
            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            userSession.close();
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
        Session userSession = null;
        User user = null;
        try {
            userSession = new Configuration().configure().buildSessionFactory().openSession();
            user = (User) userSession.get(User.class, userId);
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if(userSession != null && userSession.isOpen()){
                userSession.close();
            }
        }
        return user;
    }
    /**
     * Method provides a User object based on the provided user(name).
     *
     * @param String userName
     * @throws Exception
     * @return User
     */
    public User getByUserName(String userName){
        Session userSession = null;
        User user = null;
        try {
            userSession = new Configuration().configure().buildSessionFactory().openSession();
            String query = String.format("FROM User where user='%s'",userName);
            user = (User)userSession.createQuery(query).list().get(0);

        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if(userSession != null && userSession.isOpen()){
                userSession.close();
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
        Session userSession = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;
        User oldUser = null;

        try {
            tx = userSession.beginTransaction();
            oldUser = (User) userSession.get(User.class, userId);

            oldUser.setUser(user.getUser());
            oldUser.setPassword(user.getPassword());
            oldUser.setInstructor(user.getInstructor());
            oldUser.setLast_name(user.getLast_name());
            oldUser.setFirst_name(user.getFirst_name());
            oldUser.setJob(user.getJob());
            oldUser.setEducational_year(user.getEducational_year());
            oldUser.setStart_date(user.getStart_date());

            userSession.update(oldUser);
            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            userSession.close();
        }

        return oldUser;
    }
}


