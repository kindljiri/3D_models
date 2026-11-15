MobileWidht = 84.35;
MobileHight = 11.06;
MobileLenght = 173.78;

keybWidth = 59.30;
keybHight = 10.98;
keybLenght = 152;

edgeHolderWidth = 2;
midSeparatorWidth = 6;

minBaseHight = 5;
topOfHolderHight = 2.4;
topOfHolderLenght = 2.6;

roundCornerRad=2.4;

//TotalHight is MobileHihgt (cause it is bigger then keyboardHight + minimal base plate hight + HightofholderTop 
totalHight = minBaseHight + MobileHight + topOfHolderHight;
totalLenght = edgeHolderWidth + MobileLenght + edgeHolderWidth;
totalWidth = edgeHolderWidth + keybWidth + midSeparatorWidth + MobileWidht + edgeHolderWidth;



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
    cube([60,edgeHolderWidth+roundCornerRad+1,MobileHight]);
    // charger connector, repro ...
    translate([MobileLenght,12,0])
    cube([edgeHolderWidth+1+roundCornerRad,MobileWidht-2*12,MobileHight]);
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
    cube([60,edgeHolderWidth+1+topOfHolderLenght+roundCornerRad,MobileHight]);
    // charger connector, repro ...
    translate([MobileLenght-2*topOfHolderLenght,12-topOfHolderLenght,0])
    cube([edgeHolderWidth+1+topOfHolderLenght+roundCornerRad,MobileWidht-2*12,MobileHight+1]);
}

module baseHolder() {
    hull() {
        baseHolderLen=totalLenght - (2*roundCornerRad) - (edgeHolderWidth+(MobileLenght-keybLenght)/2);
        $fn=60;
        translate([roundCornerRad,roundCornerRad,roundCornerRad])
        sphere(r=roundCornerRad);
        translate([roundCornerRad,totalWidth,roundCornerRad])
        sphere(r=roundCornerRad);
        translate([baseHolderLen,totalWidth,roundCornerRad])
        sphere(r=roundCornerRad);
        translate([baseHolderLen,roundCornerRad,roundCornerRad])
        sphere(r=roundCornerRad);
    
        translate([roundCornerRad,roundCornerRad,totalHight-roundCornerRad])
        sphere(r=roundCornerRad);
        translate([roundCornerRad,totalWidth,totalHight-roundCornerRad])
        sphere(r=roundCornerRad);
        translate([baseHolderLen,totalWidth,totalHight-roundCornerRad])
        sphere(r=roundCornerRad);
        translate([baseHolderLen,roundCornerRad,totalHight-roundCornerRad])
        sphere(r=roundCornerRad);
    } 
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

difference(){
    //baseHolder is shorter and shifted to allow slide mobile and keybord in and out
    translate([edgeHolderWidth+roundCornerRad+(MobileLenght-keybLenght)/2,0,0])
    baseHolder();
    
    //Minus keyboard
    translate([edgeHolderWidth+(MobileLenght-keybLenght)/2,edgeHolderWidth+roundCornerRad,totalHight-(keybHight+topOfHolderHight)])  
    union() { 
        mockKeyboard();
        translate([topOfHolderLenght,topOfHolderLenght,topOfHolderHight+1])
        mockKyebTopCut();
    }
    //Minus phone
    translate([0,edgeHolderWidth + keybWidth + midSeparatorWidth,totalHight-(MobileHight+topOfHolderHight)])
    union() {
        mockPhone();
        translate([topOfHolderLenght,topOfHolderLenght,topOfHolderHight+1])
        mockPhoneTopCut();
    }
    
    //Minus small cude to easier slide out keyboard
    translate([edgeHolderWidth+roundCornerRad+(MobileLenght-keybLenght)/2,edgeHolderWidth+roundCornerRad,0])
    cube([20,keybWidth,totalHight]);
       
}


