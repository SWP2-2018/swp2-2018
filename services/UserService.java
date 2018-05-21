package services;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import tablePojos.User;

import java.util.List;

/**
 * Class UserService provides methods to communicate with the database regarding the Users.
 */
public class UserService implements AutoCloseable{

    public Session userSession ;

    public UserService() {
        userSession = new Configuration().configure().buildSessionFactory().openSession();
    }

    /**
     * Methods persists the provided user into the database.
     *
     * @param User user
     * @throws Exception
     * @return User
     */
    public User create(User user){
        Transaction tx = null;
        try {
            tx = userSession.beginTransaction();
            if (getByEmail(user.getEmail())!=null)
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
        User user = null;
        try {
            user = userSession.get(User.class, userId);
        } catch (Exception e){
            user = null;
            e.printStackTrace();
        }
        return user;
    }

    /**
     * Method provides a User object based on the provided user(name).
     *
     * @param String email
     * @throws Exception
     * @return User
     */
    public User getByEmail(String email){
        User user = null;
        try {
            String query = "FROM User where email= :email";
            user = (User)userSession.createQuery(query).setParameter("email",email).list().get(0);
        } catch (Exception e){
            user = null;
            e.printStackTrace();
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
        List<User> userListe = null;
        try {
            String query = "FROM User where instructor_id= :instructor_id";
            userListe = userSession.createQuery(query).setParameter("instructor_id",instructor_id).list();
        } catch (Exception e){
            userListe = null;
            e.printStackTrace();
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
        Transaction tx = null;
        User oldUser = null;
        try {
            tx = userSession.beginTransaction();
            oldUser = userSession.get(User.class, userId);
            if (oldUser!=null) {
                oldUser.setEmail(user.getEmail());
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
        }
        return oldUser;
    }

    @Override
    public void close() {
        if(userSession != null && userSession.isOpen()){
            userSession.close();
        }
    }
}



