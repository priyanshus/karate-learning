package com.bookstore;

import com.intuit.karate.FileUtils;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.netty.FeatureServer;
import org.junit.jupiter.api.BeforeAll;

import java.io.File;

class Runner {
    private static FeatureServer server;

    @BeforeAll
    static void startServer() {
        File file = FileUtils.getFileRelativeTo(Runner.class, "proxy-bookstore.feature");
        server = FeatureServer.start(file, 8080, false, null);
        System.setProperty("karate.server.port", 8080 + "");
    }

    @Karate.Test
    Karate bookstore() {
        return Karate.run("bookstore").relativeTo(getClass());
    }

}