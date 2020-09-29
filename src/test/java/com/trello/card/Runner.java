package com.trello.card;

import com.intuit.karate.junit5.Karate;

class Runner {
    @Karate.Test
    Karate addCardToBoard() {
        return Karate.run("add-card").relativeTo(getClass());
    }
}
