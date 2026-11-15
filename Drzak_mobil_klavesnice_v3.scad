MobileWidht = 84.35;
MobileHight = 11.06;
MobileLenght = 173.78;

keybWidth = 59.30;
keybHight = 10.98;
keybLenght = 152;

edgeHolderWidth = 4;
midSeparatorWidth = 6;

holderWidth = MobileLenght+edgeHolderWidth;
minBaseHight = 5;
topOfHolderHight = 2.4;
topOfHolderLenght = 2.6;

//TotalHight is MobileHihgt (cause it is bigger then keyboardHight + minimal base plate hight + HightofholderTop 
totalHight = minBaseHight + MobileHight + topOfHolderHight;



module mockKeyboard() {
    cube([keybLenght,keybWidth,keybHight]);
}

module mockKyebTopCut(){
    cube([keybLenght-2*topOfHolderLenght,keybWidth-2*topOfHolderLenght,keybHight]);    
}

module mockPhone(){
    cube([MobileLenght,MobileWidht,MobileHight]);
    //side buttons, bigger on purpose to cut throuth the edge of the holder
    translate([40,MobileWidht,0])
    cube([60,edgeHolderWidth+1,MobileHight]);
    // charger connector, repro ...
    translate([MobileLenght,12,0])
    cube([edgeHolderWidth+1,MobileWidht-2*12,MobileHight]);
    //Camera
    CameraLenght = 73; //from edge of the phone
    CameraWidth = 42;
    translate([0,35,-10])
    cube([CameraLenght,CameraWidth,10]);    
}

module mockPhoneTopCut() {
    cube([MobileLenght-2*topOfHolderLenght,MobileWidht-2*topOfHolderLenght,MobileHight]);
    //side buttons, bigger on purpose to cut throuth the edge of the holder
    translate([40-topOfHolderLenght,MobileWidht-2*topOfHolderLenght,0])
    cube([60,edgeHolderWidth+1+topOfHolderLenght,MobileHight]);
    // charger connector, repro ...
    translate([MobileLenght-2*topOfHolderLenght,12-topOfHolderLenght,0])
    cube([edgeHolderWidth+1+topOfHolderLenght,MobileWidht-2*12,MobileHight+1]);
}

/*
mockKeyboard();
translate([topOfHolderLenght,topOfHolderLenght,topOfHolderHight+1])
mockKyebTopCut();
*/

/*
mockPhone();
translate([topOfHolderLenght,topOfHolderLenght,topOfHolderHight+1])
mockPhoneTopCut();
*/


//Keyboard Holder
difference(){
  cube([holderWidth,edgeHolderWidth + keybWidth + midSeparatorWidth/2,totalHight]);
  translate([edgeHolderWidth+(MobileLenght-keybLenght)/2,edgeHolderWidth,totalHight-(keybHight+topOfHolderHight)])  
  union() { 
    mockKeyboard();
    translate([topOfHolderLenght,topOfHolderLenght,topOfHolderHight+1])
    mockKyebTopCut();
  }
  //tweaks: remove left parts to allow keyboard to slide in and out;
  translate([-1,edgeHolderWidth,-1])
  cube([1+edgeHolderWidth+(MobileLenght-keybLenght)/2,keybWidth+2,totalHight+2]);
  translate([edgeHolderWidth+(MobileLenght-keybLenght)/2,edgeHolderWidth,-1])
  cube([edgeHolderWidth,keybWidth,totalHight+2]);
  //lightening
  translate([40,edgeHolderWidth+10,-1])
  cube([10,keybWidth-20,totalHight+2]);
  translate([60,edgeHolderWidth+10,-1])
  cube([10,keybWidth-20,totalHight+2]);
  translate([80,edgeHolderWidth+10,-1])
  cube([10,keybWidth-20,totalHight+2]);
  translate([100,edgeHolderWidth+10,-1])
  cube([10,keybWidth-20,totalHight+2]);
  translate([120,edgeHolderWidth+10,-1])
  cube([10,keybWidth-20,totalHight+2]);
  translate([140,edgeHolderWidth+10,-1])
  cube([10,keybWidth-20,totalHight+2]);
}


//Move the Phone holder on Y axe behind the Keyboard Holder
translate([0,edgeHolderWidth + keybWidth + midSeparatorWidth/2,0])
//Phone Holder
difference() {
    cube([holderWidth,midSeparatorWidth/2 + MobileWidht + edgeHolderWidth,totalHight]);
    translate([0,midSeparatorWidth/2,totalHight-(MobileHight+topOfHolderHight)])
    union() {
        mockPhone();
        translate([topOfHolderLenght,topOfHolderLenght,topOfHolderHight+1])
        mockPhoneTopCut();
    }
    //tweaks: remove left parts to allow keyboard to slide in and out;
    translate([-1,midSeparatorWidth/2,-1])
    cube([1+edgeHolderWidth+(MobileLenght-keybLenght)/2,MobileWidht,totalHight+2]);
}


