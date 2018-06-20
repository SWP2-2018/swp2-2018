package services;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import tablePojos.User;

import java.util.List;

public class DatabaseService implements AutoCloseable {

    public static Session db = null;

    public static Session getInstance() {
        if(this.db == null) {
            this.db = new Configuration().configure().buildSessionFactory().openSession();
        }
        return this.db;

    }
}
