MobileWidht = 84.35;
MobileHight = 11.06;

keybWidth = 59.30;
keybHight = 10.98;

edgeHolderWidth = 4;
midSeparatorWidth = 6;

holderWidth = 30;
minBaseHight = 5;
topOfHolderHight = 2.4;
topOfHolderLenght = 2.6;

//TotalHight is MobileHihgt (cause it is bigger then keyboardHight + minimal base plate hight + HightofholderTop 
totalHight = minBaseHight + MobileHight + topOfHolderHight;

//Keyboard Holder
difference(){
cube([holderWidth,edgeHolderWidth + keybWidth + midSeparatorWidth/2,totalHight]);
translate([-5,edgeHolderWidth,totalHight-(topOfHolderHight+keybHight)])
    cube([holderWidth +10,keybWidth,keybHight]);
translate([-5,edgeHolderWidth+topOfHolderLenght,totalHight-(topOfHolderHight+keybHight)]) cube([holderWidth +10,keybWidth-(2*topOfHolderLenght),keybHight+topOfHolderHight+1]);
}

//Phone Holder
translate([0,edgeHolderWidth + keybWidth + midSeparatorWidth/2,0])
difference() {
cube([holderWidth,midSeparatorWidth/2 + MobileWidht + edgeHolderWidth,totalHight]);
translate([-5,midSeparatorWidth/2,totalHight-(MobileHight+topOfHolderHight)]) cube([holderWidth+10,MobileWidht,MobileHight]);
translate([-5,midSeparatorWidth/2+topOfHolderLenght,totalHight-5]) cube([holderWidth+10,MobileWidht-(2*topOfHolderLenght),10]);
}

