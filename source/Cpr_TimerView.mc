using Toybox.WatchUi;
using Toybox.Timer;
using Toybox.Attention; 

//Global Variables
var timer1 = new Timer.Timer();  
var timer2 = new Timer.Timer();


var cpr_count = 0; 
var cpr_min = 0; 

var total_sec = 0; 
var total_min = 0; 
var total_hr = 0; 

var shocks = 0;
var no_shocks = 0;  

var vibeData;

//Callback for 2-min-Timer
function callback1() //global!
    {
    //Split to minutes and seconds
    if(cpr_count == 59)
    	{
    	cpr_min +=1; 
   		cpr_count = 0; 
    }else{
    	cpr_count +=1;
    }
    	
    	
    WatchUi.requestUpdate(); //update every second
    
    }
    
 //Callback for total Timer
 function callback2()//global! 
 {
 //Split into Hours, Minutes and Seconds
 	if(total_sec == 59)
 	{
 	 if(total_min ==59)
 	 {
 	 	total_hr += 1; 
 	 	total_min = 0; 
 	 }else{
 	 	total_min += 1;
  	 }
 	 total_sec = 0; 
 	}
 	else {
 	total_sec +=1; 
 	}
 //_____________________________________________________________________________________________________	
 	 WatchUi.requestUpdate(); //update every second
 }
	    
class Cpr_TimerView extends WatchUi.View {
    
    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        
         WatchUi.pushView(new Rez.Menus.StartMenu(), new Cpr_TimerStartMenuDelegate(), WatchUi.SLIDE_UP);
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
        var timeLabel = View.findDrawableById("timeLabel"); //show the time of the cpr
        var timeLabelTotal = View.findDrawableById("timeLabelTotal"); //show total elapsed time
     	var statusLabel = View.findDrawableById("statusLabel");
        var shockLabel = View.findDrawableById("shockLabel"); 
        
        
        
        var timeString; //we need this for the time to be displayed because of duck typing
        var totalTimeString; 
        var totalMinString; 
        var totalSecString;  
        var totalHrString; 
        var shockString; 
        
  //_____________________________________________________________________________________________________	       
        if(cpr_count < 10) //this is just for cosmetics
        {
        timeString = "CPR: "+cpr_min+":0" + cpr_count; //prepend a zero so the seconds make sense (0:01 instead of 0:1) 
        }else{
        timeString = "CPR: "+cpr_min+":" + cpr_count; 
        }
  //_____________________________________________________________________________________________________	       
        if(total_sec < 10) {
        totalSecString = "0"+total_sec; 
        }else
        {
        totalSecString = total_sec; 
        }
 //_____________________________________________________________________________________________________	        
        if(total_min < 10){
        totalMinString = "0"+total_min; 
        }else{
        totalMinString = total_min; 
        }
  //_____________________________________________________________________________________________________	       
        if(total_hr < 10){
        totalHrString = "0"+total_hr; 
        }else{
        totalHrString = total_hr;
        }
  //_____________________________________________________________________________________________________	       
        if(cpr_min == 2) //SET TO 2!!!!
        {
        timer1.stop(); 
        cpr_min = 0; 
        cpr_count = 0; 
        
		 //_____________________________________________________________________________________________________	
        if (Attention has :vibrate) {
    		 vibeData =
   	 		[
        		new Attention.VibeProfile(25, 2000),
       		 	new Attention.VibeProfile(50, 2000),
        		new Attention.VibeProfile(100, 2000)
   	 		];
		}
		 //_____________________________________________________________________________________________________	
		 Attention.vibrate(vibeData); 
		
        WatchUi.pushView(new Rez.Menus.MainMenu(), new Cpr_TimerMenuDelegate(), WatchUi.SLIDE_UP);               
   
        }
 //_____________________________________________________________________________________________________	        
         
        //_____________________________________________________________________________________________________	
        if(shocks == 0 && no_shocks == 0) 
        {
      	 statusLabel.setText(@Rez.Strings.cpr_string); 
      	 
        }else if(shocks == 3 ||shocks == 5) //Amoidarone after 3rd and 5th shock
        {
        statusLabel.setText(@Rez.Strings.amiodarone_string); 
        }else if(((no_shocks+shocks)%2==0 && shocks == 0)||((no_shocks+shocks)%2==0 && shocks> 3)) //Adrenaline is given every 3-5mins without shocks
        {
        	statusLabel.setText(@Rez.Strings.adrenaline_string);
        }  else {
        	statusLabel.setText(@Rez.Strings.cpr_string); 
        }
		//_____________________________________________________________________________________________________	
        
        shockString = "Shocks: "+shocks;
        
        totalTimeString ="Total: "+ totalHrString +":"+totalMinString+":"+totalSecString; 
        timeLabelTotal.setText(totalTimeString); 
        timeLabel.setText(timeString); 
        shockLabel.setText(shockString);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    } 

}
