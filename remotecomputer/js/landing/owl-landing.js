/*------------------------------------------------------
	Owl Carousel
-------------------------------------------------------*/
$(document).ready(function() {
 
  $("#app-showcase-landing").owlCarousel({
	items : 4,
    itemsCustom : false,
    itemsDesktop : [1199,4],
    itemsDesktopSmall : [980,3],
    itemsTablet: [768,2],
    itemsTabletSmall: false,
    itemsMobile : [479,1],
    singleItem : false,
    itemsScaleUp : false,
	autoPlay : false,
	slideSpeed : 600,
	stopOnHover : true,
	pagination : true,
	navigation :false,
  });
  
  $("#app-testimonials-landing").owlCarousel({
	items : 1,
    itemsCustom : false,
    itemsDesktop : [1199,1],
    itemsDesktopSmall : [980,1],
    itemsTablet: [768,1],
    itemsTabletSmall: false,
    itemsMobile : [479,1],
    singleItem : false,
    itemsScaleUp : false,
	autoPlay : false,
	slideSpeed : 600,
	stopOnHover : true,
	pagination : true,
	navigation :false,
  });
 
});
