/*------------------------------------------------------
	Owl Carousel
-------------------------------------------------------*/
$(document).ready(function() {
 
  $("#app-showcase").owlCarousel({
	items : 1,
    itemsCustom : false,
    itemsDesktop : [1199,1],
    itemsDesktopSmall : [980,1],
    itemsTablet: [768,1],
    itemsTabletSmall: false,
    itemsMobile : [479,1],
    singleItem : false,
    itemsScaleUp : false,
	autoPlay : true,
	slideSpeed : 600,
  });
 
});
