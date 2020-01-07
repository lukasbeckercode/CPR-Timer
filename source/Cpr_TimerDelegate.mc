using Toybox.WatchUi;

class Cpr_TimerDelegate extends WatchUi.BehaviorDelegate {

    
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new Cpr_TimerMenuDelegate(), WatchUi.SLIDE_UP); // Call the main menu
        return true;
    }
    function onKey(evt)
    {

    }
    function onTap(evt)
    {
  		
    }
   

}