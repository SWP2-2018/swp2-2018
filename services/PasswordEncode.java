package services;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncode{
    public static String encode(String password){
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }
    public static boolean match(String inputPassword, String userPassword){
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        if(encoder.matches(inputPassword, userPassword)){
            return true;
        }
        return false;
    }

}
