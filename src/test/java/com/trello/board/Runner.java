package com.trello.board;

import com.intuit.karate.junit5.Karate;

class Runner {
    @Karate.Test
    Karate createBoard() {
        return Karate.run("create-board").relativeTo(getClass());
    }
}
