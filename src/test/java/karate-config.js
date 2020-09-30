function fn() {
    var config = {
        url: 'https://reqres.in/api',
        trelloUrl: 'https://api.trello.com/1/',
        appKey: karate.properties['app.key'] || 'foo',
        appToken: karate.properties['app.token'] || 'bar'
    };

    karate.configure('logPrettyResponse', true);
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    return config;
}
