using Toybox.WatchUi;

class Cpr_TimerDelegate extends WatchUi.BehaviorDelegate {

    
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new Cpr_TimerMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    function onKey(evt)
    {
    System.println("Button pressed!");
 	timer2.stop();  
 	timer1.stop(); 

    }
    function onTap(evt)
    {
  		timer1.start(method(:callback1),1000,true); 
    }
   

}