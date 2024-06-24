
function popUp() {
    var d = 'glizauvo.net';
    var z = 7563454;
    var s = document.createElement('script');
    s.src = 'https://' + d + '/401/' + z;
    try {
        (document.body || document.documentElement).appendChild(s);
    } catch (e) {}
}

function topUp() {
    var d = 'belickitungchan.com';
    var z = 7563449;
    var s = document.createElement('script');
    s.src = 'https://' + d + '/400/' + z;
    try {
        (document.body || document.documentElement).appendChild(s);
    } catch (e) {}
}

function fullScreen() {
    var script = document.createElement('script');
    script.async = true;
    script.dataCfasync = false;
    script.src = '//thubanoa.com/1?z=7563453';
    document.body.appendChild(script);
}

function adsgram() {
    AdController.show().then((result: ShowPromiseResult) => {
    // user watch ad till the end
    // your code to reward user
}).catch((result: ShowPromiseResult) => {
    // user skipped video or get error during playing ad
    // do nothing or whatever you want
})
}