package com.reqres.login;

import com.intuit.karate.junit5.Karate;
import com.reqres.TestBase;

class Runner extends TestBase {
    @Karate.Test
    Karate login() {
        return Karate.run("login").relativeTo(getClass());
    }

}
