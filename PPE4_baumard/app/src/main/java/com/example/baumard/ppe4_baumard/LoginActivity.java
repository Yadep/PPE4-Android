package com.example.baumard.ppe4_baumard;

import android.widget.EditText;

/**
 * Created by Yadeo on 11/03/2016.
 */
public class LoginActivity {


    public boolean validate() {
        boolean valid = true;

        String login = R.id.editLogin ;
        String password = editMDP.getText().toString();
        EditText editLogin = (EditText)findViewById(R.id.editLogin);

        if (login.isEmpty() || password.isEmpty()) {

            valid = false;
        }
        if (login = && password = ){

            valid = true;
        }



        return valid;
    }
}
