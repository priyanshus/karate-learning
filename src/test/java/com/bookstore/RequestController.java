package com.bookstore;

import java.util.Base64;
import java.util.Base64.Decoder;

public class RequestController {
    public String decode(String request) {
        String decoded = "";

        try {
            Decoder decoder = Base64.getDecoder();
            decoded = new String(decoder.decode(request));
        }catch(IllegalArgumentException iae) {
            decoded = "not a valid request body";
        }

        return decoded;
    }
}
