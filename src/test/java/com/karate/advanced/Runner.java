package com.karate.advanced;
import com.intuit.karate.junit5.Karate;

class Runner {
    @Karate.Test
    Karate resusable() {
        return Karate.run("code-reusability").relativeTo(getClass());
    }

}
