// Edit to suit your needs.
var ADAPT_CONFIG = {
    // Where is your CSS?
    path: '/s/css/',
    // false = Only run one time, when page first loads.
    // true = Change for window resize or page tilt too.
    dynamic: true,
    // First range entry is the minimum.
    // Last range entry is the maximum.
    // Should have at least one "to" range.
    range: ['320px            = 320.css', 
            '320px to 640px   = 320.css', 
            '640px to 1008px  = 640.css', 
            '1008px           = 1024.css']
};
// The crux of the functionality.
(function(w, d, config, undefined) {
    // If no config, exit.
    if (!config) {
        return;
    }
    // Alias config values.
    var path = config.path;
    var dynamic = config.dynamic;
    var range = config.range;
    var range_len = range.length;
    // Empty vars to be used later.
    var tag, url;
    // Use faster document.head if possible.
    var head = d.head || d.getElementsByTagName('head')[0];
    // Create empty link tag:
    // <link rel="stylesheet" id="ADAPT_CSS" />
    var css = d.createElement('link');
    css.rel = 'stylesheet';
    css.id = 'ADAPT_CSS';
    // Adapt to width.

    function adapt() {
        // Parse browser width.
        var x = w.innerWidth || d.documentElement.clientWidth || d.body.clientWidth || 0;
        // Loop variables.
        var arr, arr_0, val_1, val_2, is_range, file;
        for (var i = 0, ii = range_len; i < ii; i++) {
            arr = range[i].split('=');
            arr_0 = arr[0];
            is_range = !! arr_0.match('to');
            val_1 = is_range ? parseInt(arr_0.split('to')[0], 10) : parseInt(arr_0, 10);
            val_2 = is_range ? parseInt(arr_0.split('to')[1], 10) : undefined;
            file = arr[1].replace(/\s/g, '');
            if (i === 0 && x <= val_1) {
                url = path + file;
            } else if (x > val_1 && x <= val_2) {
                url = path + file;
            } else if (i === range_len - 1 && x > val_1) {
                url = path + file;
            }
        }
        // Was the tag created yet?
        if ( !! tag && tag.href !== url) {
            // If so, just set the path.
            tag.href = url;
        } else {
            // If not, set path and append to DOM.
            css.href = url;
            head.appendChild(css);
            tag = d.getElementById('ADAPT_CSS');
        }
    }
    // Fire off once.
    adapt();
    if (dynamic) {
        // Event listeners for window
        // resize and phone rotation.
        if (w.addEventListener) {
            // Good browsers.
            w.addEventListener('resize', adapt, false);
            w.addEventListener('orientationchange', adapt, false);
        } else if (w.attachEvent) {
            // Legacy IE versions.
            w.attachEvent('onresize', adapt);
            w.attachEvent('onorientationchange', adapt);
        } else {
            // Old-school fallback.
            w.onresize = adapt;
            w.onorientationchange = adapt;
        }
    }
    // Pass in window, document.
})(this, this.document, ADAPT_CONFIG);
