package services;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import tablePojos.User;

public class EmailService {

    private Properties props;
    private Session session;
    private Message msg;

    public EmailService() {
        this.props = new Properties();
        this.props.setProperty("mail.smtp.host", "mail.hft-stuttgart.de");
        this.session = Session.getDefaultInstance(props);
        this.msg = new MimeMessage(session);
    }


    public void sendMail(User user, String betreff, String text) {
        try {
            InternetAddress addressTo = new InternetAddress(user.getEmail());
            msg.setRecipient(Message.RecipientType.TO, addressTo);
            msg.setSubject(betreff);
            msg.setContent(text, "text/plain");
            Transport.send(msg);

        } catch (MessagingException m) {

            System.out.println("Senden fehlgeschlagen");
        }
    }
}
