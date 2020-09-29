package com.reqres.user;

import com.intuit.karate.junit5.Karate;
import com.reqres.TestBase;

class Runner extends TestBase {
    @Karate.Test
    Karate getUser() {
        return Karate.run("get-user").relativeTo(getClass());
    }

    @Karate.Test
    Karate createUser() {
        return Karate.run("create-user").relativeTo(getClass());
    }
}
