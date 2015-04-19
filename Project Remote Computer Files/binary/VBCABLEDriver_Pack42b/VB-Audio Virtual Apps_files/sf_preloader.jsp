(function(){








if( window == top ){
    
	if(visualwww.b.WSFlow){
		visualwww.b.WSFlow.addStep("in sf_preloader");
	}
    window.onerror = function(errorMessage, fileName, line)
    {
        var reportData = {action: 'js_error'};
        var reportQueryString = [];
        var request;

        try
        {
        	var pluginDomain = 'https://www.superfish.com/ws/';

			if(visualwww.b.getRealDomain){
				pluginDomain = visualwww.b.getRealDomain(pluginDomain);
			}

        	if (fileName.indexOf(pluginDomain.split('/')[2]) > -1 && Math.floor(Math.random() * 9999) == 1)
            {
                reportData.dscr = encodeURIComponent(fileName+' (line: '+line+'): '+errorMessage);

                if (spsupport && spsupport.p)
                {
                    reportData.userid = spsupport.p.userid;
                    reportData.sessionid = spsupport.p.initialSess;
                }

                if (visualwww.utilities && visualwww.utilities.abTestUtil)
                {
                    reportData = visualwww.utilities.abTestUtil.addDataToObject(reportData);
                }

                for (var key in reportData)
                {
                    reportData.hasOwnProperty(key) && reportQueryString.push(key+'='+reportData[key]);
                }

                request = new Image();
                request.src = pluginDomain + 'trackSession.action?' + reportQueryString.join('&');
            }
        }
        catch(e){}
    };

        (function () {
        (function (a, b, c) {
            function d(a) {
                return "[object Function]" == o.call(a)
            }

            function e(a) {
                return "string" == typeof a
            }

            function f() {}

            function g(a) {
                return !a || "loaded" == a || "complete" == a || "uninitialized" == a
            }

            function h() {
                var a = p.shift();
                q = 1, a ? a.t ? m(function () {
                    ("c" == a.t ? B.injectCss : B.injectJs)(a.s, 0, a.a, a.x, a.e, 1)
                }, 0) : (a(), h()) : q = 0
            }

            function i(a, c, d, e, f, i, j) {
                function k(b) {
                    if (!o && g(l.readyState) && (u.r = o = 1, !q && h(), l.onload = l.onreadystatechange = null, b)) {
                        "img" != a && m(function () {
                            t.removeChild(l)
                        }, 50);
                        for (var d in y[c]) y[c].hasOwnProperty(d) && y[c][d].onload()
                    }
                }
                var j = j || B.errorTimeout,
                    l = b.createElement(a),
                    o = 0,
                    r = 0,
                    u = {
                        t: d,
                        s: c,
                        e: f,
                        a: i,
                        x: j
                    };
                    
                 //1 === y[c] && (r = 1, y[c] = []);
                 if (1 === y[c]) {
                     r = 1; 
                     y[c] = [];
                 }
                if ("object" == a) {
                   l.data = c; 
                }
                else {
                    l.src = c; 
                    l.type = a;
                }
               // "object" == a ? l.data = c : (l.src = c, l.type = a); 
                l.width = l.height = "0";
                l.onerror = l.onload = l.onreadystatechange = function () {
                    k.call(this, r)
                };
                p.splice(e, 0, u);
                if ("img" != a) {
                    if (r || 2 === y[c]) {  
                        var parent, oldNode;
                        if (s) {
                            oldNode = null;
                            parent = document.getElementsByTagName("head")[0];
                        }
                        else {
                            if (n) {
                                oldNode = n;
                                parent = n.parentNode;
                            }
                            else {
                                oldNode = null;
                                parent = document.getElementsByTagName("head")[0];
                            }
                        }
                        
                        parent.insertBefore(l, oldNode);
                        //t.insertBefore(l, (s ? null : n));
                        m(k, j); 
                    }
                    else {
                        y[c].push(l)                    
                    }
                }
//                "img" != a && 
//                    (r || 2 === y[c] ? 
//                    (t.insertBefore(l, s ? null : n), 
//                    m(k, j)) : 
//                        y[c].push(l))
            }

            function j(a, b, c, d, f) {
                return q = 0, b = b || "j", e(a) ? i("c" == b ? v : u, a, b, this.i++, c, d, f) : (p.splice(this.i++, 0, a), 1 == p.length && h()), this
            }

            function k() {
                var a = B;
                return a.loader = {
                    load: j,
                    i: 0
                }, a
            }
            var l = b.documentElement,
                m = a.setTimeout,
                n = b.getElementsByTagName("script")[0],
                o = {}.toString,
                p = [],
                q = 0,
                r = "MozAppearance" in l.style,
                s = r && !! b.createRange().compareNode,
                t = s ? l : n.parentNode,
                l = a.opera && "[object Opera]" == o.call(a.opera),
                l = !! b.attachEvent && !l,
                u = r ? "object" : l ? "script" : "img",
                v = l ? "script" : u,
                w = Array.isArray || function (a) {
                    return "[object Array]" == o.call(a)
                }, x = [],
                y = {}, z = {
                    timeout: function (a, b) {
                        return b.length && (a.timeout = b[0]), a
                    }
                }, A, B;
            B = function (a) {
                function b(a) {
                    var a = a.split("!"),
                        b = x.length,
                        c = a.pop(),
                        d = a.length,
                        c = {
                            url: c,
                            origUrl: c,
                            prefixes: a
                        }, e, f, g;
                    for (f = 0; f < d; f++) g = a[f].split("="), (e = z[g.shift()]) && (c = e(c, g));
                    for (f = 0; f < b; f++) c = x[f](c);
                    return c
                }

                function g(a, e, f, g, h) {
                    var i = b(a),
                        j = i.autoCallback;
                    i.url.split(".").pop().split("?").shift(), i.bypass || (e && (e = d(e) ? e : e[a] || e[g] || e[a.split("/").pop().split("?")[0]]), i.instead ? i.instead(a, e, f, g, h) : (y[i.url] ? i.noexec = !0 : y[i.url] = 1, f.load(i.url, i.forceCSS || !i.forceJS && "css" == i.url.split(".").pop().split("?").shift() ? "c" : c, i.noexec, i.attrs, i.timeout), (d(e) || d(j)) && f.load(function () {
                        k(), e && e(i.origUrl, h, g), j && j(i.origUrl, h, g), y[i.url] = 2
                    })))
                }

                function h(a, b) {
                    function c(a, c) {
                        if (a) {
                            if (e(a)) c || (j = function () {
                                var a = [].slice.call(arguments);
                                k.apply(this, a), l()
                            }), g(a, j, b, 0, h);
                            else if (Object(a) === a)
                                for (n in m = function () {
                                    var b = 0,
                                        c;
                                    for (c in a) a.hasOwnProperty(c) && b++;
                                    return b
                                }(), a) a.hasOwnProperty(n) && (!c && !--m && (d(j) ? j = function () {
                                    var a = [].slice.call(arguments);
                                    k.apply(this, a), l()
                                } : j[n] = function (a) {
                                    return function () {
                                        var b = [].slice.call(arguments);
                                        a && a.apply(this, b), l()
                                    }
                                }(k[n])), g(a[n], j, b, n, h))
                        } else !c && l()
                    }
                    var h = !! a.test,
                        i = a.load || a.both,
                        j = a.callback || f,
                        k = j,
                        l = a.complete || f,
                        m, n;
                    c(h ? a.yep : a.nope, !! i), i && c(i)
                }
                var i, j, l = this.yepnope.loader;
                if (e(a)) g(a, 0, l, 0);
                else if (w(a))
                    for (i = 0; i < a.length; i++) j = a[i], e(j) ? g(j, 0, l, 0) : w(j) ? B(j) : Object(j) === j && h(j, l);
                else Object(a) === a && h(a, l)
            }, B.addPrefix = function (a, b) {
                z[a] = b
            }, B.addFilter = function (a) {
                x.push(a)
            }, B.errorTimeout = 1e4, null == b.readyState && b.addEventListener && (b.readyState = "loading", b.addEventListener("DOMContentLoaded", A = function () {
                b.removeEventListener("DOMContentLoaded", A, 0), b.readyState = "complete"
            }, 0)), a.yepnope = k(), a.yepnope.executeStack = h, a.yepnope.injectJs = function (a, c, d, e, i, j) {
                var k = b.createElement("script"),
                    l, o, e = e || B.errorTimeout;
                k.src = a;
                for (o in d) k.setAttribute(o, d[o]);
                c = j ? h : c || f, k.onreadystatechange = k.onload = function () {
                    !l && g(k.readyState) && (l = 1, c(), k.onload = k.onreadystatechange = null)
                }, m(function () {
                    l || (l = 1, c(1))
                }, e), i ? k.onload() : n.parentNode.insertBefore(k, n)
            }, a.yepnope.injectCss = function (a, c, d, e, g, i) {
                var e = b.createElement("link"),
                    j, c = i ? h : c || f;
                e.href = a, e.rel = "stylesheet", e.type = "text/css";
                for (j in d) e.setAttribute(j, d[j]);
                g || (n.parentNode.insertBefore(e, n), m(c, 0))
            }
        })(this, document),

    sfjq={
        originalJq:window.jQuery,
        jq:null,        
        load:function(a){
          //  window.console.log("load1 " + (this.jq ? this.jq.fn.jquery : this.jq) + "   orig: " + this.originalJq.fn.jquery);
            var b = this;
          //  window.console.log("a.url = " + a.url);
            this.url = a.url || "https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js";
            this.callback = a.callback || !1;
            try {
                yepnope([{
                    load: b.url,
                    callback: function () {
                      //  window.console.log("callback ");
                        (function (a) {
                            b.jq = jQuery.noConflict(!0),
	                        //b.jq = window.module.exports,
                            window.jQuery = b.originalJq,
                            sfjq.jq.expr[":"].regex = function (a, b, c) {
                                var d = c[3].split(","),
                                e = /^(data|css):/,
                                f = {
                                    method: d[0].match(e) ? d[0].split(":")[0] : "attr",
                                    property: d.shift().replace(e, "")
                                }, g = "ig",
                                h = new RegExp(d.join("").replace(/^\s+|\s+$/g, ""), g);
                                return h.test(sfjq.jq(a)[f.method](f.property))
                            }, b.callback && b.callback.call(window)
                        })(jQuery)
                    }
                }]);
            }
            catch(ex) {
//                window.console.log("catch " + ex);
                    visualwww.b.inj(window.document, this.url,
                        1,
                        (function(jq){
                            if (!spsupport.p.jJqcb) {
                                spsupport.p.jJqcb = 1;
                                spsupport.p.$ = jq;
                                window.jQuery = sfjq.originalJq,
                                spsupport.api.jQLoaded();
                            }                        
                        })(jQuery));
            }
    }
},window.sfjq=sfjq})()
        visualwww.utilities = {
    blacklistHandler: blacklistHandler = function()
    {
        
        var WSblacklist = "|thesmartsearch.net|findreek.com|superfish.com|home.superfish.com|stg.likethatapps.com|similarproducts.net|ltd.instapage.com|shopathome.com|likethatapps.com|cars.com|newcars.com|auto.com|pickuptrucks.com|pinkvelvetpass.com|pornhub.com|web.de|blinkx.com|start.toshiba.com|revouninstaller.com|shush.se|huffingtonpost.com|zoom.com|widdit.com|nation.com|zoo.com|dogpile.com|searchcompletion.com|certified-toolbar.com|autocompletepro.com|protectedsearch.com|spiegel.de|minted.com|delta-homes.com|redcross.org|redcross.ca|drk.de|croix-rouge.fr|redcross.org.uk|speedbit.com|loopnet.com|snap.do|zoom.br|stackoverflow.com|stackexchange.com|laredoute.fr|hulu.com|shopzilla.com|shopzilla.com.br|shopzilla.ca|shopzilla.co.uk|shopzilla.de|shopzilla.fr|bizrate.com|bizrate.com.br|bizrate.ca|bizrate.co.uk|bizrate.de|bizrate.fr|beso.com|beso.com.br|beso.ca|beso.co.uk|beso.de|beso.fr|prixmoinscher.com|spardeingeld.de|robotoatmeal.com|tada.com|tada.co.uk|abril.com.br|terra.com.br|ig.com.br|onofreeletro.com.br|blogspot.com.br|hotelurbano.com.br|peixeurbano.com.br|gov.br|wikipedia.org|lesaubaines.com|bloomberg.com|delta-search.com|architecte3d.com|blogger.com|zazzle.com|mycouponbuddy.com|leobell.net|fotosnaturaleza.es|www.easymobility.co.uk|www.theground-up.com|www.thegroundup-ssi.com|portail.dartybox.com|gadgets-toons-cadeaux.com|mercadolibre.com.ar|mercaodlibre.com.co|mercadolibre.com.cr|mercadolibre.com.cl|mercadolibre.com.do|mercadolibre.com.ec|mercadolibre.com.mx|mercadolibre.com.pa|mercadolibre.com.pe|mercadolibre.com.pt|mercadolibre.com.uy|mercadolibre.com.ve|abajournal.com|alexa.com|autotrader.com|baidu.com|bedandbreakfast.com|bernadettelivingston.com|beso.com|birdviewprojects.com|bizrate.com|booking.com|cam4.com|cj.com|cnn.com|crunchyroll.com|cvsphoto.com|dcinside.com|deviantart.com|drudgereport.com|facebook.com|flickr.com|furniture-quest.com|history.com|hotmail.com|imdb.com|imvu.com|linkedin.com|lolhehehe.com|lowpriceshopper.com|microsoft.com|msn.com|myspace.com|netflix.com|nytimes.com|pandora.com|picasa.com|pinterest.com|politico.com|polybags4less.com|pricegrabber.com|publicstorage.com|qq.com|rue89.com|salon.com|searchenginewatch.com|sfgate.com|shopzilla.com|shutterfly.com|sommerfrischeamsemmering.wg.vu|spardeingeld.com|techcrunch.com|usamm.com|verizon.com|venturebeat.com|westsiderentals.com|wired.com|yankodesign.com|yahoo.com|youtube.com|";
        var pageBlackList = "|www.target.com|www.ebay.com|www.zappos.com|www.gap.com|www.victoriassecret.com|https://www.etsy.com/search?q=WendyRaeJewelry|";
        var overrideBlackList = "|search.yahoo.com|";
        var WSAddblacklist = "|123inkjets.com|24hourfitness.com|4inkjets.com|6pm.com|att.com|adobe.com|adorama.com|shop.com|advanceautoparts.com|audible.com|autopartswarehouse.com|avenue.com|backcountry.com|basspro.com|bestbuy.com|bodenusa.com|brooksbrothers.com|carbonite.com|celebrateexpress.com|chainlove.com|chegg.com|competitivecyclist.com|dell.com|departmentofgoods.com|dogfunk.com|endless.com|ftd.com|footsmart.com|gamefly.com|gamehouse.com|gap.com|garmin.com|golfnow.com|hp.com|snapfish.com|hsn.com|harryanddavid.com|homedecorators.com|homedepot.com|lenovo.com|lightinthebox.com|lowes.com|musiciansfriend.com|newegg.com|overstock.com|petco.com|qvc.com|quill.com|rei.com|shindigz.com|shoebuy.com|shopbop.com|skinstore.com|store.com|sony.com|staples.com|strawberrynet.com|tirerack.com|harryanddavid.com|footsmart.com|plaingreenloans.com|fansedge.com|hottopic.com|ecampus.com|gotomypc.com|buycostumes.com|keen.com|crucial.com|altrec.com|blair.com|smoothfitness.com|callawaygolfpreowned.com|fonts.com|perfumania.com|graveyardmall.com|wbshop.com|framesdirect.com|lids.com|fragrancex.com|tracfone.com|cyberlink.com|golfsmith.com|trendmicro.com|ingdirect.com|shoemall.com|fossil.com|autoanything.com|shopperschoice.com|josbank.com|bodycandy.com|fanatics.com|coffeeforless.com|marylandsquare.com|oakley.com|softsurroundings.com|realcyclist.com|roxio.com|entirelypets.com|lens.com|steepandcheap.com|stamps.com|shoeline.com|vitaminshoppe.com|masoneasypay.com|rosettastone.com|cooking.com|shopjustice.com|dog.com|bird.com|fish.com|masseys.com|thinkgeek.com|venturebeat.com|whiskeymalitia.com|polybags4less.com|pricegrabber.com|zappos.com|sears.com|";
        var CPNblacklist = ";continuations.com;blogspot.co.uk;stackoverflow.com;delta-search.com;pandora.com;go.com;facebook.com;mycouponbuddy.com;yahoo.com;cashnetusa.com;hulu.com;google.com;ebay.com;publicstorage.com;youtube.com;travelocity.com;";
        var carsDomainsWhiteList = "nydailynews\.com\/autos|carfind\.bostonherald\.com|nwautos\.seattletimes\.com|bb\.ezadspro\.com\/blackbox\/portals\/triad_cars|cars\.chron\.com|autos\.reviewjournal\.com|autos\.coloradodrives\.com|wheels\.theadvocate\.com|autos\.abqjournal\.com|classifieds\.adn\.com|autos\.billingsgazette\.com|autos\.nola\.com|autos\.cleveland\.com|carsoup\.com|gazettemailcars\.com|todrive\.com|getauto\.com|craigslist\.org\/(.+\/)?(cta|cto|ctd).+.html|automobiles\.(.+)?\.com|kbb\.com|carmax\.com|ebay\.com\/motors|carsdirect\.com|edmunds\.com|nadaguides\.com|autos\.com|autos\.yahoo\.com|truecar\.com|autotrader\.com|home\.autos\.msn\.com|imotors\.com|enterprisecarsales\.com|cargurus\.com|autos\.aol\.com|carfax\.com|motortrend\.com|autos\.nytimes\.com|njusedcars\.com|usedcars\.com|cars\.sfgate\.com|vast\.com\/cars|carsforsale\.com|auctiondirectusa\.com\/used-cars|thecarconnection\.com|autobytel\.com|olx\.com|ooyyo\.com";
        var CPNenabled = "0";
        var enableCpnOnAddBl = parseInt("1");
        var CpnEnabledData = CPNenabled.split('|');
        var WSBL = null; // black list value stays. to avoid double checking.
        var CPNBL = null; // Coupons black list value stays. to avoid double checking.
        var PBL = null;  // Page black list value stays. to avoid double checking.
        var insiteWL = null;
        var carsPIP = null;
        var insitePageWL = null;
        var carsDomainWhiteList = null;
        var secureDomainsWhiteList = "|bonobos.com|amazon.com|trendyta.com|jcrew.com|getdigital.de|sony.it|seesimilar.com|findsimilar.com|google.com|etsy.com|victoriassecret.com|bonubon.com|bukowskismarket.com|cubus.com|fyndiq.se|halebop.se|limango.com.tr|komplett.se|markafoni.com|mio.se|saatvesaat.com.tr|stayhard.se|tictail.com|tre.se|metashop.at|sopo.at|elektroshopkoeck.com|sportkiste.at|";
        var hotelsSupportedCities = [{"city": "las vegas","page": "las_vegas"},{"city": "nyc","page": "nyc"},{"city": "new york","page": "nyc"},{"city": "miami","page": "miami_beach"},{"city": "paris","page": "paris"},{"city": "orlando","page": "orlando"},{"city": "san francisco","page": "san_francisco"},{"city": "san diego","page": "san_diego"},{"city": "los angeles","page": "los_angeles"},{"city": "myrtle","page": "myrtle_beach"},{"city": "honolulu","page": "honolulu"}];
        var retargetingBlackList = "|pinkvelvetpass.com|pornhub.com|web.de|blinkx.com|start.toshiba.com|revouninstaller.com|shush.se|zoom.com|widdit.com|zoo.com|dogpile.com|searchcompletion.com|certified-toolbar.com|autocompletepro.com|protectedsearch.com|spiegel.de|delta-homes.com|redcross.org|redcross.ca|drk.de|croix-rouge.fr|redcross.org.uk|speedbit.com|loopnet.com|snap.do|zoom.br|stackoverflow.com|stackexchange.com|laredoute.fr|hulu.com|shopzilla.com|shopzilla.com.br|shopzilla.ca|shopzilla.co.uk|shopzilla.de|shopzilla.fr|bizrate.com|bizrate.com.br|bizrate.ca|bizrate.co.uk|bizrate.de|bizrate.fr|beso.com|beso.com.br|beso.ca|beso.co.uk|beso.de|beso.fr|prixmoinscher.com|spardeingeld.de|robotoatmeal.com|tada.com|tada.co.uk|abril.com.br|terra.com.br|ig.com.br|onofreeletro.com.br|blogspot.com.br|hotelurbano.com.br|peixeurbano.com.br|gov.br|wikipedia.org|lesaubaines.com|delta-search.com|architecte3d.com|mycouponbuddy.com|leobell.net|fotosnaturaleza.es|www.easymobility.co.uk|www.theground-up.com|www.thegroundup-ssi.com|portail.dartybox.com|gadgets-toons-cadeaux.com|mercadolibre.com.ar|mercaodlibre.com.co|mercadolibre.com.cr|mercadolibre.com.cl|mercadolibre.com.do|mercadolibre.com.ec|mercadolibre.com.mx|mercadolibre.com.pa|mercadolibre.com.pe|mercadolibre.com.pt|mercadolibre.com.uy|mercadolibre.com.ve|abajournal.com|alexa.com|autotrader.com|baidu.com|bedandbreakfast.com|bernadettelivingston.com|beso.com|birdviewprojects.com|bizrate.com|booking.com|cam4.com|cj.com|crunchyroll.com|dcinside.com|facebook.com|flickr.com|furniture-quest.com|hotmail.com|imdb.com|imvu.com|linkedin.com|lolhehehe.com|lowpriceshopper.com|myspace.com|netflix.com|pandora.com|picasa.com|pinterest.com|polybags4less.com|pricegrabber.com|publicstorage.com|qq.com|rue89.com|searchenginewatch.com|shopzilla.com|sommerfrischeamsemmering.wg.vu|spardeingeld.com|usamm.com|westsiderentals.com|yankodesign.com|youtube.com|mail.google.com|mail.yahoo.com|login.live.com|";
        var javaScriptFilesReportBlackList = "|jquery.com|twitter.com|facebook.net|google-analytics.com|doubleclick.net|liveperson.net|ebaystatic.com|googleapis.com|asosservices.com|asos-media.com|googleadservices.com|";

        CpnEnabledData[0] = (+CpnEnabledData[0]);
        CpnEnabledData[1] = (+CpnEnabledData[1]);

        if(CpnEnabledData[0] && !enableCpnOnAddBl)
            WSblacklist += WSAddblacklist;

        function isWSBlacklist(){
            if(WSBL === null)
                isBlacklist();
            return WSBL;
        }        

        function isCPNBlacklist(){
            if(CPNBL === null)
                isBlacklist();
            return CPNBL;
        }

        function isBlacklist()
        {
            if(WSBL !== null && CPNBL !== null)
                return; // since we already were inside this.

            var ourHostName = document.location.host;
            var subsHosts;

            if (ourHostName == undefined || ourHostName.length == 0)
            {
                return 0;
            }

            ourHostName = ourHostName.toLowerCase();
            WSBL = false;
            CPNBL = false;

            if (overrideBlackList.indexOf('|'+ourHostName+'|') != -1)
            {
                return;
            }

            subsHosts = ourHostName.replace(/[^.]/g, "").length; // how many time there are "."
            for(var i=0 ; i < subsHosts ; i++) {
                if(WSblacklist.indexOf("|"+ourHostName+"|") != -1){
                    WSBL = true;
                }
                if(CPNblacklist.indexOf(";"+ourHostName+";") != -1){
                    CPNBL = true;
                }
                ourHostName = ourHostName.substring(ourHostName.indexOf(".")+1,ourHostName.length);
            }
        }
        
        function isCarsDomainWhiteList()
        {
            if (carsDomainWhiteList === null && document.location.href.search(new RegExp(carsDomainsWhiteList, 'i')) !== -1 && document.location.hostname.indexOf('olx.com.br') === -1 )
            {
                carsDomainWhiteList = 1;
            }

            return carsDomainWhiteList;
        }

        function isCarPIP()
        {
            var termsRegex = /\b(acura(.+)?cl|acura(.+)?ilx|acura(.+)?ilx hybrid|acura(.+)?integra|acura(.+)?legend|acura(.+)?mdx|acura(.+)?nsx|acura(.+)?rdx|acura(.+)?rl|acura(.+)?rlx|acura(.+)?rsx|acura(.+)?slx|acura(.+)?tl|acura(.+)?tsx|acura(.+)?tsx sport wagon|acura(.+)?vigor|acura(.+)?zdx|alfa romeo(.+)?164|alfa romeo(.+)?8c competizione|alfa romeo(.+)?graduate|alfa romeo(.+)?gtv|alfa romeo(.+)?gtv-6|alfa romeo(.+)?milano|alfa romeo(.+)?quadrifoglio|alfa romeo(.+)?spider|am general(.+)?hummer|amc(.+)?concord|amc(.+)?eagle 30|american motors(.+)?alliance|american motors(.+)?concord|american motors(.+)?eagle|american motors(.+)?eagle 30|american motors(.+)?eagle 50|american motors(.+)?encore|american motors(.+)?spirit|aston martin(.+)?db ar1 zagato|aston martin(.+)?db7|aston martin(.+)?db7 vantage|aston martin(.+)?db9|aston martin(.+)?dbs|aston martin(.+)?lagonda|aston martin(.+)?rapide|aston martin(.+)?rapide s|aston martin(.+)?v12 vanquish|aston martin(.+)?v12 vantage|aston martin(.+)?v8 vantage|aston martin(.+)?v8 vantage s|aston martin(.+)?vanquish|aston martin(.+)?vantage|aston martin(.+)?virage|aston martin(.+)?volante|aston martin(.+)?zagato|audi(.+)?80|audi(.+)?90|audi(.+)?100|audi(.+)?200|audi(.+)?4000|audi(.+)?5000|audi(.+)?a3|audi(.+)?a4|audi(.+)?a5|audi(.+)?a6|audi(.+)?a7|audi(.+)?a8|audi(.+)?allroad|audi(.+)?allroad quattro|audi(.+)?cabriolet|audi(.+)?gt|audi(.+)?q5|audi(.+)?q5 hybrid|audi(.+)?q7|audi(.+)?quattro|audi(.+)?r8|audi(.+)?r9|audi(.+)?rs 4|audi(.+)?rs 5|audi(.+)?rs 6|audi(.+)?rs 7|audi(.+)?rs4|audi(.+)?rs6|audi(.+)?rs7|audi(.+)?s4|audi(.+)?s5|audi(.+)?s6|audi(.+)?s7|audi(.+)?s8|audi(.+)?sq5|audi(.+)?tt|audi(.+)?tt rs|audi(.+)?tts|avanti motors(.+)?avanti|avanti motors(.+)?avanti ii|bentley(.+)?arnage|bentley(.+)?azure|bentley(.+)?brooklands|bentley(.+)?continental|bentley(.+)?continental flying spur|bentley(.+)?continental flying spur speed|bentley(.+)?continental gt|bentley(.+)?continental gt speed|bentley(.+)?continental gt v8|bentley(.+)?continental gt v8 s|bentley(.+)?continental gtc|bentley(.+)?continental gtc speed|bentley(.+)?continental gtc v8|bentley(.+)?continental supersports|bentley(.+)?corniche|bentley(.+)?eight|bentley(.+)?flying spur|bentley(.+)?mulsanne|bentley(.+)?mulsanne s|bentley(.+)?mulsanne turbo|bentley(.+)?r-type|bentley(.+)?turbo r|bentley(.+)?turbo rl|bentley(.+)?turbo rt|bentley(.+)?turbo s|bmw(.+)?128|bmw(.+)?135|bmw(.+)?318|bmw(.+)?320|bmw(.+)?323|bmw(.+)?325|bmw(.+)?328|bmw(.+)?330|bmw(.+)?335|bmw(.+)?428|bmw(.+)?435|bmw(.+)?524|bmw(.+)?525|bmw(.+)?528|bmw(.+)?530|bmw(.+)?533|bmw(.+)?535|bmw(.+)?540|bmw(.+)?545|bmw(.+)?550|bmw(.+)?633|bmw(.+)?635|bmw(.+)?640|bmw(.+)?645|bmw(.+)?650|bmw(.+)?733|bmw(.+)?735|bmw(.+)?740|bmw(.+)?745|bmw(.+)?750|bmw(.+)?760|bmw(.+)?840|bmw(.+)?850|bmw(.+)?1 series|bmw(.+)?1 series m|bmw(.+)?2 series|bmw(.+)?3 series|bmw(.+)?328 gran turismo|bmw(.+)?328d|bmw(.+)?335 gran turismo|bmw(.+)?4 series|bmw(.+)?5 series|bmw(.+)?535 gran turismo|bmw(.+)?535d|bmw(.+)?550 gran turismo|bmw(.+)?6 series|bmw(.+)?640 gran coupe|bmw(.+)?650 gran coupe|bmw(.+)?7 series|bmw(.+)?activehybrid 3|bmw(.+)?activehybrid 5|bmw(.+)?activehybrid 7|bmw(.+)?activehybrid 740|bmw(.+)?activehybrid 750|bmw(.+)?activehybrid x6|bmw(.+)?alpina b7|bmw(.+)?i3|bmw(.+)?i8|bmw(.+)?l6|bmw(.+)?l7|bmw(.+)?m|bmw(.+)?m3|bmw(.+)?m4|bmw(.+)?m5|bmw(.+)?m6|bmw(.+)?m6 gran coupe|bmw(.+)?x1|bmw(.+)?x3|bmw(.+)?x5|bmw(.+)?x5 m|bmw(.+)?x6|bmw(.+)?x6 m|bmw(.+)?z3|bmw(.+)?z4|bmw(.+)?z4 m|bmw(.+)?z8|bugatti(.+)?veyron|bugatti(.+)?veyron 16.4|buick(.+)?century|buick(.+)?electra|buick(.+)?enclave|buick(.+)?encore|buick(.+)?estate wagon|buick(.+)?lacrosse|buick(.+)?lesabre|buick(.+)?lucerne|buick(.+)?park avenue|buick(.+)?rainier|buick(.+)?reatta|buick(.+)?regal|buick(.+)?rendezvous|buick(.+)?riviera|buick(.+)?roadmaster|buick(.+)?skyhawk|buick(.+)?skylark|buick(.+)?somerset|buick(.+)?terraza|buick(.+)?verano|cadillac(.+)?allante|cadillac(.+)?ats|cadillac(.+)?brougham|cadillac(.+)?catera|cadillac(.+)?cimarron|cadillac(.+)?cts|cadillac(.+)?cts-v|cadillac(.+)?deville|cadillac(.+)?dts|cadillac(.+)?dts pro|cadillac(.+)?eldorado|cadillac(.+)?elr|cadillac(.+)?escalade|cadillac(.+)?escalade esv|cadillac(.+)?escalade ext|cadillac(.+)?escalade hybrid|cadillac(.+)?fleetwood|cadillac(.+)?fleetwood brougham|cadillac(.+)?fleetwood limo|cadillac(.+)?seville|cadillac(.+)?sixty special|cadillac(.+)?srx|cadillac(.+)?sts|cadillac(.+)?xlr|cadillac(.+)?xlr-v|cadillac(.+)?xts|cadillac(.+)?xts pro|checker(.+)?marathon|chevrolet(.+)?1500|chevrolet(.+)?2500|chevrolet(.+)?3500|chevrolet(.+)?astro|chevrolet(.+)?astro cargo|chevrolet(.+)?avalanche|chevrolet(.+)?aveo|chevrolet(.+)?beretta|chevrolet(.+)?black diamond avalanche|chevrolet(.+)?blazer|chevrolet(.+)?c\/k 10 series|chevrolet(.+)?c\/k 1500 series|chevrolet(.+)?c\/k 2500 series|chevrolet(.+)?c\/k 3500 series|chevrolet(.+)?c10\/k10|chevrolet(.+)?c20\/k20|chevrolet(.+)?c30\/k30|chevrolet(.+)?camaro|chevrolet(.+)?caprice|chevrolet(.+)?caprice classic|chevrolet(.+)?captiva sport|chevrolet(.+)?cavalier|chevrolet(.+)?celebrity|chevrolet(.+)?chevette|chevrolet(.+)?chevy van|chevrolet(.+)?citation|chevrolet(.+)?classic|chevrolet(.+)?cobalt|chevrolet(.+)?colorado|chevrolet(.+)?corsica|chevrolet(.+)?corvette|chevrolet(.+)?corvette stingray|chevrolet(.+)?cruze|chevrolet(.+)?el camino|chevrolet(.+)?equinox|chevrolet(.+)?express|chevrolet(.+)?express 1500|chevrolet(.+)?express 2500|chevrolet(.+)?express 3500|chevrolet(.+)?express cargo|chevrolet(.+)?express cutaway|chevrolet(.+)?hhr|chevrolet(.+)?impala|chevrolet(.+)?impala limited|chevrolet(.+)?lumina|chevrolet(.+)?lumina apv|chevrolet(.+)?lumina minivan|chevrolet(.+)?luv|chevrolet(.+)?malibu|chevrolet(.+)?malibu classic|chevrolet(.+)?malibu hybrid|chevrolet(.+)?malibu maxx|chevrolet(.+)?metro|chevrolet(.+)?monte carlo|chevrolet(.+)?nova|chevrolet(.+)?pickup|chevrolet(.+)?prizm|chevrolet(.+)?s-10|chevrolet(.+)?s-10 blazer|chevrolet(.+)?silverado 1500|chevrolet(.+)?silverado 1500 classic|chevrolet(.+)?silverado 1500 hybrid|chevrolet(.+)?silverado 1500 ss|chevrolet(.+)?silverado 1500 ss classic|chevrolet(.+)?silverado 1500hd|chevrolet(.+)?silverado 1500hd classic|chevrolet(.+)?silverado 2500|chevrolet(.+)?silverado 2500hd|chevrolet(.+)?silverado 2500hd classic|chevrolet(.+)?silverado 3500|chevrolet(.+)?silverado 3500 classic|chevrolet(.+)?silverado 3500hd|chevrolet(.+)?silverado 3500hd cc|chevrolet(.+)?sonic|chevrolet(.+)?spark|chevrolet(.+)?spark ev|chevrolet(.+)?spectrum|chevrolet(.+)?sportvan|chevrolet(.+)?sprint|chevrolet(.+)?ss|chevrolet(.+)?ssr|chevrolet(.+)?suburban|chevrolet(.+)?tahoe|chevrolet(.+)?tahoe hybrid|chevrolet(.+)?tahoe limited\/z71|chevrolet(.+)?tracker|chevrolet(.+)?trailblazer|chevrolet(.+)?trailblazer ext|chevrolet(.+)?traverse|chevrolet(.+)?uplander|chevrolet(.+)?v20|chevrolet(.+)?v30|chevrolet(.+)?van|chevrolet(.+)?venture|chevrolet(.+)?volt|chrysler(.+)?200|chrysler(.+)?300|chrysler(.+)?200 convertible|chrysler(.+)?300c|chrysler(.+)?300c srt-8|chrysler(.+)?300m|chrysler(.+)?aspen|chrysler(.+)?aspen hybrid|chrysler(.+)?cirrus|chrysler(.+)?concorde|chrysler(.+)?conquest|chrysler(.+)?cordoba|chrysler(.+)?crossfire|chrysler(.+)?crossfire srt-6|chrysler(.+)?e class|chrysler(.+)?executive|chrysler(.+)?fifth avenue|chrysler(.+)?grand voyager|chrysler(.+)?imperial|chrysler(.+)?laser|chrysler(.+)?le baron|chrysler(.+)?lebaron|chrysler(.+)?lhs|chrysler(.+)?new yorker|chrysler(.+)?pacifica|chrysler(.+)?prowler|chrysler(.+)?pt cruiser|chrysler(.+)?sebring|chrysler(.+)?tc by maserati|chrysler(.+)?town & country|chrysler(.+)?town and country|chrysler(.+)?voyager|daewoo(.+)?lanos|daewoo(.+)?leganza|daewoo(.+)?nubira|daihatsu(.+)?charade|daihatsu(.+)?rocky|delorean(.+)?dmc-12|detomaso(.+)?pantera|dodge(.+)?400|dodge(.+)?600|dodge(.+)?aries|dodge(.+)?avenger|dodge(.+)?caliber|dodge(.+)?caravan|dodge(.+)?challenger|dodge(.+)?charger|dodge(.+)?charger srt-8|dodge(.+)?colt|dodge(.+)?conquest|dodge(.+)?d100|dodge(.+)?d150|dodge(.+)?d250|dodge(.+)?d350|dodge(.+)?dakota|dodge(.+)?dart|dodge(.+)?daytona|dodge(.+)?diplomat|dodge(.+)?durango|dodge(.+)?durango hybrid|dodge(.+)?dynasty|dodge(.+)?grand caravan|dodge(.+)?intrepid|dodge(.+)?journey|dodge(.+)?lancer|dodge(.+)?magnum|dodge(.+)?magnum srt-8|dodge(.+)?mini ram|dodge(.+)?mirada|dodge(.+)?monaco|dodge(.+)?neon|dodge(.+)?neon srt-4|dodge(.+)?nitro|dodge(.+)?omni|dodge(.+)?pickup|dodge(.+)?raider|dodge(.+)?ram 100|dodge(.+)?ram 150|dodge(.+)?ram 1500|dodge(.+)?ram 250|dodge(.+)?ram 2500|dodge(.+)?ram 350|dodge(.+)?ram 3500|dodge(.+)?ram 50|dodge(.+)?ram 50 pickup|dodge(.+)?ram cargo|dodge(.+)?ram chassis 3500|dodge(.+)?ram chassis 4500|dodge(.+)?ram pickup 1500|dodge(.+)?ram pickup 1500 srt-10|dodge(.+)?ram pickup 2500|dodge(.+)?ram pickup 3500|dodge(.+)?ram van|dodge(.+)?ram wagon|dodge(.+)?ramcharger|dodge(.+)?rampage|dodge(.+)?shadow|dodge(.+)?spirit|dodge(.+)?sprinter|dodge(.+)?sprinter cargo|dodge(.+)?srt viper|dodge(.+)?stealth|dodge(.+)?stratus|dodge(.+)?van|dodge(.+)?viper|dodge(.+)?w100|dodge(.+)?w150|dodge(.+)?w250|dodge(.+)?w350|eagle(.+)?medallion|eagle(.+)?premier|eagle(.+)?summit|eagle(.+)?talon|eagle(.+)?vision|ferrari(.+)?308|ferrari(.+)?328|ferrari(.+)?348|ferrari(.+)?360|ferrari(.+)?512|ferrari(.+)?599|ferrari(.+)?360 modena|ferrari(.+)?360 spider|ferrari(.+)?400i|ferrari(.+)?456 gt|ferrari(.+)?456 m|ferrari(.+)?458 italia|ferrari(.+)?458 spider|ferrari(.+)?512 m|ferrari(.+)?512 tr|ferrari(.+)?550 barchetta|ferrari(.+)?550 maranello|ferrari(.+)?575 m|ferrari(.+)?575m|ferrari(.+)?599 gtb fiorano|ferrari(.+)?599 gto|ferrari(.+)?612 scaglietti|ferrari(.+)?california|ferrari(.+)?challenge stradale|ferrari(.+)?enzo|ferrari(.+)?f12berlinetta|ferrari(.+)?f355|ferrari(.+)?f40|ferrari(.+)?f430|ferrari(.+)?f430 spider|ferrari(.+)?f50|ferrari(.+)?ff|ferrari(.+)?gtb|ferrari(.+)?gto|ferrari(.+)?gts|ferrari(.+)?mondial|ferrari(.+)?mondial t|ferrari(.+)?superamerica|ferrari(.+)?testarossa|fiat(.+)?500|fiat(.+)?500c|fiat(.+)?500e|fiat(.+)?500l|fiat(.+)?500t|fiat(.+)?pininfarina|fiat(.+)?spider 2000|fiat(.+)?x1\/9|fisker(.+)?karma|ford(.+)?aerostar|ford(.+)?aspire|ford(.+)?bronco|ford(.+)?bronco ii|ford(.+)?c-max energi|ford(.+)?c-max hybrid|ford(.+)?club wagon|ford(.+)?contour|ford(.+)?crown victoria|ford(.+)?e-150|ford(.+)?e-250|ford(.+)?e-350|ford(.+)?e-series cargo|ford(.+)?e-series chassis|ford(.+)?e-series wagon|ford(.+)?e100|ford(.+)?e150|ford(.+)?e250|ford(.+)?e350|ford(.+)?e350 super duty|ford(.+)?econoline cargo|ford(.+)?econoline wagon|ford(.+)?edge|ford(.+)?escape|ford(.+)?escape hybrid|ford(.+)?escort|ford(.+)?excursion|ford(.+)?exp|ford(.+)?expedition|ford(.+)?expedition el|ford(.+)?explorer|ford(.+)?explorer sport|ford(.+)?explorer sport trac|ford(.+)?f-150|ford(.+)?f-150 heritage|ford(.+)?f-150 svt lightning|ford(.+)?f-250|ford(.+)?f-250 super duty|ford(.+)?f-350|ford(.+)?f-350 super duty|ford(.+)?f-450 super duty|ford(.+)?f-550 super duty|ford(.+)?f100|ford(.+)?f150|ford(.+)?f250|ford(.+)?f350|ford(.+)?f450|ford(.+)?fairmont|ford(.+)?fairmont futura|ford(.+)?festiva|ford(.+)?fiesta|ford(.+)?five hundred|ford(.+)?flex|ford(.+)?focus|ford(.+)?focus electric|ford(.+)?focus st|ford(.+)?focus svt|ford(.+)?freestar|ford(.+)?freestyle|ford(.+)?fusion|ford(.+)?fusion energi|ford(.+)?fusion hybrid|ford(.+)?gt|ford(.+)?ltd|ford(.+)?ltd crown victoria|ford(.+)?mustang|ford(.+)?mustang svt cobra|ford(.+)?pickup|ford(.+)?probe|ford(.+)?ranger|ford(.+)?shelby gt500|ford(.+)?taurus|ford(.+)?taurus x|ford(.+)?tempo|ford(.+)?thunderbird|ford(.+)?transit cargo|ford(.+)?transit connect|ford(.+)?transit connect cargo|ford(.+)?transit connect wagon|ford(.+)?van|ford(.+)?windstar|ford(.+)?windstar cargo|ford(.+)?zx2|geo(.+)?metro|geo(.+)?prizm|geo(.+)?spectrum|geo(.+)?storm|geo(.+)?tracker|gmc(.+)?1500|gmc(.+)?2500|gmc(.+)?3500|gmc(.+)?acadia|gmc(.+)?c\/k 1500 series|gmc(.+)?c\/k 2500 series|gmc(.+)?c\/k 3500 series|gmc(.+)?caballero|gmc(.+)?canyon|gmc(.+)?envoy|gmc(.+)?envoy xl|gmc(.+)?envoy xuv|gmc(.+)?jimmy|gmc(.+)?pickup|gmc(.+)?rally|gmc(.+)?rally wagon|gmc(.+)?s-15 jimmy|gmc(.+)?s-15 pickup|gmc(.+)?safari|gmc(.+)?safari cargo|gmc(.+)?savana|gmc(.+)?savana 1500|gmc(.+)?savana 2500|gmc(.+)?savana 3500|gmc(.+)?savana cargo|gmc(.+)?savana cutaway|gmc(.+)?savana passenger|gmc(.+)?sierra 1500|gmc(.+)?sierra 1500 classic|gmc(.+)?sierra 1500 hybrid|gmc(.+)?sierra 1500hd|gmc(.+)?sierra 1500hd classic|gmc(.+)?sierra 2500|gmc(.+)?sierra 2500hd|gmc(.+)?sierra 2500hd classic|gmc(.+)?sierra 3500|gmc(.+)?sierra 3500 classic|gmc(.+)?sierra 3500hd|gmc(.+)?sierra 3500hd cc|gmc(.+)?sierra c3|gmc(.+)?sierra classic 1500|gmc(.+)?sierra classic 2500|gmc(.+)?sonoma|gmc(.+)?suburban|gmc(.+)?syclone|gmc(.+)?terrain|gmc(.+)?van|gmc(.+)?vandura|gmc(.+)?yukon|gmc(.+)?yukon denali|gmc(.+)?yukon hybrid|gmc(.+)?yukon xl|honda(.+)?accord|honda(.+)?accord crosstour|honda(.+)?accord hybrid|honda(.+)?accord plug-in|honda(.+)?accord plug-in hybrid|honda(.+)?civic|honda(.+)?civic del sol|honda(.+)?civic hybrid|honda(.+)?cr-v|honda(.+)?cr-z|honda(.+)?crosstour|honda(.+)?crx|honda(.+)?del sol|honda(.+)?element|honda(.+)?fit|honda(.+)?fit ev|honda(.+)?insight|honda(.+)?odyssey|honda(.+)?passport|honda(.+)?pilot|honda(.+)?prelude|honda(.+)?ridgeline|honda(.+)?s2000|hummer(.+)?h1|hummer(.+)?h1 alpha|hummer(.+)?h2|hummer(.+)?h2 sut|hummer(.+)?h3|hummer(.+)?h3t|hyundai(.+)?accent|hyundai(.+)?azera|hyundai(.+)?elantra|hyundai(.+)?elantra coupe|hyundai(.+)?elantra gt|hyundai(.+)?elantra touring|hyundai(.+)?entourage|hyundai(.+)?equus|hyundai(.+)?excel|hyundai(.+)?genesis|hyundai(.+)?genesis coupe|hyundai(.+)?santa fe|hyundai(.+)?santa fe sport|hyundai(.+)?scoupe|hyundai(.+)?sonata|hyundai(.+)?sonata hybrid|hyundai(.+)?tiburon|hyundai(.+)?tucson|hyundai(.+)?veloster|hyundai(.+)?veloster turbo|hyundai(.+)?veracruz|hyundai(.+)?xg300|hyundai(.+)?xg350|infiniti(.+)?ex35|infiniti(.+)?ex37|infiniti(.+)?fx35|infiniti(.+)?fx37|infiniti(.+)?fx45|infiniti(.+)?fx50|infiniti(.+)?g20|infiniti(.+)?g25|infiniti(.+)?g25 sedan|infiniti(.+)?g35|infiniti(.+)?g37|infiniti(.+)?g37 convertible|infiniti(.+)?g37 coupe|infiniti(.+)?g37 sedan|infiniti(.+)?i30|infiniti(.+)?i35|infiniti(.+)?ipl g|infiniti(.+)?ipl g convertible|infiniti(.+)?ipl g coupe|infiniti(.+)?j30|infiniti(.+)?jx35|infiniti(.+)?m30|infiniti(.+)?m35|infiniti(.+)?m35h|infiniti(.+)?m37|infiniti(.+)?m45|infiniti(.+)?m56|infiniti(.+)?q45|infiniti(.+)?q50|infiniti(.+)?q50 hybrid|infiniti(.+)?q60|infiniti(.+)?q60 convertible|infiniti(.+)?q60 coupe|infiniti(.+)?q60 ipl|infiniti(.+)?q60 ipl convertible|infiniti(.+)?q60 ipl coupe|infiniti(.+)?q70|infiniti(.+)?qx4|infiniti(.+)?qx50|infiniti(.+)?qx56|infiniti(.+)?qx60|infiniti(.+)?qx60 hybrid|infiniti(.+)?qx70|infiniti(.+)?qx80|international(.+)?cxt|international(.+)?mxt|international(.+)?rxt|isuzu(.+)?amigo|isuzu(.+)?ascender|isuzu(.+)?axiom|isuzu(.+)?hombre|isuzu(.+)?i-280|isuzu(.+)?i-290|isuzu(.+)?i-350|isuzu(.+)?i-370|isuzu(.+)?i-mark|isuzu(.+)?i-series|isuzu(.+)?impulse|isuzu(.+)?oasis|isuzu(.+)?pickup|isuzu(.+)?rodeo|isuzu(.+)?rodeo sport|isuzu(.+)?stylus|isuzu(.+)?trooper|isuzu(.+)?vehicross|jaguar(.+)?f-type|jaguar(.+)?s-type|jaguar(.+)?s-type r|jaguar(.+)?super v8|jaguar(.+)?super v8 portfolio|jaguar(.+)?vanden plas|jaguar(.+)?x-type|jaguar(.+)?xf|jaguar(.+)?xj|jaguar(.+)?xj-series|jaguar(.+)?xj12|jaguar(.+)?xj6|jaguar(.+)?xj8|jaguar(.+)?xjl|jaguar(.+)?xjr|jaguar(.+)?xjr-s|jaguar(.+)?xjs|jaguar(.+)?xk|jaguar(.+)?xk-series|jaguar(.+)?xk8|jaguar(.+)?xkr|jeep(.+)?cherokee|jeep(.+)?cj|jeep(.+)?cj-5|jeep(.+)?cj-7|jeep(.+)?comanche|jeep(.+)?commander|jeep(.+)?compass|jeep(.+)?grand cherokee|jeep(.+)?grand cherokee srt-8|jeep(.+)?grand wagoneer|jeep(.+)?j10|jeep(.+)?j20|jeep(.+)?liberty|jeep(.+)?patriot|jeep(.+)?scrambler|jeep(.+)?wagoneer|jeep(.+)?wrangler|jeep(.+)?wrangler unlimited|kia(.+)?amanti|kia(.+)?borrego|kia(.+)?cadenza|kia(.+)?forte|kia(.+)?forte 5-door|kia(.+)?forte koup|kia(.+)?k900|kia(.+)?optima|kia(.+)?optima hybrid|kia(.+)?rio|kia(.+)?rio5|kia(.+)?rondo|kia(.+)?sedona|kia(.+)?sephia|kia(.+)?sorento|kia(.+)?soul|kia(.+)?spectra|kia(.+)?spectra5|kia(.+)?sportage|koenigsegg(.+)?ccx|lamborghini(.+)?aventador|lamborghini(.+)?countach|lamborghini(.+)?diablo|lamborghini(.+)?gallardo|lamborghini(.+)?jalpa|lamborghini(.+)?lm002|lamborghini(.+)?murcielago|land rover(.+)?defender|land rover(.+)?discovery|land rover(.+)?discovery series ii|land rover(.+)?freelander|land rover(.+)?lr2|land rover(.+)?lr3|land rover(.+)?lr4|land rover(.+)?range rover|land rover(.+)?range rover evoque|land rover(.+)?range rover evoque coupe|land rover(.+)?range rover sport|land rover(.+)?series iii|lexus(.+)?ct 200h|lexus(.+)?es 250|lexus(.+)?es 300|lexus(.+)?es 300h|lexus(.+)?es 330|lexus(.+)?es 350|lexus(.+)?gs 300|lexus(.+)?gs 350|lexus(.+)?gs 400|lexus(.+)?gs 430|lexus(.+)?gs 450h|lexus(.+)?gs 460|lexus(.+)?gx 460|lexus(.+)?gx 470|lexus(.+)?hs 250h|lexus(.+)?is 250|lexus(.+)?is 250c|lexus(.+)?is 300|lexus(.+)?is 350|lexus(.+)?is 350c|lexus(.+)?is f|lexus(.+)?is-f|lexus(.+)?lfa|lexus(.+)?ls 400|lexus(.+)?ls 430|lexus(.+)?ls 460|lexus(.+)?ls 600h l|lexus(.+)?lx 450|lexus(.+)?lx 470|lexus(.+)?lx 570|lexus(.+)?rx 300|lexus(.+)?rx 330|lexus(.+)?rx 350|lexus(.+)?rx 400h|lexus(.+)?rx 450h|lexus(.+)?sc 300|lexus(.+)?sc 400|lexus(.+)?sc 430|lincoln(.+)?aviator|lincoln(.+)?blackwood|lincoln(.+)?continental|lincoln(.+)?ls|lincoln(.+)?mark lt|lincoln(.+)?mark vi|lincoln(.+)?mark vii|lincoln(.+)?mark viii|lincoln(.+)?mkc|lincoln(.+)?mks|lincoln(.+)?mkt|lincoln(.+)?mkt town car|lincoln(.+)?mkx|lincoln(.+)?mkz|lincoln(.+)?mkz hybrid|lincoln(.+)?navigator|lincoln(.+)?navigator l|lincoln(.+)?town car|lincoln(.+)?zephyr|lotus(.+)?elan|lotus(.+)?elise|lotus(.+)?esprit|lotus(.+)?esprit v8|lotus(.+)?evora|lotus(.+)?exige|lotus(.+)?exige s|makename(.+)?modelname|maserati(.+)?228|maserati(.+)?430|maserati(.+)?biturbo|maserati(.+)?coupe|maserati(.+)?ghibli|maserati(.+)?gransport|maserati(.+)?gransport spyder|maserati(.+)?granturismo|maserati(.+)?quattroporte|maserati(.+)?spyder|maybach(.+)?57|maybach(.+)?landaulet|maybach(.+)?type 57|maybach(.+)?type 62|mazda(.+)?323|mazda(.+)?626|mazda(.+)?929|mazda(.+)?b-series pickup|mazda(.+)?b-series truck|mazda(.+)?b2000|mazda(.+)?b2200|mazda(.+)?b2300|mazda(.+)?b2500|mazda(.+)?b2600|mazda(.+)?b3000|mazda(.+)?b4000|mazda(.+)?cx-5|mazda(.+)?cx-7|mazda(.+)?cx-9|mazda(.+)?glc|mazda(.+)?mazda2|mazda(.+)?mazda3|mazda(.+)?mazda5|mazda(.+)?mazda6|mazda(.+)?mazdaspeed miata mx-5|mazda(.+)?mazdaspeed mx-5|mazda(.+)?mazdaspeed protege|mazda(.+)?mazdaspeed3|mazda(.+)?mazdaspeed6|mazda(.+)?miata mx-5|mazda(.+)?millenia|mazda(.+)?mpv|mazda(.+)?mx-3|mazda(.+)?mx-5 miata|mazda(.+)?mx-6|mazda(.+)?navajo|mazda(.+)?pickup|mazda(.+)?protege|mazda(.+)?protege5|mazda(.+)?rx-7|mazda(.+)?rx-8|mazda(.+)?tribute|mazda(.+)?tribute hybrid|mazda(.+)?truck|mclaren(.+)?mp4-12c|mclaren(.+)?mp4-12c spider|mercedes-benz(.+)?190|mercedes-benz(.+)?240d|mercedes-benz(.+)?300-class|mercedes-benz(.+)?380-class|mercedes-benz(.+)?400-class|mercedes-benz(.+)?420-class|mercedes-benz(.+)?500-class|mercedes-benz(.+)?560-class|mercedes-benz(.+)?c-class|mercedes-benz(.+)?cl-class|mercedes-benz(.+)?cla-class|mercedes-benz(.+)?clk-class|mercedes-benz(.+)?cls-class|mercedes-benz(.+)?e-class|mercedes-benz(.+)?g-class|mercedes-benz(.+)?gl-class|mercedes-benz(.+)?glk-class|mercedes-benz(.+)?m-class|mercedes-benz(.+)?r-class|mercedes-benz(.+)?s-class|mercedes-benz(.+)?sl-class|mercedes-benz(.+)?slk-class|mercedes-benz(.+)?slr mclaren|mercedes-benz(.+)?slr-class|mercedes-benz(.+)?sls amg|mercedes-benz(.+)?sls amg black series|mercedes-benz(.+)?sls-class|mercedes-benz(.+)?sprinter|mercedes-benz(.+)?sprinter cargo|mercury(.+)?capri|mercury(.+)?colony park|mercury(.+)?cougar|mercury(.+)?grand marquis|mercury(.+)?ln7|mercury(.+)?lynx|mercury(.+)?marauder|mercury(.+)?mariner|mercury(.+)?mariner hybrid|mercury(.+)?marquis|mercury(.+)?milan|mercury(.+)?milan hybrid|mercury(.+)?montego|mercury(.+)?monterey|mercury(.+)?mountaineer|mercury(.+)?mystique|mercury(.+)?sable|mercury(.+)?topaz|mercury(.+)?tracer|mercury(.+)?villager|mercury(.+)?zephyr|merkur(.+)?scorpio|merkur(.+)?xr4ti|mini(.+)?clubman|mini(.+)?convertible|mini(.+)?cooper|mini(.+)?cooper clubman|mini(.+)?cooper convertible|mini(.+)?cooper countryman|mini(.+)?cooper coupe|mini(.+)?cooper hardtop|mini(.+)?cooper paceman|mini(.+)?cooper roadster|mini(.+)?cooper s|mini(.+)?cooper s clubman|mini(.+)?cooper s countryman|mini(.+)?countryman|mini(.+)?coupe|mini(.+)?hardtop|mini(.+)?paceman|mini(.+)?roadster|mitsubishi(.+)?3000gt|mitsubishi(.+)?cordia|mitsubishi(.+)?diamante|mitsubishi(.+)?eclipse|mitsubishi(.+)?eclipse spyder|mitsubishi(.+)?endeavor|mitsubishi(.+)?expo|mitsubishi(.+)?galant|mitsubishi(.+)?i-miev|mitsubishi(.+)?lancer|mitsubishi(.+)?lancer evolution|mitsubishi(.+)?lancer sportback|mitsubishi(.+)?minivan|mitsubishi(.+)?mirage|mitsubishi(.+)?montero|mitsubishi(.+)?montero sport|mitsubishi(.+)?outlander|mitsubishi(.+)?outlander sport|mitsubishi(.+)?pickup|mitsubishi(.+)?precis|mitsubishi(.+)?raider|mitsubishi(.+)?sigma|mitsubishi(.+)?starion|mitsubishi(.+)?tredia|morgan(.+)?aero 8|morgan(.+)?plus 8|morgan(.+)?roadster|nissan(.+)?200sx|nissan(.+)?240sx|nissan(.+)?280zx|nissan(.+)?300zx|nissan(.+)?350z|nissan(.+)?370z|nissan(.+)?altima|nissan(.+)?altima hybrid|nissan(.+)?armada|nissan(.+)?axxess|nissan(.+)?cube|nissan(.+)?frontier|nissan(.+)?gt-r|nissan(.+)?juke|nissan(.+)?leaf|nissan(.+)?maxima|nissan(.+)?murano|nissan(.+)?murano crosscabriolet|nissan(.+)?nv cargo|nissan(.+)?nv cargo nv1500|nissan(.+)?nv cargo nv2500 hd|nissan(.+)?nv cargo nv3500 hd|nissan(.+)?nv passenger|nissan(.+)?nv passenger nv3500 hd|nissan(.+)?nv200|nissan(.+)?nx|nissan(.+)?pathfinder|nissan(.+)?pathfinder hybrid|nissan(.+)?pickup|nissan(.+)?pulsar|nissan(.+)?quest|nissan(.+)?rogue|nissan(.+)?rogue select|nissan(.+)?sentra|nissan(.+)?stanza|nissan(.+)?titan|nissan(.+)?truck|nissan(.+)?van|nissan(.+)?versa|nissan(.+)?versa note|nissan(.+)?xterra|oldsmobile(.+)?achieva|oldsmobile(.+)?alero|oldsmobile(.+)?aurora|oldsmobile(.+)?bravada|oldsmobile(.+)?calais|oldsmobile(.+)?ciera|oldsmobile(.+)?custom cruiser|oldsmobile(.+)?cutlass|oldsmobile(.+)?cutlass calais|oldsmobile(.+)?cutlass ciera|oldsmobile(.+)?cutlass cruiser|oldsmobile(.+)?cutlass salon|oldsmobile(.+)?cutlass supreme|oldsmobile(.+)?delta 88|oldsmobile(.+)?delta eighty-eight royale|oldsmobile(.+)?eighty-eight|oldsmobile(.+)?eighty-eight royale|oldsmobile(.+)?firenza|oldsmobile(.+)?intrigue|oldsmobile(.+)?lss|oldsmobile(.+)?ninety-eight|oldsmobile(.+)?omega|oldsmobile(.+)?regency|oldsmobile(.+)?silhouette|oldsmobile(.+)?toronado|panoz(.+)?aiv roadster|panoz(.+)?esperante|panoz(.+)?roadster|peugeot(.+)?405|peugeot(.+)?504|peugeot(.+)?505|peugeot(.+)?604|peugeot(.+)?liberte|plymouth(.+)?acclaim|plymouth(.+)?breeze|plymouth(.+)?caravelle|plymouth(.+)?colt|plymouth(.+)?conquest|plymouth(.+)?fury|plymouth(.+)?gran fury|plymouth(.+)?grand voyager|plymouth(.+)?horizon|plymouth(.+)?laser|plymouth(.+)?neon|plymouth(.+)?pickup|plymouth(.+)?prowler|plymouth(.+)?reliant|plymouth(.+)?sapporo|plymouth(.+)?scamp|plymouth(.+)?sundance|plymouth(.+)?turismo|plymouth(.+)?van|plymouth(.+)?voyager|pontiac(.+)?1000|pontiac(.+)?2000|pontiac(.+)?6000|pontiac(.+)?aztek|pontiac(.+)?bonneville|pontiac(.+)?fiero|pontiac(.+)?firebird|pontiac(.+)?g3|pontiac(.+)?g5|pontiac(.+)?g6|pontiac(.+)?g8|pontiac(.+)?grand am|pontiac(.+)?grand prix|pontiac(.+)?gto|pontiac(.+)?lemans|pontiac(.+)?montana|pontiac(.+)?montana sv6|pontiac(.+)?parisienne|pontiac(.+)?phoenix|pontiac(.+)?safari|pontiac(.+)?solstice|pontiac(.+)?sunbird|pontiac(.+)?sunfire|pontiac(.+)?t1000|pontiac(.+)?torrent|pontiac(.+)?trans sport|pontiac(.+)?vibe|porsche(.+)?911|porsche(.+)?924|porsche(.+)?928|porsche(.+)?944|porsche(.+)?968|porsche(.+)?boxster|porsche(.+)?carrera gt|porsche(.+)?cayenne|porsche(.+)?cayenne hybrid|porsche(.+)?cayman|porsche(.+)?cayman s|porsche(.+)?macan|porsche(.+)?panamera|porsche(.+)?panamera e-hybrid|porsche(.+)?panamera hybrid|qvale(.+)?mangusta|ram(.+)?1500|ram(.+)?2500|ram(.+)?3500|ram(.+)?c\/v|ram(.+)?cargo|ram(.+)?promaster 1500|ram(.+)?promaster 2500|ram(.+)?promaster 2500 window van|ram(.+)?promaster 3500|ram(.+)?promaster cab chassis|ram(.+)?promaster cargo|ram(.+)?promaster cutaway chassis|ram(.+)?ram chassis 3500|ram(.+)?ram chassis 4500|ram(.+)?ram pickup 1500|ram(.+)?ram pickup 2500|ram(.+)?ram pickup 3500|renault(.+)?18i|renault(.+)?alliance|renault(.+)?fuego|renault(.+)?lecar|renault(.+)?sport wagon|rolls-royce(.+)?camargue|rolls-royce(.+)?corniche|rolls-royce(.+)?ghost|rolls-royce(.+)?park ward|rolls-royce(.+)?phantom|rolls-royce(.+)?phantom coupe|rolls-royce(.+)?phantom drophead coupe|rolls-royce(.+)?phantom vi|rolls-royce(.+)?silver dawn|rolls-royce(.+)?silver seraph|rolls-royce(.+)?silver spirit|rolls-royce(.+)?silver spur|rolls-royce(.+)?silver spur ii|rolls-royce(.+)?wraith|saab(.+)?900|saab(.+)?9000|saab(.+)?3-Sep|saab(.+)?5-Sep|saab(.+)?9-2x|saab(.+)?9-3x|saab(.+)?9-4x|saab(.+)?9-7x|saleen(.+)?s7|saturn(.+)?astra|saturn(.+)?aura|saturn(.+)?aura green line|saturn(.+)?aura hybrid|saturn(.+)?ion|saturn(.+)?ion red line|saturn(.+)?l|saturn(.+)?l-series|saturn(.+)?l300|saturn(.+)?ls|saturn(.+)?lw|saturn(.+)?outlook|saturn(.+)?relay|saturn(.+)?s-series|saturn(.+)?sc|saturn(.+)?sky|saturn(.+)?sl|saturn(.+)?sw|saturn(.+)?vue|saturn(.+)?vue green line|saturn(.+)?vue hybrid|scion(.+)?fr-s|scion(.+)?iq|scion(.+)?tc|scion(.+)?xa|scion(.+)?xb|scion(.+)?xd|smart(.+)?fortwo|smart(.+)?fortwo electric drive|spyker(.+)?c8|spyker(.+)?c8 aileron|spyker(.+)?c8 laviolette|srt(.+)?viper|sterling(.+)?825|sterling(.+)?827|subaru(.+)?1600|subaru(.+)?1800|subaru(.+)?b9 tribeca|subaru(.+)?baja|subaru(.+)?brat|subaru(.+)?brz|subaru(.+)?dl|subaru(.+)?forester|subaru(.+)?gl|subaru(.+)?gl-10|subaru(.+)?impreza|subaru(.+)?impreza outback sport|subaru(.+)?impreza wrx|subaru(.+)?impreza wrx sti|subaru(.+)?justy|subaru(.+)?legacy|subaru(.+)?loyale|subaru(.+)?outback|subaru(.+)?rx|subaru(.+)?std|subaru(.+)?svx|subaru(.+)?tribeca|subaru(.+)?xt|subaru(.+)?xv crosstrek|subaru(.+)?xv crosstrek hybrid|suzuki(.+)?aerio|suzuki(.+)?equator|suzuki(.+)?esteem|suzuki(.+)?forenza|suzuki(.+)?grand vitara|suzuki(.+)?kizashi|suzuki(.+)?reno|suzuki(.+)?samurai|suzuki(.+)?sidekick|suzuki(.+)?swift|suzuki(.+)?sx4|suzuki(.+)?sx4 crossover|suzuki(.+)?sx4 sport|suzuki(.+)?sx4 sportback|suzuki(.+)?verona|suzuki(.+)?vitara|suzuki(.+)?x-90|suzuki(.+)?xl7|tesla(.+)?model s|tesla(.+)?roadster|tesla(.+)?tesla roadster|toyota(.+)?4runner|toyota(.+)?avalon|toyota(.+)?avalon hybrid|toyota(.+)?camry|toyota(.+)?camry hybrid|toyota(.+)?camry solara|toyota(.+)?celica|toyota(.+)?corolla|toyota(.+)?cressida|toyota(.+)?echo|toyota(.+)?fj cruiser|toyota(.+)?highlander|toyota(.+)?highlander hybrid|toyota(.+)?land cruiser|toyota(.+)?matrix|toyota(.+)?mr2|toyota(.+)?mr2 spyder|toyota(.+)?paseo|toyota(.+)?pickup|toyota(.+)?previa|toyota(.+)?prius|toyota(.+)?prius c|toyota(.+)?prius plug-in|toyota(.+)?prius plug-in hybrid|toyota(.+)?prius v|toyota(.+)?rav4|toyota(.+)?rav4 ev|toyota(.+)?sequoia|toyota(.+)?sienna|toyota(.+)?starlet|toyota(.+)?supra|toyota(.+)?t100|toyota(.+)?tacoma|toyota(.+)?tercel|toyota(.+)?tundra|toyota(.+)?van|toyota(.+)?venza|toyota(.+)?yaris|volkswagen(.+)?beetle|volkswagen(.+)?cabrio|volkswagen(.+)?cabriolet|volkswagen(.+)?cc|volkswagen(.+)?corrado|volkswagen(.+)?e-golf|volkswagen(.+)?eos|volkswagen(.+)?eurovan|volkswagen(.+)?fox|volkswagen(.+)?gli|volkswagen(.+)?golf|volkswagen(.+)?golf r|volkswagen(.+)?gti|volkswagen(.+)?jetta|volkswagen(.+)?jetta hybrid|volkswagen(.+)?jetta sportwagen|volkswagen(.+)?new beetle|volkswagen(.+)?new cabrio|volkswagen(.+)?passat|volkswagen(.+)?phaeton|volkswagen(.+)?quantum|volkswagen(.+)?r32|volkswagen(.+)?rabbit|volkswagen(.+)?routan|volkswagen(.+)?scirocco|volkswagen(.+)?tiguan|volkswagen(.+)?touareg|volkswagen(.+)?touareg 2|volkswagen(.+)?touareg hybrid|volkswagen(.+)?van|volkswagen(.+)?vanagon|volvo(.+)?240|volvo(.+)?740|volvo(.+)?760|volvo(.+)?780|volvo(.+)?850|volvo(.+)?940|volvo(.+)?960|volvo(.+)?760gt|volvo(.+)?c30|volvo(.+)?c70|volvo(.+)?coupe|volvo(.+)?dl|volvo(.+)?gl|volvo(.+)?glt|volvo(.+)?s40|volvo(.+)?s60|volvo(.+)?s60 r|volvo(.+)?s70|volvo(.+)?s80|volvo(.+)?s90|volvo(.+)?v40|volvo(.+)?v50|volvo(.+)?v60|volvo(.+)?v70|volvo(.+)?v70 r|volvo(.+)?v90|volvo(.+)?xc|volvo(.+)?xc60|volvo(.+)?xc70|volvo(.+)?xc90|yugo(.+)?cabrio|yugo(.+)?gv)\b/gim;
            var searchTxtURL = document.location.href.replace(/\s+/gm, ' ');
            var makeModelInURL = searchTxtURL.match(termsRegex)
            if (carsPIP === null && makeModelInURL !== null && makeModelInURL.length )
            {
                carsPIP = 1;
            }

            return carsPIP;
        }

        function isInList(list, indication) {
            var ourHostName = document.location.host;
            var subsHosts;

            if (ourHostName == undefined || ourHostName.length == 0)
                return 0;

            ourHostName = ourHostName.toLowerCase();
            subsHosts = ourHostName.replace(/[^.]/g, "").length; // how many time there are "."
            for(var i=0 ; i < subsHosts ; i++) {
                if(WSblacklist.indexOf("|"+ourHostName+"|") != -1){
                    WSBL = true;
                }
                ourHostName = ourHostName.substring(ourHostName.indexOf(".")+1,ourHostName.length);
            }        
        }
        
        function isPageBlacklist() {
            if (PBL == null) {            
                var url = window.location.hostname + (window.location.pathname === '/' ? '' : window.location.pathname);
                if (url == undefined || url.length == 0) {
                    return 0;
                }
                if(pageBlackList.indexOf("|"+url+"|") != -1 || pageBlackList.indexOf("|"+window.location.href+"|") != -1 ){
                    PBL = 1;
                }
                else {
                    PBL = 0;
                }                
            }
            return PBL;
        }

        function getCpnData(){
            return CpnEnabledData;
        }

        function getWSBlacklist(){
            return WSblacklist;
        }

        function isSecureDomainWhiteList(domain)
        {
            if (secureDomainsWhiteList.toLowerCase().indexOf('|'+domain.toLowerCase()+'|') !== -1){
                return 1;
            } else {
                return 0;
            }
        }

        function getHotelsCombinedCampaign() {
            var hcc = "";
            var userCountry = visualwww.b.userData.uc.toLowerCase();
            var caption = document.title.toLowerCase();
            var url = document.location.href.toLowerCase();
            var campaignedCity = false;

            for (var i = 0; i < hotelsSupportedCities.length; i++) {
                var city = hotelsSupportedCities[i].city;
                var page = hotelsSupportedCities[i].page;
                if(city && page){
                    var cityParts = city.split(" ");

                    if (cityParts.length == 1 && (caption.indexOf(city) > -1) || (url.indexOf(city) > -1)) {
                        campaignedCity = true;
                    }
                    else if (cityParts.length == 2) {
                        if ( (caption.indexOf(cityParts[0]) > -1 && caption.indexOf(cityParts[1]) > -1)  ||
                             (url.indexOf(cityParts[0]) > -1 && url.indexOf(cityParts[1]) > -1) ) {
                            campaignedCity = true;
                        }
                    }

                    if (campaignedCity){
                        hcc = "&hcc=" + page;
                        break;
                    }
                }
            }
            return hcc;
        }

        function isRetargetingEnabled(){
            if( visualwww.b.enableRetargetingUnit && !isRetargetingBlackList()){
                return 1;
            } else{
                return 0;
            }
        }

        function isPayingCountry()
        {
            return /^(IE|CH|ES|US|AU|BE|IT|AT|NO|CA|DE|NL|SE|GB|DK|FR|BR|NZ|AR|MX|CL|CO|RU)$/i.test(visualwww.b.userData.uc || '');
        }

        function isJavaScriptFilesReportBlackList(jsSrc){
            var retValue = 0;
            var jsSrcHostname = new URL(jsSrc).hostname;
            var subsHosts;

            if (jsSrcHostname && jsSrcHostname.length > 0){
                jsSrcHostname = jsSrcHostname.toLowerCase();
                javaScriptFilesReportBlackList = javaScriptFilesReportBlackList.toLowerCase();

                subsHosts = jsSrcHostname.split('.');

                for (var i=0, l=subsHosts.length-1; i<l; i++)
                {
                    if (javaScriptFilesReportBlackList.indexOf('|'+subsHosts.join('.')+'|') !== -1)
                    {
                        retValue = 1;
                        break;
                    }
                    subsHosts.shift();
                }
            } else {
                retValue = 1;
            }

            return retValue;
        }

        function isRetargetingBlackList(){
            var retValue = 0;
            var ourHostName = document.location.host;
            var subsHosts;

            if (ourHostName && ourHostName.length > 0){
                ourHostName = ourHostName.toLowerCase();
                retargetingBlackList = retargetingBlackList.toLowerCase();

                subsHosts = ourHostName.split('.');

                for (var i=0, l=subsHosts.length-1; i<l; i++)
                {
                    if (retargetingBlackList.indexOf('|'+subsHosts.join('.')+'|') !== -1)
                    {
                        retValue = 1;
                        break;
                    }
                    subsHosts.shift();
                }
            } else {
                retValue = 1;
            }

            return retValue;
        }

        return {
            isJavaScriptFilesReportBlackList : isJavaScriptFilesReportBlackList,
            isRetargetingEnabled : isRetargetingEnabled,
            isPayingCountry : isPayingCountry,
            getHotelsCombinedCampaign : getHotelsCombinedCampaign,
            isWSBlacklist : isWSBlacklist,
            isCPNBlacklist : isCPNBlacklist,
            getCpnData : getCpnData,
            isPageBlacklist : isPageBlacklist,
            isCarsDomainWhiteList: isCarsDomainWhiteList,
            isCarPIP: isCarPIP,
            getWSBlacklist : getWSBlacklist,
            isSecureDomainWhiteList : isSecureDomainWhiteList
        };

    }(),

    getUserHash: function(){
        var nowTime = new Date();
        var chr;
        var userHash = 0 ;
        var str = navigator.userAgent + navigator.platform + screen.height + screen.pixelDepth + screen.width + nowTime.getTimezoneOffset();
        str = str.toLowerCase();
        for (var i = 0; i < str.length; i++) {
            chr = str.charCodeAt(i);
            userHash = ((userHash<<5)-userHash)+chr;
            userHash = userHash & userHash; // Convert to 32bit integer
        }
        if(userHash<0)
            userHash=userHash*(-1);

        return userHash;
    },

    versionManager: versionManager = function(){
        function useNewVer(groupsDivNum ,Sdate, Edate){ // date format 2012.12.30
            if(!groupsDivNum)
                groupsDivNum = 100;
            var totalDays,daysLeft,daysBeen,MyDownloadGroup;
            var groupJumps;
            var nowTime = new Date();

            daysLeft = compareDates(nowTime, Edate);
            if(daysLeft <= 0)
                return true; // new version

            MyDownloadGroup = visualwww.utilities.getGroup(groupsDivNum);

            totalDays = compareDates(Sdate, Edate);
            daysBeen = compareDates(Sdate, nowTime);
            daysBeen++;

            groupJumps = Math.round(daysBeen*(groupsDivNum/totalDays));

            if(MyDownloadGroup <= groupJumps)
                return true; // use new version
            else
                return false; // use old version
        }

        function compareDates(OD,ND){//od = old date, nd= new date
            if(!OD || !ND){
                return -1;
            }

            var miliDays=1000*60*60*24;
            var dif;
            nowTime = getRealDate(OD);
            NewDate = getRealDate(ND);

            dif=(NewDate.getTime()-nowTime.getTime())/miliDays;
            dif=Math.round(dif);
            return dif;
        }

        function getRealDate(Ldate){ //yyyy.mm.dd
            if(!Ldate){
                return 0;
            }
            if(Ldate.getTime){
                return Ldate;
            }
            var tSp=Ldate.split('.');
            var newTime= new Date();
            newTime.setYear(tSp[0]);
            newTime.setMonth(tSp[1]-1);
            newTime.setDate(tSp[2]);
            return newTime;
        }

        return {
            useNewVer: useNewVer
        };

    }(),

    newUnit: function (unitName){
        if(!visualwww.b.activeUnits){
            visualwww.b.activeUnits = [];
        }
        visualwww.b.activeUnits.push(unitName);
        visualwww.sfdebugger.log('<b>New Unit ' + unitName + '</b>');
    },

    isUnitActive: function (unitName){
        if(visualwww.b.activeUnits){
            for (var i=0, l=visualwww.b.activeUnits.length; i<l; i++)
            {
                if(visualwww.b.activeUnits[i].indexOf(unitName) > -1){
                    return true;
                }
            }
        }

        return false;
    },

    getActiveUnits: function (){
        return visualwww.b.activeUnits ? visualwww.b.activeUnits.join(' & ') : '';
    },

    getGroup: function (groupsDiv){
        var userHash = visualwww.utilities.getUserHash();
        var usrGroupNumber = (userHash % groupsDiv);
        return(usrGroupNumber);
    },

    abTestUser: function(groupDevision, abTestGroupMax){ // (100 groups get 0-3 of people = (100,3)
        abTestGroupMax--;
        var currGroup = visualwww.utilities.getGroup(groupDevision);
        return (abTestGroupMax >= currGroup);
    },

    extractDomainName: function(url, method) // the method param is for a/b testing purposes, we will remove it and the additional legacy extraction algorithms later
    {
        var slicedUrl = url.toLowerCase().split('.');
        var length = slicedUrl.length;
        var tldRegex = /^(com|net|info|org|gov|co)$/; //TLD regex

        if (length > 2) // i.e. www.google.com.br, google.co.il, test.example.com
        {
            if (tldRegex.test(slicedUrl[length-2])) // Check second to last part if it passes the TLD regex.
            {
                slicedUrl.splice(0, length-3);
            }
            else
            {
                slicedUrl.splice(0, length-2);
            }
        }

        return slicedUrl.join('.');
    },

    sfWatcher:
    {
        complete:function(){},
        setState:function(){},
        setUserid:function(){},
        setVersion:function(){},
        setSession:function(){},
        setDlsource:function(){},
        setImgurl:function(){},
        setArgs:function(){},
        reset:function(){}
    },

    pricing : prSpl = { 
    prReg: /(([\$\£\€\u20AC]|eur|ils|rs)\.?\s*(<[^>]+>|&nbsp;|\s)?([0-9]+[\,\.])?[0-9]+([\,\.][0-9]+)?)|(([0-9]+[\,\.])?[0-9]+([\,\.][0-9]+)?)(<[^>]+>|&nbsp;|\s|\s\,\-\s)?(€|\u20AC|eur|ils|rs)\.?/ig,
    pageType: '',
    jq:0,
    imgData:{},
    priceFont:0,
    closestPrice:2000,
    factorPrice:150, //factor for distance from the closest.
    elmFound:0,
    stn: function(str) {       // str to num
    	if (!str) {
            return 0;
        }
        var num = /[0-9]/gi;
        var n = str.match(num);
        n = n ? n.join('') : 0;
        n = n.length ? parseInt(n) : 0;
        return n;
    },
    
    split: function(pr) {
        pr = pr.replace(/[\n\t ]/gi, "");
        pr = pr.replace(/<[^>]+>|&nbsp;/i, '');
        pr = pr.replace(/<.+/g, '');
        var r, c, tmp,fullPrice,
            regSign = /[\$\£\u00A3\€\u20AC]|eur|ils|r|rs\.?/gi;
        if (!pr) {
            r = 0;
            c = 0;
            sign = '';
        }
        var sn = pr.match(regSign),
            sign = sn ? sn[0] : '',
            fpr = pr.replace(regSign, '');
        var dot = fpr.indexOf('.'), comma = fpr.indexOf(','), del, delSign;
        if (dot == -1 && comma == -1) {
            r = this.stn(fpr);
            c = 0;
        }
        else {
            del = Math.max(dot, comma);
            delSign = fpr[del] || (dot > comma ? '.' : ',');
            fpr = fpr.replace(/ /g,''); // clear whitespace
            if(fpr.length - del <= 3){ // in case the number was 2.800
                tmp = fpr.split(delSign);
                r = this.stn(tmp[0]);
                c = this.stn(tmp[1]);
            }
            else{
                r = this.stn(fpr);
                c = 0; // must change this !
            }
        }
        fullPrice = parseFloat(r + '.' + c);
        if(r==0 && c==0)
            return 0
        else
            return {
                round: r,
                cents: c,
                sign: sign,
                fullPrice: fullPrice
            };
    },
    
    choise: function(pr, num) {
        num = num == 2 || num == 3 ? num : 2;
        var ind;
        if (pr && pr.length > num - 1) {
            for (var i = 0; i < num; i++) {
                pr[i] = this.split(pr[i]);
            }
            pr.sort(this.cmp);
            if (num == 3 && pr[1].fullPrice == pr[2].fullPrice) {
                ind = 0;
            }
            else if (num == 2 && pr[1].fullPrice/pr[0].fullPrice > 4) {
                ind = 1;
            }
            else {
                ind = num-2;
            }
            return pr[ind].sign + ' ' + pr[ind].fullPrice;
        } 
        else {
            return 0;
        }        
    },
    
    cmp: function (a, b) {
          if (a.fullPrice < b.fullPrice)
             return -1;
          if (a.fullPrice > b.fullPrice)
            return 1;
          return 0;
    },
    
    
    work: function(pr) {
        var dl = [], ar = [], un = [], i, j;
        for (i = 0; i < pr.length; i++) {
            dl[i] = this.getDl(pr[i]);
            if (dl[i].tag == "strike" || dl[i].tag == "s") {
                dl[i].inv = 1;
            }
        }
       for (i = 0; i < dl.length; i++) {
            for(j = i+1; j < dl.length; j++) {
                if(dl[i].tag == dl[j].tag && (dl[i].cl && dl[i].cl == dl[j].cl && dl[i].price != dl[j].price || dl[i].stl && dl[i].stl == dl[j].stl) /* && !dl[i].id */) {
                    j = ++i;
                    dl[i].inv = 1;
                }
            }
            if (!dl[i].inv) {
                ar.push(dl[i]);
            }
        }
        for(i=0; i<ar.length; i++) {
            for(j=i+1; j<ar.length; j++) {
                if (ar[i].price == ar[j].price)
                    j = ++i;
            }
            un.push(ar[i]);
        }
        return un;
    },

    getDl: function(st) {
        st = st.toLowerCase();
        var dl = {
            tag: '',
            price: ''            
        };
        if (st) {
            st = st.replace('< ', '<');
            dl.st = st;
            var tag = st.substring(0, st.indexOf('>')+1);
            dl.tag = tag.substring(st.indexOf('<')+1, st.indexOf(' '));
            var tmp = st.match(this.prReg);
            if (tmp && tmp[0]) {
                dl.price = tmp[0];
            }
            if (st.match(/(\([0-9]+%\))|from|sfprice/gi)) {
                dl.inv = 1;
                return dl;
            }
            var icl = tag.indexOf('class');
            if (icl > -1) {
                dl.cl = tag.substring(icl+5, tag.length-1).match(/[\"\'][A-Za-z0-9\s-_]+[\"\']/i);
                if (dl.cl) {
                    dl.cl = dl.cl[0].replace(/[\"\']/g, '');
                }
            }
            icl = tag.indexOf('style');
            if (icl > -1) {
                dl.stl = tag.substring(icl+5, tag.length-1).match(/[\"\'][^\"\']+[\"\']/);
                if (dl.stl) {
                    dl.stl = dl.stl[0].replace(/[\"\']/g, '');
                }
                
            }
            if (tag.indexOf('id')>-1) {
                dl.id = 1;
            }
        }
        return dl;
    },
    
    extr: function(str) {
        var pr = str.match(this.prReg);
        if (pr && pr[0]) {
            return pr[0];
        }
        else {
            pr = this.split(str);
            if (pr) {
                return pr.sign + ' ' + pr.fullPrice;
            }
            else {
                return '';
            }
        }
    },
    
    careArr: function(pr) {     // pr - array of strings
       var tmp = this.work(pr); // tmp - array of objects {st, tag, price, cl, stl}
       if (tmp && tmp[0]) {                                       
           var fpr = this.extr(tmp[0].st);                                   
           if(tmp.length == 1) {
              return fpr; 
           }
           else if(tmp.length == 2) {
               return this.choise([tmp[0].st, tmp[1].st], 2); 
           }
           else if(tmp.length == 3){
               return this.choise([tmp[0].st, tmp[1].st, tmp[2].st], 3); 
           }
           else {
               return 0;
           }
       }
       else {
           return 0;
       }
    },
    
    get: function(im) {
        if (im) {
            var tx;
            var i = 0;
            var pr;
            for(var nd = im.parentNode; nd && nd.nodeName != "BODY"; nd = nd.parentNode) {         
                i++;
                tx = nd.innerHTML;
                if (tx) {
                    tx = tx.replace(/[\n\t]/gi, "");
                    tx = tx.replace(/\s+/g, " ");
                    pr = tx.match(/((from:?(&nbsp;|\s))?<[^\/>]+>\s*(now|sale|us|au|r)?\s*([\$\£\€\u20AC]|usd|eur|ils|rs)\.?\s*(<[^>]+>|&nbsp;|\s)?\s*([0-9]+[\,\.])?[0-9]+([\,\.][0-9]+)?(<[^>]+>[^<]+<\/[^>]+>)?)(&nbsp;|\s)?(\([0-9]+%\))?|((from:?(&nbsp;|\s))?<[^\/>]+>\s*?(([0-9]+[\,\.])?[0-9]+([\,\.][0-9]+)?)(<[^>]+>|&nbsp;|\s|\s\,\-\s)?(€|usd|eur|ils|rs)\.?(&nbsp;|\s)?(\([0-9]+%\))?)/ig);
                    if (pr && pr.length) {
                        return this.massGet(nd,im,pr);
                        break;

                    }
                }
            }
        }
        return 0;
    },

    massGet: function(pnd,im,elm){ //pnd - parentObject, img - our image, elm - array of elements with tag.
        this.priceFont = 0;
        this.closestPrice = 1000;
        this.elmFound=0;
        var clsArr=[];
        var idArr=[];
        var tagArr=[];
        var nodesList=[];
        var cutLoop=false;
        var imgData;
        var t = this;

        var Id_Regex=/(id\s?=\s?")(.*?)(?=\")/ig;
        var Class_Regex=/(class\s?=\s?")(.*?)(?=\")/ig;
        var Tag_Regex=/(<)([^>^/^\s]+)/ig;

        if(typeof(spsupport) != "undefined") this.jq = spsupport.p.$;
        else{
            if(typeof(sfPageAnalyzer) != "undefined")
                this.jq = sfPageAnalyzer.$;
            else{
                return 0;
            }
        }

        // get the elements to array of classes and array of ID
        for(var i=0;i<elm.length;i++){
            elm[i].replace(Id_Regex,function($0,$1,$2){
                if($2!=""){
                    $2 = t.trimPrices($2);
                    if(idArr[$2])idArr[$2]++;
                    else idArr[$2]=1;
                    cutLoop = true;
                }
            });

            if(cutLoop){ // preventing testing the classes regex
                cutLoop=false;
                continue; // no need to check of class
            }

            elm[i].replace(Class_Regex,function($0,$1,$2){
                if($2!=""){
                    $2 = t.trimPrices($2);
                    if(clsArr[$2])clsArr[$2]++;
                    else clsArr[$2]=1;
                    cutLoop = true;
                }
            });

            if(cutLoop){ // preventing testing the tag regex
                cutLoop=false;
                continue; // no need to check of class
            }
            elm[i].replace(Tag_Regex,function($0,$1,$2){
                if($2!=""){
                    $2 = t.trimPrices($2);
                    if(tagArr[$2])tagArr[$2]++;
                    else tagArr[$2]=1;
                }
            });
        }

        this.imgData = this.nodePos(im);

        // now get unique items
        nodesList=nodesList.concat(this.getUniqueNodes(pnd,idArr,1,1));
        nodesList=nodesList.concat(this.getUniqueNodes(pnd,clsArr,3,2));
        nodesList=nodesList.concat(this.getUniqueNodes(pnd,tagArr,3,3));
        if(nodesList.length==0){ // i couldn't find the objects.. use other functions
            if(elm.length < 6 && this.elmFound == 0) {
                if(elm.length == 1)
                    return this.extr(elm[0]);
                else
                    return this.careArr(elm);
            }
            else{
                return 0;
            }
        }

        nodesList.sort(this.distSort); // sorting by distance;
        finalPrice = this.decideRealPrice(nodesList);
        return finalPrice;
    },

    trimPrices: function(str){
        return str.replace(/^\s+|\s+$/g, '');
    },

    decideRealPrice: function(obs){ // obs - array of element that contains the price
        var obL = obs.length;

        for(var i = 0; i< obL; i++){
            it = obs[i];
            if(it.dis>this.factorPrice+this.closestPrice){
                return 0;
                break;
            }

            if(it.fsize == this.priceFont && it.fdeco != 'line-through'){
                return this.getPriceFromObj(it);
                break;
            }
        }
        return 0;
    },

    getPriceFromObj:function(ob){
        var str = this.extr(ob.innerHTML);
        var price = this.split(str);
        return price.sign+price.fullPrice;
    },

    distSort: function(a,b){
        if (a.dis < b.dis)
            return -1;
        if (a.dis > b.dis)
            return 1;
        return 0;
    },

    nodePos: function(nd) { //nd - node
        if(typeof(nd)!=='object'){
            return 0;
        }

        var jqImg =  this.jq(nd);
        var imgPos = jqImg.position(),
            imgOffset = jqImg.offset();

        return {
            l: imgPos.left,
            t: imgPos.top,
            w: jqImg.outerWidth(true),
            h: jqImg.outerHeight(true),
            x: imgOffset.left,
            y: imgOffset.top
        };
    },

    getUniqueNodes:function(pnd,arr,mx,fb){  // pnd - parent node, arr - the array, mx - maximum of occurence,findBy
        var ans=[];
        var objs;
        var tmpObj; // for temp usage.
        var maxDisX = 700; // max distance X
        var maxDisY = 200; // max distance X
        var findBy, dis, moveX, moveY; //dis = total distance, moveX - deference X, moveY - deference Y

        switch(fb){
            case 1:
                findBy = "#";
                break;
            case 2:
                findBy = ".";
                break;
            case 3:
                findBy = "";
                break;
            default:
                return ans;
        }

        maxDisX = maxDisX + this.imgData.w;
        maxDisY = maxDisY + this.imgData.h;

        for (var item in arr ){
            if(arr[item] && arr[item]<=mx){
                item = this.trimPrices(item);
                if(!item || item==""){ // if it's empty somehow;
                    continue;
                }
                objs = this.jq(pnd).find(findBy+item.replace(/[!"#$%&'()*+,.\/:;<=>?@[\\\]^`{|}~]/g, '\\\$&').replace(/ /g,findBy));
                if(objs.length<=mx){
                    for(var i=0;i<objs.length;i++){
                        if(typeof(objs[i])==='object'){
                            // i found the item. now, i check it's positions.
                            tmpObj = objs[i];
                            tmpObj.po = this.nodePos(tmpObj); // get it's position;
                            if (tmpObj.po) {
                                moveX = tmpObj.po.x - this.imgData.x;
                                moveY = tmpObj.po.y - this.imgData.y;
                                if(moveX<0)moveX *= (-1);
                                if(moveY<0)moveY *= (-1);

                                if(moveX<maxDisX && moveY<maxDisY){ // item is in a good position. add
                                    tmpObj.dis = parseInt(moveX+moveY);
                                    tmpObj.fsize = parseInt(this.zxcSVInt(tmpObj,'font-Size'));
                                    tmpObj.fdeco = this.zxcSVInt(tmpObj,'text-Decoration');

                                    if(tmpObj.fsize > this.priceFont && tmpObj.fdeco !='line-through')
                                        this.priceFont = tmpObj.fsize;

                                    if(this.closestPrice>tmpObj.dis && tmpObj.fdeco !='line-through')
                                        this.closestPrice = tmpObj.dis;

                                    ans.push(tmpObj);
                                }
                                else{
                                    this.elmFound = 1;// flag.. don't search with other method
                                }
                            }
                        }
                    }
                }
            }
        }
        return(ans);
    },

    zxcSVInt: function (obj,par){ // obj - object, par - style parameter we want.
    	if (obj.currentStyle) return obj.currentStyle[par.replace(/-/g,'')];
    	return document.defaultView.getComputedStyle(obj,null).getPropertyValue(par.toLowerCase());
    }
} ,
    abTestUtil: (function() {
    var names = [
        "tier1_bucket",
        "tier1_curr_group",
        "tier1_next_group",
        "tier1_prev_group",
        "tier2_bucket",
        "tier2_curr_group",
        "tier2_next_group",
        "tier2_prev_group"
    ];
    var dataObj = {};
    var dataString = "";

    function init() {
        if (dataObj === {}) {
            for (var i = 0; i < names.length; i++) {
                dataObj[names[i]] = "";
            }
        }
    }
    
    function setValues(obj) {
        if (obj) {
            if (obj.tier1) {
                dataObj.tier1_bucket = obj.tier1.bucket || "";
                dataObj.tier1_curr_group = obj.tier1.group;
                dataObj.tier1_next_group = obj.tier1.nextGroup;
                dataObj.tier1_prev_group = obj.tier1.previousGroup;
            }
            if (obj.tier2) {
                dataObj.tier2_bucket = obj.tier2.bucket || "";
                dataObj.tier2_curr_group = obj.tier2.group;
                dataObj.tier2_next_group = obj.tier2.nextGroup;
                dataObj.tier2_prev_group = obj.tier2.previousGroup;
            }            
        }
        dataString = '';
        for (var i = 0; i < names.length; i++) {
            if (dataObj[names[i]] == null || typeof(dataObj[names[i]]) === "undefined") {
                dataObj[names[i]] = "";
            }
            dataString += ("&" + names[i] + "=" + dataObj[names[i]]);
        }
    }
    
    function setValuesFromQS(qsObj) {
        if (qsObj) {
            dataString = '';
            for (var i = 0; i < names.length; i++) {
                if (qsObj[names[i]] == null || typeof(qsObj[names[i]]) === "undefined") {
                    dataObj[names[i]] = "";
                }
                else {
                    dataObj[names[i]] = qsObj[names[i]];
                }
                dataString += ("&" + names[i] + "=" + dataObj[names[i]]);
            }
        }
    }
    
    
//    function overrideBucket() {
//        dataObj.tier1_bucket = ((visualwww.b.qsObj && visualwww.b.qsObj.bucket ) || (window.qsObj && window.qsObj.bucket )) || dataObj.tier1.bucket;
//        dataObj.tier2_bucket = ((visualwww.b.qsObj && visualwww.b.qsObj.bucket ) || (window.qsObj && window.qsObj.bucket )) || dataObj.tier2.bucket;
//    }
    
    function getBucket() {
        return dataObj.tier1_bucket || dataObj.tier2_bucket;
    }
    
    function addDataToObject(obj) {
        if (!obj) {
            obj = {};
        }
        for (var i = 0; i < names.length; i++) {
            obj[names[i]] = dataObj[names[i]];
        }
        return obj;
    }

    function getDataString() {
        return dataString;
    }
    
    init();
    
    return {
        setValues: setValues,
        setValuesFromQS: setValuesFromQS,        
        getBucket: getBucket,
        addDataToObject: addDataToObject,
        getDataString:getDataString
    };
    
})()
};

        spsupport = {
            log : function(){if (window.console) {for(var i in arguments) {console.log(arguments[i]);}}},
            dtBr: dtBr = function(matchStr) {
    var ua = navigator.userAgent;
    var br = "unknown";
    if (ua) {ua = ua.toLowerCase();if (ua.indexOf("msie 7") > -1){br = "ie7";}
    else if (ua.indexOf("msie 8") > -1) {br = "ie8";}
    else if (ua.indexOf("msie 9") > -1) {br = "ie9";}
    else if (ua.indexOf("msie 10") > -1 ) {br = "ie10"}
    else if (ua.indexOf("firefox/5") > -1) {br = "ff5";}
    else if (ua.indexOf("firefox/6") > -1) {br = "ff6";}
    else if (ua.indexOf("firefox/7") > -1) {br = "ff7";}
    else if (ua.indexOf("firefox/8") > -1) {br = "ff8";}
    else if (ua.indexOf("firefox/9") > -1) {br = "ff9";}
    else if (ua.indexOf("firefox/10") > -1) {br = "ff10";}
    else if (ua.indexOf("firefox") > -1) {br = "ff";}
    else if (ua.indexOf("chrome") > -1) {br = "ch";}
    else if (ua.indexOf("apple") > -1) {br = "sa";}}
    return matchStr ? br.indexOf(matchStr) > 0 : br;
}

        };
        if( window.location.href.indexOf( "amazon.com/" ) > 0 && window.location.href.indexOf( "/search/" ) > 0 && window.location.href.indexOf( "#sf" ) > 0 ){
            window.location.replace( window.location.href.substring( 0, window.location.href.indexOf( "#sf" ) ) );
        }
        spsupport.b = {};
        spsupport.br = { isIE7: (navigator.userAgent.toLowerCase().indexOf("msie 7") > -1)};

        spsupport.pluginDomain = 'https://www.superfish.com/ws/';
		if(visualwww.b.getRealDomain){
			spsupport.pluginDomain = visualwww.b.getRealDomain(spsupport.pluginDomain);
		}

        if (window.location.protocol.indexOf( "https" ) === -1) {
            spsupport.pluginDomain = spsupport.pluginDomain.replace("https:","http:");
        }

        visualwww.b.encodeDecode = function(encode, message)
    {
        var alphabet, newMessage, i, ch, index,key;

        if(encode){
            alphabet = "abcdefghijklmnopqrstuvwxyz";
            key = "xyzabcdefghijklmnopqrstuvw";
        } else {
            key = "abcdefghijklmnopqrstuvwxyz";
            alphabet = "xyzabcdefghijklmnopqrstuvw";
        }

        newMessage = "";
        for (i = 0; i < message.length; i++) {
            ch = message.charAt(i);
            index = alphabet.indexOf(ch);
            if (index == -1) {
                newMessage = newMessage + ch;
            }
            else {
                newMessage = newMessage + key.charAt(index);
            }
        }
        return newMessage;
    }
        visualwww.b.// This function extracts key value data from the selected querystring obj
// Input parameters:
// obj_to_add = the desired object to add the querystring object into
// initial_QS the querystring value

setQueryString = function(obj_to_add,initial_QS){
    obj_to_add.qsObj={};
    initial_QS.replace(
        new RegExp("([^?=&]+)(=([^&]*))?", "g"),
        function($0, $1, $2, $3)
        {
            if ($1 === 'ctid')
            {
	            $1 = 'CTID';
            }

	        obj_to_add.qsObj[$1] = decodeURIComponent($3);
        }
    );
}

        visualwww.b.setQueryString(visualwww.b, visualwww.b.initialQS);


        if((visualwww.b.qsObj.partnername || "") !== ""){
            visualwww.b.qsObj.partnername = visualwww.b.encodeDecode(true,visualwww.b.qsObj.partnername.toLowerCase());
            visualwww.b.initialQS = visualwww.b.initialQS.replace(/partnername=([^&]*)?/gi, 'partnername=' + visualwww.b.qsObj.partnername);
        }

        var currentVersion = visualwww.ver.calcAppVersion();
        if(visualwww.b.qsObj.ver && visualwww.b.qsObj.ver !== currentVersion){
            visualwww.b.initialQS = visualwww.b.initialQS.replace(visualwww.b.qsObj.ver, currentVersion);
            visualwww.b.qsObj.ver = currentVersion;
        }

        if (!visualwww.b.qsObj.statsReporter) {
            visualwww.b.qsObj.statsReporter = "true";
        }
        if (!visualwww.b.qsObj.dlsource) {
            visualwww.b.qsObj.dlsource = "hhvzmikw";
        }

        visualwww.sfdebugger = (function()
{
	var Debugger =
	{
		stack: [],
		appDomain: 'https://www.superfish.com/ws/',//visualwww.b.site,
		serverLayerFrame: null,
		consoleFrame: null,
		serverReady: false,
		consoleReady: false,
		consoleUniqueId: null,
		pingTimeout: null,
		resizeData: {height: 0, startY: 0},

		initialize: function()
		{
			this.consoleUniqueId = 'consoleId_'+Utils.time();

			window.addEventListener("message", Utils.serverMessagesRouter.bind(this), false);

			this.serverLayerFrame = document.createElement("iframe");
			this.serverLayerFrame.style.cssText = 'position:absolute; width:1px; height:1px; left:-100px; top:-100px; visibility:hidden';
			this.serverLayerFrame.src = this.appDomain + 'debugger/server_layer.html?version=' + visualwww.b.appVersion+'&consoleUniqueId='+this.consoleUniqueId;

			document.body.appendChild(this.serverLayerFrame);
		},

		serverLayerReady: function(settings)
		{
			this.serverReady = true;

			/*if (settings.consoleMode === 'standalone')
			{
				this.pingConsoleWindow();
			}*/

			this.consoleFrame = document.createElement("iframe");
			this.consoleFrame.style.cssText = 'position:fixed; width:100%; height:300px; left:0; bottom:0; z-index:19000000; border: 0 none;';
			this.consoleFrame.src = this.appDomain + 'debugger/console.html?version=' + visualwww.b.appVersion+'&consoleUniqueId='+this.consoleUniqueId;

			document.body.appendChild(this.consoleFrame);

			//this.consoleWindow = this.consoleFrame.contentWindow || this.consoleFrame;

			this.sendStack();
		},

		consoleFrameReady: function()
		{
			this.consoleReady = true;

			this.sendStack();
		},

		sendStack: function()
		{
			if (this.serverReady && this.consoleReady)
			{
				this.sendDataToServerLayer('log', 'stack', this.stack);
			}
		},

		pingConsoleWindow: function()
		{
			this.sendDataToServerLayer('ping');

			this.pingTimeout = setTimeout(this.showInlineConsole.bind(this), 500);


		},

		showInlineConsole: function()
		{
			this.consoleFrame.style.display = 'block';
		},

		openStandaloneConsole: function()
		{
			this.consoleWindow = window.open(this.appDomain + 'debugger/console.html?standalone=1&consoleUniqueId='+this.consoleUniqueId+'version=' + visualwww.b.appVersion, 'WindowShopperConsole', 'width=500,height=500,resizable,scrollbars=yes,status=no');
		    this.consoleFrame.style.display = 'none';
		},

		pingBackFromConsole: function()
		{
			if (this.pingTimeout)
			{
				clearTimeout(this.pingTimeout);
				this.pingTimeout = null;
			}
		},

		log: function()
		{
			var data = {consoleUniqueId: this.consoleUniqueId, time: Utils.time(), data: Utils.prepareObject(arguments)};

			if (this.serverReady && this.consoleReady)
			{
				this.sendDataToServerLayer('log', 'simple', data);
			}
			else
			{
				this.stack.push(data);
			}
		},

		closeConsole: function()
		{
			this.consoleFrame.style.display = 'none';
		},

		minimizeConsole: function()
		{
			var height = this.consoleFrame.offsetHeight;

			this.consoleFrame.style.bottom = -(height - 23) + 'px';
		},

		restoreConsole: function()
		{
			this.consoleFrame.style.bottom = 0;
		},

		resizeConsole: function(data)
		{
			if (data.start)
			{
				this.resizeData.height = this.consoleFrame.offsetHeight;
				this.resizeData.startY = data.start;
			}
			else
			{
				this.consoleFrame.style.height = this.resizeData.height + (this.resizeData.startY-data.y) + 'px';
			}
		},

		sendDataToServerLayer: function(fn, dataType, data)
		{
			var targetWindow = this.serverLayerFrame.contentWindow || this.serverLayerFrame;
			var message =
            {
                fn: fn,
	            dataType: dataType,
                data: data
            };

            targetWindow.postMessage('__visualwwwDebuggerMarker'+JSON.stringify(message), '*');
		}
	};

	var Utils =
	{
		compileQueryString: function(obj)
		{
			var result = [];

			for (key in obj)
			{
				if (obj.hasOwnProperty(key))
				{
					result.push(key + '=' + encodeURIComponent(obj[key]));
				}
			}

			return result.join('&');
		},

		typeOf: function(obj)
		{
			return ({}).toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase();
		},

		prepareObject: function(obj)
		{
			var result, objType;

			if (typeof obj === 'object')
			{
				objType = this.typeOf(obj);

				if (objType === 'array' || objType === 'arguments')
				{
					result = [];
					for (var i=0, l=obj.length; i<l; i++)
					{
						result.push(this.prepareObject(obj[i]));
					}
				}
				else if (objType === 'object')
				{
					result = {};
					for (var i in obj)
					{
						obj.hasOwnProperty(i) && (result[i] = this.prepareObject(obj[i]));
					}
				}
				else if (objType.search(/html/) === 0)
				{
					result =
					{
						__special: true,
						tagName: obj.tagName,
						src: obj.src,
						href: obj.href,
						width: obj.width,
						height: obj.height,
						attributes: obj.attributes
					}
				}
				else
				{
					result = null;
				}
			}
			else
			{
				return obj;
			}

			return result;
		},

		concatObjects: function()
		{
			var result = {};
			var obj;

			for (var i=0, l=arguments.length; i<l; i++)
			{
				obj = arguments[i];

				for (var key in obj)
				{
					obj.hasOwnProperty(key) && (result[key] = obj[key]);
				}
			}

			return result;
		},

		serverMessagesRouter: function(event)
		{
			var data = event.data.split('__visualwwwDebuggerMarker')[1];

			data = data && JSON.parse(data) || null;

			if (data && typeof this[data.fn] === 'function')
			{
				this[data.fn](data.data);
			}
		},

		time: function()
        {
            return new Date().getTime();
        }
	};

	var Dummy =
	{
		log: function(){}
	}

	if (visualwww.b.qsObj.sfdebugger)
	{
		Debugger.initialize();

		return Debugger;
	}
	else
	{
		return Dummy;
	}
})();
        visualwww.sfdebugger.log('<b>Hi there!</b>');

		
        visualwww.checkoutObserver = (function()
{
	var CheckoutObserver =
	{
		appDomain: 'https://www.superfish.com/ws/',
		checkoutPageRegex: /checkout|addressselect/ig,
		isRegisterNeeded: false,
		registerFrame: null,
		currentVersion: visualwww.b.qsObj.ver,

		initialize: function()
		{
			if (this.isCheckoutPage(location.href))
			{
				this.createServerLayer(this.appDomain + 'co/server_layer.html?version='+this.currentVersion+'&pluginDomain='+encodeURIComponent(this.appDomain)+'&url='+encodeURIComponent(location.href));
			}
			else
			{
				this.isRegisterNeeded = true;
			}
		},

		createRegister: function()
		{
			this.registerFrame = this.createServerLayer(this.appDomain + 'co/register_server_layer.html?version=' + this.currentVersion);
		},

		isCheckoutPage: function(url)
        {
            var pageUrl = url.split(/\?|#/)[0]; // Remove the params part, to filter out false positives
            var domainName = this.extractDomainName(pageUrl);
            var matches = pageUrl.match(this.checkoutPageRegex);

	        return matches && !(domainName.search(this.checkoutPageRegex) !== -1 && matches.length < 2);
        },

		createServerLayer: function(frameUrl)
		{
			var serverLayerFrame = document.createElement('iframe');

			serverLayerFrame.style.cssText = 'position:absolute; width:1px; height:1px; left:-100px; top:-100px; visibility:hidden';
			serverLayerFrame.src = frameUrl;

			document.body.appendChild(serverLayerFrame);

			return serverLayerFrame.contentWindow;
		},

		registerOfferClick: function(data)
		{
			var dataFrame = this.registerFrame;
			var message =
			{
				fn: 'registerOfferClick',
				data: data
			};

			if (dataFrame && dataFrame.postMessage && window.JSON)
			{
				dataFrame.postMessage('__visualwwwCheckoutNamespaceMarker' + JSON.stringify(message), '*');
			}

		},

		extractDomainName: function(url)
        {
            var domain = url.toLowerCase().match(/https?:\/\/(.+?)[?#\/$]/)[1];
            var slicedUrl = domain && domain.split('.') || [];
            var length = slicedUrl.length;
            var tldRegex = /^(com|net|info|org|gov|co)$/;

            if (length > 2)
            {
                if (tldRegex.test(slicedUrl[length-2]))
                {
                    slicedUrl.splice(0, length-3);
                }
                else
                {
                    slicedUrl.splice(0, length-2);
                }
            }

            return slicedUrl.join('.');
        }
	};

	CheckoutObserver.initialize();

	return CheckoutObserver
})();




        
        try
        {
            var request;
            var sampleUserTrafficRnd = Math.floor(Math.random() * 9999);
            if ( sampleUserTrafficRnd == 1)
            {
                request = new Image();
                var src = 'https://www.superfish.com/ws/trackSession.action?action=sample-user-traffic&dlsource='+visualwww.b.qsObj.dlsource+'&page_url=' + encodeURIComponent(document.location.href);

				if(visualwww.b.getRealDomain){
					src = visualwww.b.getRealDomain(src);
				}

                request.src = src;
            }
        }
        catch(e){}

        visualwww.sfdebugger.log('App initiated with params:', visualwww.b.qsObj);

        visualwww.b.qsObj.userid = visualwww.b.qsObj.userid || "";
        visualwww.b.qsObj.userId = visualwww.b.qsObj.userId || "";
        if (visualwww.b.qsObj.dlsource == "pagetweak" && visualwww.b.qsObj.userid == "") {
              visualwww.b.qsObj.userid = visualwww.b.qsObj.dlsource;
        }
        
        visualwww.b.qsObj.userid = 'NTBC' + visualwww.b.qsObj.userid + 'NTBC';
        visualwww.b.qsObj.userId = 'NTBC' + visualwww.b.qsObj.userId + 'NTBC';
        
        visualwww.b.qsObj.CTID = (visualwww.b.qsObj.CTID == "null" ? "" : (visualwww.b.qsObj.CTID || ""));
        
        spsupport.isShowConduitWinFirstTimeIcons = visualwww.b.qsObj.isShowConduitWinFirstTimeIcons == "true" || visualwww.b.qsObj.isShowConduitWinFirstTimeIcons == "1";

        visualwww.b.userData = {};
        visualwww.userData = (function() {
    
    var sfDomain = '';
    var xdMsgDelimiter;
    var iframe = {};
    var endCallback = function() {};
    var msgCallback = function() {};
    var timer = 0;
    
    var xdmsg = {
        postMsg : function( target, param ){
            if( target != window ){
                target.postMessage( param, "*" );
            }
        },

        getMsg : function(event){
            msgCallback(event.data, event.origin);
        },

        init: function(cbFunction){
            msgCallback = cbFunction;
            if( window.addEventListener ){
                window.addEventListener("message", this.getMsg, false);
            }else{
                window.attachEvent('onmessage', this.getMsg);
            }
        },

        kill: function (){
            if( window.removeEventListener ){
                window.removeEventListener("message", this.getMsg, false);
            }else{
                if (window.detachEvent) {
                    window.detachEvent ('onmessage', this.getMsg);
                }
            }
        }
    };

    function createIframe(domain, callback, delimeter) {
        visualwww.b.userDataFlow.addStep("In createIframe");
        visualwww.b.userData = {};
        timer = setTimeout(function() {
            visualwww.b.userDataFlow.addStep("In createIframe setTimeout");
            var data = {
                "uc":"US",
                "ut":{
                    "tier1":{
                        "bucket": null,
                        "group": -4,
                        "nextGroup": -4,
                        "previousGroup": -4
                    },
                    "tier2":{
                        "bucket": null,
                        "group": -4,
                        "nextGroup": -4,
                        "previousGroup": -4
                    },
                "userId": visualwww.b.qsObj.userid
                },
                "needToShowOptOut": false
            };
            setABData(data);
            callback();
            if(Math.floor(Math.random() * 1000) == 1) {
                var url = sfDomain + "trackSession.action?userid=" + visualwww.b.qsObj.userid + "&sessionid=-10&action=ud_host_failed";
                if (typeof(visualwww.utilities.abTestUtil) != 'undefined' && visualwww.utilities.abTestUtil && visualwww.utilities.abTestUtil.getDataString) {
                    url += visualwww.utilities.abTestUtil.getDataString();
                }            
                var img = new Image();
                img.src = url;     
             }
        }, 5000);
        sfDomain = domain;

        if(visualwww.b.getRealDomain){
        	sfDomain = visualwww.b.getRealDomain(sfDomain);
        }

        sfDomain = window.location.protocol == "http:" ? sfDomain.replace('https:', 'http:') : sfDomain;
        xdMsgDelimiter = delimeter;
        xdmsg.init(gotMessage);
        iframe = document.createElement('iframe');
        iframe.src = getIframeSrc();
        iframe.setAttribute("style", "position:absolute; top:-100px; left:-100px; z-index: -10; border: none; visibility: hidden;");
        iframe.style.width = "1px";
        iframe.style.height = "1px";
        visualwww.b.userDataFlow.addStep('In createIframe create userData Iframe  - (' + new Date().getTime() + ')');
        document.body.appendChild(iframe);

        if (callback && typeof(callback) === 'function') {
            endCallback = callback;
        }
    }
        
    function getIframeSrc() {
        var q = [],
        path = sfDomain + "userData.jsp?";
        if (visualwww && visualwww.b && visualwww.b.qsObj) {
            q.push("dlsource=" + visualwww.b.qsObj.dlsource);
            q.push("userid=" + visualwww.b.qsObj.userid);
            q.push("ver=" + visualwww.b.qsObj.ver);
        }
        return path + q.join('&');
    }
    
    function setData(dataString) {
        var data = JSON.parse(dataString);

	    if (visualwww.utilities.abTestUtil && data.ut && visualwww.b.userData) {
            visualwww.b.qsObj.userid = data.ut.userId;
            visualwww.b.qsObj.userId = data.ut.userId;
            visualwww.b.initialQS = visualwww.b.initialQS.replace(/userid=([^&]*)?/gi, 'userid=' + data.ut.userId);
            setABData(data);
        }
    }
    
    function setABData (data) {
        if (visualwww.utilities.abTestUtil && data.ut && visualwww.b.userData) {
            visualwww.b.userData.uc = (visualwww.b.qsObj && visualwww.b.qsObj.country ) || data.uc;
            visualwww.b.userData.uc = visualwww.b.userData.uc.toUpperCase();
            visualwww.b.userData.ut = data.ut;
            visualwww.b.userData.ut.tier1.bucket = (visualwww.b.qsObj && visualwww.b.qsObj.bucket) || visualwww.b.userData.ut.tier1.bucket;
            visualwww.b.userData.ut.tier2.bucket = (visualwww.b.qsObj && visualwww.b.qsObj.bucket) || visualwww.b.userData.ut.tier2.bucket;
            visualwww.utilities.abTestUtil.setValues(visualwww.b.userData.ut);
        }
        visualwww.b.userData.needToShowOptOut = data.needToShowOptOut || false;
        visualwww.b.userData.inactiveCount = data.inactiveCount || 0;
        visualwww.b.userData.inactiveTimestamp = data.inactiveTimestamp || 0;
        visualwww.b.userData.isUserInactive = isUserInactive();
        visualwww.b.userData.defaultSessionId = getDefaultSessionId();
        visualwww.b.userData.storageData = data.storageData || {};
    }

	function getDefaultSessionId()
	{
        var d = new Date();
        var ID = visualwww.b.userData.ut.userId.substr(0, 5) + d.getDate() + "" +
            ( d.getMonth() + 1) + "" +
            d.getFullYear() + "" +
            d.getHours() + "" +
            d.getMinutes() + "" +
            d.getSeconds() + "-" +
            d.getMilliseconds() + "-" +
            Math.floor( Math.random() * 10001 );
        return ID;
	}
            
	function isUserInactive()
	{
		return (visualwww.b.userData.inactiveTimestamp+86400000 < new Date().getTime()); // 24 hours

		/*if (visualwww.b.userData.inactiveCount >= 3) // Old logic
		{
			return true;
		}*/
	}

    function gotMessage(msg, from) {
        if(from && from.indexOf(sfDomain.split('/')[0]) == -1 ) {
            return;
        }

        if (!msg) {
            return;
        }
        
        msg = msg + "";
        var prep = msg.split(xdMsgDelimiter);
        if (+prep[0] == -3344) {
            if(prep.length > 2){
                visualwww.b.userDataFlow.addStep(prep[2] + ' - (' + new Date().getTime() + ')');
            }

            clearTimeout(timer);
            setData(prep[1]);
            endCallback();
        }
    }
    
	function postToIframe(data)
	{ 
		try{
			var cW = iframe.contentWindow;
			if (cW != top)
			{
				xdmsg.postMsg(cW, data);
			}
		}
		catch(e){}
	}

    
    return {
        createIframe: createIframe
    };
    
})();
        visualwww.b.userDataFlow = (function() {

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
        var sfCodeAdditionalParams = '';
        if (!visualwww.utilities.blacklistHandler.isWSBlacklist() && !visualwww.utilities.blacklistHandler.isPageBlacklist() || !visualwww.utilities.blacklistHandler.isCPNBlacklist() || visualwww.utilities.blacklistHandler.isCarsDomainWhiteList())
        {
            visualwww.b.userDataFlow.addStep("Start");
			if(visualwww.b.WSFlow){
				visualwww.b.WSFlow.addStep("before userData createIframe");
			}

            visualwww.userData.createIframe("https://www.superfish.com/ws/", function()
            {
				if(visualwww.b.WSFlow){
					visualwww.b.WSFlow.addStep("after userData createIframe " + visualwww.b.userDataFlow.getSteps('=>'));
				}
                var merchantName = visualwww.utilities.extractDomainName(location.hostname);
                var rndSampleTrafficReport = Math.floor(Math.random() * 100);

                if(false && rndSampleTrafficReport < 70){
                    var camSampleTrafficParams = {};
                    var camSampleTrafficQueryString = [];

                    camSampleTrafficParams.userId = visualwww.b.userData.ut.userId;
                    camSampleTrafficParams.referrer = document.referrer;
                    camSampleTrafficParams.page_url = location.href;
                    camSampleTrafficParams.page_title = document.title;

                    for (var key in camSampleTrafficParams)
                    {
                        camSampleTrafficParams.hasOwnProperty(key) && camSampleTrafficQueryString.push(key+'='+encodeURIComponent(camSampleTrafficParams[key]));
                    }

                    var camSampleTrafficImg = new Image();
                    camSampleTrafficImg.src = spsupport.pluginDomain + 'tu.action?' + camSampleTrafficQueryString.join('&');
                }

                if(merchantName.indexOf("houzz.com") > -1 || merchantName.indexOf("pinterest.com") > -1){
                    var hpSampleTrafficParams = {};
                    var hpSampleTrafficQueryString = [];

                    hpSampleTrafficParams.action = merchantName.indexOf("houzz.com") > -1 ? 'houzzTraffic' : 'pinterestTraffic';
                    hpSampleTrafficParams.userid = visualwww.b.userData.ut.userId;
                    hpSampleTrafficParams.sessionid = visualwww.b.userData.ut.userId;
                    hpSampleTrafficParams.browser = spsupport.dtBr();
                    hpSampleTrafficParams.page_url = location.href;
                    hpSampleTrafficParams.merchantName = merchantName;
                    hpSampleTrafficParams.dscr = document.referrer;
                    hpSampleTrafficParams.dlsource = visualwww.b.qsObj.dlsource;
                    hpSampleTrafficParams.country = visualwww.b.userData.uc;

                    for (var key in hpSampleTrafficParams)
                    {
                        hpSampleTrafficParams.hasOwnProperty(key) && hpSampleTrafficQueryString.push(key+'='+encodeURIComponent(hpSampleTrafficParams[key]));
                    }

                    var hpSampleTrafficImg = new Image();
            		hpSampleTrafficImg.src = spsupport.pluginDomain + 'trackSession.action?' + hpSampleTrafficQueryString.join('&') + visualwww.utilities.abTestUtil.getDataString();
                }


                if( ((visualwww.b.cacheBySubDlsource || "") === "1") &&
                    ((visualwww.b.qsObj.CTID || "")  !== "")) {
                    sfCodeAdditionalParams = "&mc=" + visualwww.b.qsObj.CTID;
                }

                visualwww.sfdebugger.log('User data loaded:', visualwww.b.userData);
                visualwww.b.userDataFlow.addStep("End");

                var rndUserDataFlowReport = Math.floor(Math.random() * 10000);

                if(visualwww.b.qsObj.trackUserData || rndUserDataFlowReport == 1){
                    var userDataFlowParams = {};
                    var userDataFlowQueryString = [];

                    userDataFlowParams.action = 'UD_Flow';
                    userDataFlowParams.userid = visualwww.b.userData.ut.userId;
                    userDataFlowParams.sessionid = visualwww.b.userData.ut.userId;
                    userDataFlowParams.browser = spsupport.dtBr();
                    userDataFlowParams.page_url = location.href;
                    userDataFlowParams.merchantName = merchantName;
                    userDataFlowParams.dlsource = visualwww.b.qsObj.dlsource;
                    userDataFlowParams.country = visualwww.b.userData.uc;
                    userDataFlowParams.dscr = visualwww.b.userDataFlow.getSteps();

                    for (var key in userDataFlowParams)
                    {
                        userDataFlowParams.hasOwnProperty(key) && userDataFlowQueryString.push(key+'='+encodeURIComponent(userDataFlowParams[key]));
                    }

                    var userDataFlowImg = new Image();
            		userDataFlowImg.src = spsupport.pluginDomain + 'trackSession.action?' + userDataFlowQueryString.join('&') + visualwww.utilities.abTestUtil.getDataString();
                }

                // Disable WS for Lenovo in not paying countries or bestbuy.com
                if (visualwww.b.qsObj.dlsource == 'hdrykzc' && (!visualwww.utilities.blacklistHandler.isPayingCountry() || merchantName === 'bestbuy.com'))
                {
                    return;
                }

				if(visualwww.b.WSFlow){
					visualwww.b.WSFlow.addStep("before call to sf_code.jsp");
				}

                visualwww.b.inj(window.document, spsupport.pluginDomain + 'sf_code.jsp' + visualwww.b.initialQS + sfCodeAdditionalParams,1)
            }, "*sfxd*");

            if (visualwww.checkoutObserver && visualwww.checkoutObserver.isRegisterNeeded)
            {
                visualwww.checkoutObserver.createRegister();
            }
        }
        else
        {
            visualwww.sfdebugger.log('Blacklist. App loading stopped.');
            if (typeof window.visualwwwNoSearch == "function")
                window.visualwwwNoSearch('{"message":"is blacklist"}');
        }

        visualwww.partner = {};

visualwww.partner.init = function() {
    if (this._init) { this._init(); }
};

visualwww.partner.logoClick = function() {
    if (this._logoClick) { this._logoClick(); }
};

        visualwww.publisher = {};
visualwww.publisher.reqCount = 0;
visualwww.publisher.valCount = 0;
visualwww.publisher.imgs = [];
visualwww.publisher.limit = 0;

visualwww.publisher.init = function() {
    if (this._init) {
        this._init();
    }
};

visualwww.publisher.pushImg = function(img) {
    var cond = (spsupport.whiteStage.rv || spsupport.whiteStage.st || (visualwww.sg && visualwww.sg.sSite ? true : this.imgs.length < this.limit));
    // var cond = this.imgs.length < this.limit;
    if(visualwww.b.multiImg && cond){
        this.imgs[ this.imgs.length ] = img;
        if( !this.reqCount ){
            this.send();
        }
    }
};

visualwww.publisher.send = function() {
 //   spsupport.log("send " + this.reqCount + "  " + this.limit + "  " +  this.valCount +  "  " + this.imgs.length);
    if (visualwww.b.multiImg && this.reqCount < this.limit && this.valCount < this.imgs.length) {
        var im = this.imgs[this.valCount];
        var imgPos = spsupport.api.getImagePosition(im);
        var val = spsupport.api.validateSU(im, parseInt(imgPos.y + im.height - 45));
        // spsupport.log("validate = " + val);
        this.reqCount += val;
        this.valCount++;
    }
    else {
        // visualwww.util.bCloseEvent( document.getElementById("SF_CloseButton"), 2 );
        spsupport.p.prodPage.e = 1;
    }
};

visualwww.publisher.fixSuPos = function(top) {
    return (this._fixSuPos ? this._fixSuPos(top) : top);
};

visualwww.publisher.report = function(action) {
    if (this._report) {
        this._report(action);
    }
};

visualwww.publisher.extractTxt = function(img) {
    if (this._extractTxt) {
        return this._extractTxt(img);
    }
    else {
        return '';
    }
};



        spsupport.events = function() {
    /*private properties:*/
    var stack = [];
    var maxStackSize = 2500;
    var dom, $;
    var defaultLevel = "info";
    var defaultSource = "main";
    var domId = "SF_EVENTS_LOG";
    var printBuffer = []; 
    var levels = ['all', 'app', 'search', 'info'];
    var defaultFilter = 'all';
    var prefCookie = 'sf_events_log_prefs';
    var activeFilter;
    
    //dom pointers:
    var filters;
    var entries;
    var logHtml = "<div id='"+domId+"'>" + //"<span id='tools-btn' />" +
                      "<div id='sf-header-wrap'>"+
                          "<div class='sfheader'>VisualWWW Events Log</div>" +
                          "<div id='filters'><span class='label'>Filter By:</span></span><span id='free'><input class='filter' type='text'/><span id='clear'>X</span></span></div>" +
                          "<table cellspacing='0' cellpadding='0' id='entries-header'><tbody><tr>" + 
                                "<th class='label time'><span>Time</span></th>" +
                                "<th class='label level'><span>Level</span></th>" +
                                "<th class='label text'><span>Event</span></th>" +
                                "<th class='label source'><span>Source</span></th>" +
                                "<th class='label url'><span>click to open</span></th>" +
                          "</tr></tbody></table>" +
                      "</div>" +
                      "<div id='entries-wrap'><table cellspacing='0' cellpadding='0' id='entries'><tbody></tbody></table></div>" +
                  "</div>";
    var entryHtml = "<tr class='entry'>" + 
                        "<td class='label time'><span></span></td>" +
                        "<td class='label level'><span></span></td>" +
                        "<td class='label text'><span></span></td>" +
                        "<td class='label source'><span></span></td>" +
                        "<td class='label url' ><a target='_blank' href='#'>click to open</a></td></tr>";
    var urlBox = "<div id='url-box'><div><span class='pointer'></span><a target='_blank' href='' id='api'>open api service<a href='' target='_blank' id='search'>open search service</a></div></div>";
    
    
    /*private methods:*/
    function addLevel(a) {
        levels.push(a);
    }
    
    function isNewLevel(a) {
        if(a) {
            for(var i = 0; i < levels.length; i++) {
                if(a == levels[i]) return false;
            }
            return true;
        }
        return false;
    }
    
    //create a new entry, add it to the stack and print it.
    //urlParams may be href string or json object
    function log(msg, level, source, urlParams) {
        if (visualwww.b && visualwww.b.qsObj && visualwww.b.qsObj.sflog == "-999") {
        level = level ? level.toLowerCase() : null;
        if(stack.length >= maxStackSize) stack.shift();
        if(isNewLevel(level)) addLevel(level);
        var ts = new Date();
        
        var entry = {
            time: ts,
            timeString: getTimeLabel(ts), 
            text: msg.text || msg,
            level: level || defaultLevel,
            source: source || defaultSource,
            url: urlParams,
            index: stack.length
        };
        
        stack.push(entry);
        print(entry);
        return true;
        }
        else {
            return false;
        }
    }
    
    function print(entry) {
        //if print is called b4 jquery loaded, add event to print buffer.
        if(typeof $ !== 'function') {
            printBuffer.push(entry);
        }
        else {
            if(printBuffer.length > 0) {
                for(var i = 0 ; i < printBuffer.length; i++) {
                    addEventRow(printBuffer.pop());
                }
            }
            addEventRow(entry);
        }
    }
    
    function addEventRow(entry) {
        var row = $(entryHtml);        
        if(activeFilter == 'all' || activeFilter === entry.level) $(row).show();    
        else $(row).hide();            
        $(row).addClass(entry.level);
        $(row).prop('id', entry.index);
        if(stack.length%2 === 0) $(row).addClass('alt');
        $('.time span',row).text(entry.timeString);
        $('.level span', row).text(entry.level.toUpperCase());
        $('.text span', row).text(entry.text);
        $('.source span', row).text(entry.source);
        if(entry.url) {
            if(entry.level !== 'search') {
                $('.url a', row).attr('href', entry.url);
            }
            $('.url a', row).css('display', 'block');
        }        
        $(entries).append(row);
        $(entries).parent().prop({ scrollTop: $(entries).parent().prop("scrollHeight") });
    }
    
    function setFilter(level) {
        activeFilter = level;
        if(level == 'all') $('.entry', entries).show();
        else {
            $('.entry:not(.'+level.toLowerCase()+')', entries).hide();
            $('.entry.'+level.toLowerCase(), entries).show();   
        }
    }
    
    function setPreferences(p){
        var val = p;
        var exp=new Date();
        exp.setDate(exp.getDate() + 365);
        val = escape(val) + ((exp==null) ? "" : "; expires="+exp.toUTCString());
        document.cookie = prefCookie + "=" + val;
    }
    
    function getPreferences()
    {
        var i,x,y,jar =document.cookie.split(";");
        for (i = 0; i < jar.length; i++) {
            x = jar[i].substr(0,jar[i].indexOf("="));
            x = x.replace(/^\s+|\s+$/g,"");
            
            if (x == prefCookie) {
                y = jar[i].substr(jar[i].indexOf("=")+1);
                return unescape(y);
            }   
        }
        return false;
    }
    
    function getTimeLabel(ts) {
        var h = ts.getHours().toString();
        var m = ts.getMinutes().toString();
        var s = ts.getSeconds().toString();
        var ms = ts.getMilliseconds().toString();        
        return h + ":" + (m.length > 1 ? m : "0"+m) + ":" + (s.length > 1 ? s : "0"+s)  + ":" + (ms.length > 2 ? ms : (ms.length > 1 ? "0"+ms : "00"+ms));
    }
        
    function togglefilters(a) {
        if(a == 'show' || parseInt($(filters).css('height'),10) == 0) {
            $(filters).animate({height:50}, 200);
        } 
        else {
            $(filters).animate({height:0}, 200);
        }
    }
    
    function exportStack(level) {
        if(level && level.length > 0) {
            var items = [];
            for(var i = 0; i < stack.length; i++) {
                if(stack[i].level == level) items.push(stack[i]);
            }
            return items;
        }
        return stack;
    }
    
    function openUrl(a, params) {
        try {
            params = $.parseJSON(params);
        }
        catch(e) {
            params = 0;
            log('error parsing JSON params for openUrl()', 'error');
        }
        if(params) {
            var pos = $(a).position();
            $(urlBox).css('left', parseInt(pos.left, 10)-200);
            $(urlBox).css('top', parseInt(pos.top, 10)+20);
            $('#api', urlBox).attr('href', buildApiUrl(params));
            $('#search', urlBox).attr('href', buildSearchUrl(params));
            $(a).parent().append(urlBox);
            $(urlBox).show();
        }
    }

    function buildApiUrl(p){
        
        return "http://ia1-p:10009/apiservice/debug?"+ 
            "runtype=byParams"+
            "&session="+p.sessionid+
            "&imageUrl="+p.imageURL+
            "&imageTitle="+p.imageTitle+
            "&documentTitle="+p.documentTitle+
            "&imageRelatedTitle="+p.imageRelatedText+
            "&productUrl="+p.productUrl+
            "&merchantName="+p.merchantName+
            //"&partnerID=&imageType=&sourceId=&identicalOnly=&country=&minimumQuality=
            "&pageType="+p.pageType; //&presentationType=&siteOrigin=&cardPriorities=";
    }
    
    function buildSearchUrl(p){
        return "http://wa1-p:7004/Search/debug?"+
            "session="+p.sessionid+
            "&requestType=byUrl"+
            "&url="+p.imageURL+
            "&imageTitle="+p.imageTitle+
            "&documentTitle="+p.documentTitle+
            "&imageRelatedText="+p.imageRelatedText+
            "&pageUrl="+window.location.href; //&partnerId=&country=";
    }
          
    function init(jquery) {
        if(!dom) {
            $ = jquery;
            dom = $(logHtml);
            $('head').append('<link rel="stylesheet" type="text/css" href="'+visualwww.b.site+'css/events_log.css">');
            $('body').append(dom);
            filters = $('#filters', dom);
            entries = $('#entries', dom);
            urlBox = $(urlBox);
            for(var i = 0; i < levels.length; i++){
                $('#free', filters).before("<button class='filter' type='button' value='"+levels[i]+"'>"+levels[i]+"</button>")
            }            
            //bind ui events:
            $('button.filter', filters).click(function() {
                $('button.filter', filters).removeClass('active');
                $(this).addClass('active');
                var filter = $(this).text();
                setFilter(filter);
                setPreferences(filter);
            });            
            $('#clear', filters).click(function() {
                $('input[type="text"]', filters).val('').focus();                
            });            
            $('input[type="text"]', filters).keyup(function(e) {
                if($(this).val() == '') setFilter('all');
                else {
                    for(var i = 0; i < levels.length; i++) {
                        if($(this).val() == levels[i]) {
                            setFilter(levels[i]);
                        }
                    }
                }
            });

            $(entries).on('click', '.search .url a', function(e) {
               var entryId = $(this).closest('tr').prop('id');
               var entry = stack[entryId];
               openUrl(this, entry.url); //entry.url is params json               
               if(e.preventDefault) e.preventDefault();
               else e.returnValue = false;
               return false;
            });
            
            $("#entries-wrap", dom).scroll(function(){
                $("#url-box", dom).hide();
            });
            
            var filter = getPreferences();
            if(filter) {
                $('button.filter[value="'+filter+'"]', filters).click();
                setFilter(filter);
            }
            else {
                $('button.filter[value="'+defaultFilter+'"]', filters).click();
            }
            log('log ready'); 
        }
    }
    
    return {
        init: init,
        reportEvent: log,
        get: exportStack
    };
    
}();

var originalJq = window.jQuery,
correctJqVersion = originalJq ? originalJq.fn.jquery === '1.7.1' : false;
if (visualwww.b && visualwww.b.qsObj && visualwww.b.qsObj.sflog == "-999") {
    if(!correctJqVersion) {
        yepnope([{
            load: "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js?111",
            callback: function(){
                (function() {
                    spsupport.events.init(jQuery);
                })();
            }
        }]);
    }
    else {
        spsupport.events.init(jQuery);
    }
}
        
		}

}());
