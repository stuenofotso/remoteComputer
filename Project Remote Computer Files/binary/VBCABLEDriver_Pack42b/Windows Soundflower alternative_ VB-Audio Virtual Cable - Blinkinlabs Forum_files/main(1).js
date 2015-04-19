(function()
{
	var Slider =
	{
		initialized: false,
		slideUpIndex: 14,
		unitVariation: null,
		autoActionTimer: null,
		scrollPosition: null,
		items: [],
		$: null,

		view:
		{
			self: null,
			items: null
		},

		scroller:
		{
			page: 0
		},

		variations:
		{
			sideSlider:
			{
				title: 'Recently Viewed Deals',
				reportPrefix: 'side slider',
				closeKey: 'retargetingBannerClosed',
				disableKey: 'retargeting'
			},
			popularProductsSlider:
			{
				title: 'Special Deals',
				reportPrefix: 'pop slider',
				closeKey: 'popularProductsClosed',
				disableKey: 'popularProducts'
			}
		},

		initialize: function(items, slideUpIndex)
		{
			this.items = (typeof items == 'object') ? items : (JSON.parse(items) || []);
			this.slideUpIndex = slideUpIndex || 14;
			this.$ = spsupport.p.$;
			this.testBucket = visualwww.utilities.abTestUtil.getBucket();
			this.unitVariation = this.getUnitVariation(this.slideUpIndex);

			if (this.items.length)
			{
				this.initialized = true;

				this.calculateScroller();
				this.processItems();
				this.render();
				this.calculateScrollerButtons();
				this.renderInfo();
				this.activate();
				this.positionToView();

				this.reportAction('shown');
			}
		},

		getUnitVariation: function(slideUpIndex)
		{
			var result;

			switch (slideUpIndex)
			{
				case 15:
					result = this.variations['popularProductsSlider'];
					break;
				case 14:
				default:
					result = this.variations['sideSlider'];
					break;
			}

			return result;
		},

		isUnitClosed: function(slideUpIndex)
		{
			var unitVariation = this.getUnitVariation(slideUpIndex);
			var closeKey = unitVariation.closeKey;
			var closedTimestamp = parseInt(visualwww.b.userData.storageData[closeKey]) || 0;

			return (closedTimestamp + 86400000 > new Date().getTime()); // 24 hours
		},

		calculateScroller: function()
		{
			this.scroller.page = 0;
			this.scroller.itemWidth = 98;
			this.scroller.itemsPerPage = 4;
			this.scroller.width = this.items.length * this.scroller.itemWidth;
			this.scroller.numOfPages = Math.ceil(this.items.length / this.scroller.itemsPerPage);
		},

		processItems: function()
		{
			var item;
			var https = window.location.protocol.indexOf('https') > -1;

			for (var i=0, l=this.items.length; i<l; i++)
			{
				item = this.items[i];

				item.itemWidth = this.scroller.itemWidth;
				item.merchURL = item.merchURL.replace(/slideUP=[0-9]+/gi, 'slideUP='+this.slideUpIndex).replace(/'/g, '\\\'');
				item.imagePath = https ? item.imagePath.replace('http:', 'https:') : item.imagePath;

				if (item.freeShipping)
				{
					item.feature_label = 'free_shipping';
				}

				if (item.bestPrice)
				{
					item.feature_label = 'best_price';
				}

				if (item.rating) // Set item rating
				{
					item.renderRating = (Math.round(item.rating * 2) / 2) * 10;
				}
				else
				{
					item.renderRating = 0;
				}

				this.items[i] = item;
			}
		},

		render: function()
		{
			var additionalClass = '';

			this.$('body').append(visualwww.Template.render('sideSliderContainer',
			{
				additionalClass: additionalClass,
				title: this.unitVariation.title,
				partnerName: visualwww.b.qsObj.partnername ? visualwww.b.encodeDecode(false,visualwww.b.qsObj.partnername) : visualwww.b.psuSupportedByText,
				scrollerWidth: this.scroller.width,
				itemsCount: this.items.length,
				items: this.items
			}));

			this.view.self = this.$('#visualwww_side_slider');
			this.view.scrollButtons = this.$('.scroll_button', this.view.self);
			this.view.scrollerContainer = this.$('.items_scroller_container', this.view.self);
			this.view.scroller = this.$('.items_scroller', this.view.self);
			this.view.items = this.$('.side_slider_item', this.view.self);
		},

		activate: function()
		{
			this.$('._merchant_click', this.view.self).click(this.merchantClick.bind(this));
			this.view.scrollButtons.click(this.scroll.bind(this));
			this.$('._collapse', this.view.self).click(this.collapse.bind(this, true));
			this.$('._expand', this.view.self).click(this.expand.bind(this, true));
			this.$('._show_info', this.view.self).click(this.showInfo.bind(this));
			this.$('._close_unit', this.view.self).click(this.closeUnit.bind(this));
		},

		activateNewItems: function()
		{
			this.$('._merchant_click', this.view.self).click(this.merchantClick.bind(this));
		},

		positionToView: function()
		{
			var unitWidth = this.view.self.width();

			this.view.self.css({right: -unitWidth});

			this.view.self.animate({right: 0},
			{
				duration: 200,
				complete: this.setTimingActions.bind(this)
			});
		},

		setTimingActions: function()
		{
			this.autoActionTimer = setTimeout(function()
			{
				this.expand();

				this.autoActionTimer = setTimeout(this.collapse.bind(this), 30000);
				this.scrollPosition = window.pageYOffset || document.documentElement.scrollTop;

				this.$(document).bind('scroll.slider', this.onScrolling.bind(this));

			}.bind(this), 5000);

			this.view.self.one('mouseover', function()
			{
				this.cancelAutoActionTimer();
				this.expand();

			}.bind(this));
		},

		cancelAutoActionTimer: function()
		{
			this.autoActionTimer && clearTimeout(this.autoActionTimer);
			this.autoActionTimer = null;
		},

		onScrolling: function(event)
		{
			var currentScrollPosition = window.pageYOffset || document.documentElement.scrollTop;

			if (Math.abs(currentScrollPosition - this.scrollPosition) > 100)
			{
				this.cancelAutoActionTimer();
				this.collapse();
				this.$(document).unbind('scroll.slider');
			}
		},

		collapse: function(isUserInitiated)
		{
			this.view.self.addClass('mini');

			this.view.scrollerContainer.animate({width: this.scroller.itemWidth},
			{
				duration: 200
			});

			isUserInitiated && this.reportAction('collapsed');
		},

		expand: function(isUserInitiated)
		{
			var targetWidth = Math.min(this.scroller.itemWidth * this.scroller.itemsPerPage, this.items.length * this.scroller.itemWidth);

			this.view.scrollerContainer.animate({width: targetWidth},
			{
				duration: 200,
				complete: function()
				{
					this.view.self.removeClass('mini');
				}.bind(this)
			});

			isUserInitiated && this.reportAction('expanded');
		},

		hideSelf: function()
		{
			if (this.initialized)
			{
				var unitWidth = this.view.self.width();

				this.view.self.animate({right: -(unitWidth+20)},
				{
					duration: 200,
					complete: function()
					{
						this.view.self.hide();
					}.bind(this)
				});

				this.hidden = true;
			}
		},

		unhideSelf: function()
		{
			this.view.self.show();

			this.view.self.animate({right: 0},
			{
				duration: 200
			});

			this.hidden = false;
		},

		closeUnit: function()
		{
			var messageData =
			{
				cmd: 12,
				closeKey: this.unitVariation.closeKey
			};

			visualwww.b.userData.storageData[this.unitVariation.closeKey] = new Date().getTime();

			visualwww.util.sendRequest(JSON.stringify(messageData));
			this.hideSelf();
			this.reportAction('closed');
		},

		scroll: function(event)
		{
			var scroller = this.scroller;
			var direction = parseInt(event.currentTarget.getAttribute('data-scroll-direction')) || 0;
			var targetPage = scroller.page+direction;

			if (targetPage <= 0)
			{
				targetPage = 0;
			}
			else if (targetPage >= scroller.numOfPages-1)
			{
				targetPage = scroller.numOfPages-1;
			}

			scroller.page = targetPage;

			this.view.scroller.animate({left: -targetPage*scroller.itemWidth*scroller.itemsPerPage},
			{
				duration: 300,
				easing: 'linear',
				complete: this.calculateScrollerButtons.bind(this)
			});

			if (direction > 0)
			{
				this.reportAction('scrolled forward')
			}
			else
			{
				this.reportAction('scrolled back')
			}
		},

		calculateScrollerButtons: function()
		{
			var scroller = this.scroller;
			var leftButton = this.$(this.view.scrollButtons[0]);
			var rightButton = this.$(this.view.scrollButtons[1]);

			if (scroller.numOfPages == 1)
			{
				this.view.scrollButtons.addClass('hidden');
			}
			else
			{
				if (scroller.page == 0)
				{
					leftButton.addClass('hidden');
				}
				else
				{
					leftButton.removeClass('hidden')
				}

				if (scroller.page == scroller.numOfPages-1)
				{
					rightButton.addClass('hidden');
				}
				else
				{
					rightButton.removeClass('hidden')
				}
			}
		},

		merchantClick: function(event)
		{
			var url = event.currentTarget.getAttribute('data-merchant-url');

			event.preventDefault();

			window.open(url);
			spsupport.api.offerClick(url, this.slideUpIndex);
		},

		showInfo: function()
		{
			visualwww.info.ev(
			{
				position: 'fixed',
				left: 'auto',
				right: 15,
				bottom: 20,
				zIndex: 19000001
			}, 1, 1);

			visualwww.info.setUnitConfiguration(this.unitVariation.disableKey,
			{
				sessionId: spsupport.p.initialSess,
				showAdditional: true
			});
		},

		renderInfo: function()
		{
			var info = visualwww.info;

			info.jInfo = this.$('#' + info.infoId);

			if (info.jInfo.length == 0)
			{
				info.jInfo = this.$(info.ci(spsupport.p.sfDomain, visualwww.b.dlsource, visualwww.b.userid, visualwww.b.CD_CTID, visualwww.b.appVersion)).appendTo(document.body);
				info.jIfr = this.$('#' + info.infoId + '_CONTENT', info.jInfo);

				this.$('.closeButton', info.jInfo).click(function()
				{
					info.close();
				});
			}

		},

		kill: function()
		{
			if (this.view.self)
            {
                this.view.self.empty().remove();
            }
		},

		reportAction: function(action)
		{
			var pixel = new Image();
			var prefix = this.unitVariation.reportPrefix;
			var reportData = Utils.concatObjects(visualwww.utilities.abTestUtil.addDataToObject(),
			{
				action: prefix+' '+action,
				userid: spsupport.p.userid,
				sessionid: spsupport.p.initialSess
			});

			pixel.src = spsupport.p.sfDomain + 'trackSession.action?' + Utils.compileQueryString(reportData);
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
		}
	};

	visualwww.slider = Slider;
})();
