using Toybox.WatchUi;
using Toybox.System;

class Cpr_TimerMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
      
    }

    function onMenuItem(item) {
        if (item == :item_1) {
            System.println("shock");
            timer1.start(method(:callback1),1000,true);
            shocks += 1; 
        } else if (item == :item_2) {
            System.println("no shock");
            timer1.start(method(:callback1),1000,true);
        }
    }

}