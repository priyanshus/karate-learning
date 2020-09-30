function fn() {
    var config = {
        url: 'https://reqres.in/api',
        trelloUrl: 'https://api.trello.com/1/',
        appKey: karate.properties['app.key'] || 'e31eb538579208149b244d84ef354fd2',
        appToken: karate.properties['app.token'] || 'ea8853653956c97eabb5ef6838319732e7bfc2184ee23ee009699f4593d66c57'
    };

    karate.configure('logPrettyResponse', true);
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    return config;
}