using Toybox.WatchUi;
using Toybox.System;

class Cpr_TimerStartMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
      	 
    }

    function onMenuItem(item) {
        if (item == :item_1) {
            timer1.start(method(:callback1),1000,true);
          	timer2.start(method(:callback2),1000,true); 
        }else if(item == :item_2){
        System.exit();
        }
    }

}