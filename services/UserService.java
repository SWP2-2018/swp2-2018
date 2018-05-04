package services;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import tablePojos.User;

import java.util.List;

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

            if (getByUserName(user.getUser())!=null)
            {
                user = null;
            }
            else
            {
                userSession.save(user);
                tx.commit();
            }


        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            user = null;
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
            user = null;
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
            String query = "FROM User where user= :userName";
            user = (User)userSession.createQuery(query).setParameter("userName",userName).list().get(0);
        } catch (Exception e){
            user = null;
            e.printStackTrace();
        } finally {
            if(userSession != null && userSession.isOpen()){
                userSession.close();
            }
        }
        return user;
    }

    /**
     * Method provides a User List based on the provided instructor_id.
     *
     * @param int instructor_id
     * @throws Exception
     * @return List<User>
     */
    public List<User> getAllByInstructorId(int instructor_id){
        Session userSession = null;
        List<User> userListe = null;
        try {
            userSession = new Configuration().configure().buildSessionFactory().openSession();
            String query = "FROM User where instructor_id= :instructor_id";
            userListe = userSession.createQuery(query).setParameter("instructor_id",instructor_id).list();
        } catch (Exception e){
            userListe = null;
            e.printStackTrace();
        } finally {
            if(userSession != null && userSession.isOpen()){
                userSession.close();
            }
        }
        return userListe;
    }

    /**
     * Method updates an existing User based on the provided User object.
     *
     * @param int userId
     * @param User user
     * @throws Exception
     * @return User
     */
    public User update(User user, int userId ){
        Session userSession = new Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;
        User oldUser = null;

        try {
            tx = userSession.beginTransaction();
            oldUser = (User) userSession.get(User.class, userId);

            //oldUser.setUser(user.getUser());
            if (oldUser!=null) {
                oldUser.setPassword(user.getPassword());
                oldUser.setInstructor(user.getInstructor());
                oldUser.setLast_name(user.getLast_name());
                oldUser.setFirst_name(user.getFirst_name());
                oldUser.setJob(user.getJob());
                oldUser.setEducational_year(user.getEducational_year());
                oldUser.setStart_date(user.getStart_date());
                userSession.update(oldUser);
                tx.commit();
            }
            else
            {
                oldUser = null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            oldUser = null;
            e.printStackTrace();
        } finally {
            userSession.close();
        }

        return oldUser;
    }
}



