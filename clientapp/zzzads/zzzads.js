var slideTime = 900;
var floatAtBottom = false;

function pepsi_floating_init()
{
	xMoveTo('floating_banner_right', 887 - (1024-screen.width), 0);

	winOnResize(); // set initial position
	xAddEventListener(window, 'resize', winOnResize, false);
	xAddEventListener(window, 'scroll', winOnScroll, false);
}
function winOnResize() {
	checkScreenWidth();
	winOnScroll(); // initial slide
}
function winOnScroll() {
  var y = xScrollTop();
  if (floatAtBottom) {
    y += xClientHeight() - xHeight('floating_banner_left');
  }
  
  xSlideTo('floating_banner_left', (screen.width - (1360-775) - 770)/2-115 , y, slideTime);  // Ch?nh kho?ng cách bên trái
  xSlideTo('floating_banner_right', (screen.width - (800-795) + 770)/2, y, slideTime); // // Ch?nh kho?ng cách bên Ph?i
}
	
function checkScreenWidth()
{
	if( document.body.clientWidth < 926 )
	{	
		document.getElementById('floating_banner_left').style.display = 'none';
		document.getElementById('floating_banner_right').style.display = 'none';
	}
	else
	{
		document.getElementById('floating_banner_left').style.display = '';
		document.getElementById('floating_banner_right').style.display = '';	
	}
}
