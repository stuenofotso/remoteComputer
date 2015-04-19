(function()
{
	var Slideup =
	{
		initialized: false,
		renderingMode: 'normal',
		slideUpIndex: 10,
		unitVariation: null,
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
			bottomBanner:
			{
				title: 'Special Offers',
				reportPrefix: 'bottom banner',
				closeKey: 'bottomBannerClosed'
			},
			topBanner:
			{
				title: 'Visual Search Results',
				reportPrefix: 'top banner',
				closeKey: 'topBannerClosed'
			},
			retargeting:
			{
				title: 'Recently Viewed Items',
				reportPrefix: 'retargeting',
				closeKey: 'retargetingBannerClosed'
			}
		},

		initialize: function(items, slideUpIndex)
		{

			this.items = (typeof items == 'object') ? items :  (JSON.parse(items) || []);
			this.slideUpIndex = slideUpIndex || 10;
			this.$ = spsupport.p.$;
			this.testBucket = visualwww.utilities.abTestUtil.getBucket();
			this.unitVariation = this.getUnitVariation(this.slideUpIndex);

			this.setRenderingMode();


			if (this.items.length)
			{
                if(slideUpIndex !== 11 && visualwww.utilities.getActiveUnits() != '') {
                    visualwww.sfdebugger.log('<b>No need to show bottomBanner/retargeting - Showing Ads</b>');
                    return;
                }

				visualwww.utilities.newUnit('slideup2_'+this.unitVariation.reportPrefix);

				if (!this.initialized)
				{
					this.initialized = true;
					this.preRender();
					this.calculateScroller();
					this.processItems();
					this.render();
					this.calculateScrollerButtons();
					this.renderInfo();
					this.activate();
					this.positionToView();
				}
				else
				{
					this.calculateScroller();
					this.processItems();
					this.renderNewItems();
					this.calculateScrollerButtons();
					this.activateNewItems();
				}

				this.reportAction('shown');
			}
		},

		getUnitVariation: function(slideUpIndex)
		{
			var result;

			switch (slideUpIndex)
			{
				case 11:
					result = this.variations['topBanner'];
					break;
				case 13:
					result = this.variations['retargeting'];
					break;
				default:
					result = this.variations['bottomBanner'];
					break;
			}

			return result;
		},

		isUnitClosed: function(slideUpIndex)
		{
			var unitVariation = this.getUnitVariation(slideUpIndex);
			var closeKey = unitVariation.closeKey;
			var closedTimestamp = parseInt(visualwww.b.userData.storageData[closeKey]) || 0;

			return (closedTimestamp + 21600000 > new Date().getTime()); // 6 hours
		},

		setRenderingMode: function()
		{
			var viewPortHeight = document.documentElement.clientHeight;

			this.renderingMode = viewPortHeight < 800 ? 'mini' : 'normal';

			return this.renderingMode;
		},

		preRender: function()
		{
			this.spacer = this.$('<div/>', {id: '_sf_slideup_spacer'});

			if (this.renderingMode === 'mini')
			{
				this.spacer.addClass('mini');
			}

			this.spacer.appendTo(document.body);
		},

		calculateScroller: function()
		{
			var combinedArrowsWidth = this.renderingMode == 'mini' ? 80 : 100;
			var minItemWidth = this.renderingMode == 'mini' ? 220 : 280;
			var viewportWidth = document.documentElement.clientWidth || this.spacer.width();
			var availableWidth = viewportWidth - combinedArrowsWidth;
			var possibleItems = Math.floor(availableWidth / minItemWidth); // The number of item on a single "page"

			this.scroller.page = 0;
			this.scroller.itemsPerPage = (this.items.length >= possibleItems) ? possibleItems : this.items.length;
			this.scroller.numOfPages = Math.ceil(this.items.length / this.scroller.itemsPerPage);

			this.scroller.itemWidth = Math.floor(availableWidth / this.scroller.itemsPerPage);

			if (this.scroller.numOfPages == 1)
			{
				this.scroller.itemWidth = Math.min(this.scroller.itemWidth, this.renderingMode == 'mini' ? 280 : 380);
			}

			this.scroller.width = this.scroller.itemWidth * this.items.length;
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
			var additionalClass = (visualwww.b.slideup2searchget) ? 'static_top' : '';
			var resultHTML = visualwww.Template.render('slideupContainer',
			{
				renderingMode: this.renderingMode,
				additionalClass: additionalClass,
				title: this.unitVariation.title,
				partnerName: visualwww.b.qsObj.partnername ? visualwww.b.encodeDecode(false,visualwww.b.qsObj.partnername) : visualwww.b.psuSupportedByText,
				itemWidth: this.itemWidth,
				scrollerWidth: this.scroller.width,
				itemsCount: this.items.length,
				items: this.items
			});

			if (visualwww.b.slideup2searchget)
			{
				this.$('#top_nav').after(resultHTML);
			}
			else
			{
				this.$('body').append(resultHTML);
			}

			this.view =
			{
				self: this.$('#visualwww_slideup'),
				scrollButtons: this.$('.scroll_button', this.view.self),
				scroller: this.$('.items_scroller', this.view.self),
				items: this.$('.slideup_item', this.view.self)
			};
		},

		renderNewItems: function()
		{
			this.$('.items_scroller_container', this.self).empty().append(visualwww.Template.render('slideupItemsContainer',
			{
				itemWidth: this.itemWidth,
				scrollerWidth: this.scroller.width,
				itemsCount: this.items.length,
				items: this.items
			}));

			this.view.scroller = this.$('.items_scroller', this.view.self);
			this.view.items = this.$('.slideup_item', this.view.self);

			if (this.hidden)
			{
				this.unhideSelf();
			}
		},

		activate: function()
		{
			this.$('._merchant_click', this.view.self).click(this.merchantClick.bind(this));
			this.view.scrollButtons.click(this.scroll.bind(this));
			this.$(window).resize(this.recalculateScroller.bind(this));
			this.$('._collapse', this.view.self).click(this.collapse.bind(this));
			this.$('._expand', this.view.self).mouseenter(this.expand.bind(this));
			//this.$('._hide_bubble', this.view.self).click(this.hideBubble.bind(this));
			this.$('._show_info', this.view.self).click(this.showInfo.bind(this));
			this.$('._close_unit', this.view.self).click(this.closeUnit.bind(this));
		},

		activateNewItems: function()
		{
			this.$('._merchant_click', this.view.self).click(this.merchantClick.bind(this));
		},

		positionToView: function()
		{
			//var hiddenTimestamp = parseInt(localStorage.getItem('__sfSlideupHidden')) || 0;
			var unitHeight = this.view.self.height();

			this.view.self.css({bottom: -unitHeight});

			/*if (1!=1 && hiddenTimestamp+(10*60*1000) > new Date().getTime())
			{
				this.spacer.hide();

				this.view.self.addClass('collapsed');
				setTimeout(function(){this.view.self.addClass('hidden');}.bind(this), 1000);
			}
			else
			{*/
				this.view.self.animate({bottom: 0}, 200);
			//}
		},

		merchantClick: function(event)
		{
			var url = event.currentTarget.getAttribute('data-merchant-url');

			event.preventDefault();

			window.open(url);
			spsupport.api.offerClick(url, this.slideUpIndex);
		},

		collapse: function()
		{
			var unitHeight = this.view.self.height();

			this.view.self.animate({bottom: -unitHeight},
			{
				duration: 200,
				complete: function()
				{
					this.view.self.addClass('collapsed');
					this.spacer.hide();

				}.bind(this)
			});

			//localStorage.setItem('__sfSlideupHidden', new Date().getTime());

			//spsupport.api.retargetingResetCounter(this.slideUpIndex);
			this.reportAction('collapsed');
		},

		expand: function()
		{
			this.view.self.removeClass('collapsed hidden');

			this.view.self.animate({bottom: 0},
			{
				duration: 200,
				complete: function()
				{
					this.spacer.show();
				}.bind(this)
			});

			localStorage.removeItem('__sfSlideupHidden');

			//spsupport.api.retargetingResetCounter(this.slideUpIndex);
			this.reportAction('restored');
		},

		hideSelf: function()
		{
			if (this.initialized)
			{
				var unitHeight = this.view.self.height();

				this.view.self.animate({bottom: -(unitHeight+20)},
				{
					duration: 200,
					complete: function()
					{
						this.view.self.hide();
						this.spacer.hide();
					}.bind(this)
				});

				this.hidden = true;
			}
		},

		unhideSelf: function()
		{
			this.view.self.show();

			this.view.self.animate({bottom: 0},
			{
				duration: 200,
				complete: function()
				{
					this.spacer.show();
				}.bind(this)
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

		/*hideBubble: function()
		{
			this.$('.collapsed_popup', this.view.self).hide();

			this.reportAction('slideup bubble closed');
		},*/

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

			//spsupport.api.retargetingResetCounter(this.slideUpIndex);
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

		recalculateScroller: function()
		{
			var scroller = this.scroller;
			var currentRenderingMode = this.renderingMode;

			if (this.setRenderingMode() !== currentRenderingMode)
			{
				if (this.renderingMode === 'mini')
				{
					this.view.self.addClass('mini');
					this.spacer.addClass('mini');
				}
				else
				{
					this.view.self.removeClass('mini');
					this.spacer.removeClass('mini');
				}

				if (this.view.self.hasClass('collapsed'))
				{
					this.view.self.css('bottom', -this.view.self.height());
				}
			}

			this.calculateScroller();
			this.calculateScrollerButtons();

			this.view.items.width(scroller.itemWidth);

			this.view.scroller.css(
			{
				width: scroller.width,
				left: 0
			});
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

			//visualwww.info.pi("-9999" + visualwww.b.xdMsgDelimiter + spsupport.p.initialSess);

			visualwww.info.setUnitConfiguration(visualwww.b.slideup2searchget && 'topBanner' || 'bottomBanner',
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

	visualwww.slideup2 = Slideup;
})();
