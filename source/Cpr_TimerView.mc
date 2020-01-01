using Toybox.WatchUi;
using Toybox.Timer; 

var timer1= new Timer.Timer();  
var timer2;
var cpr_count = 0; 
var total_count = 0; 

function callback1()
    {
    	cpr_count +=1;
    	WatchUi.requestUpdate(); 
    
    }
	    
class Cpr_TimerView extends WatchUi.View {
    
    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
      
       startTimer(); 
    }
	
	
	public function startTimer()
	{
	 
     timer1.start(method(:callback1),1000,true);
	}

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        var timeLabel = View.findDrawableById("timeLabel"); 
        var timeString; 
        timeString = "CPR: " + cpr_count; 
        timeLabel.setText(timeString); 
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

	
    
    function callback2()
    {
    }
}
