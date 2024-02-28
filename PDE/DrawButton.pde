void drawButton(Level level){
  switch(level){
    case LEVEL_BEGIN:
      drawButtonBegin();
      break;
    //to do
  }
}

void drawButtonBegin(){
  imageMode(CENTER);
  image(buttonImage.BTN_MAINMENU,width/2,height/1.4,300,300);
  
  /*
    old UI
  */
  
  //set hover styles
  //if(isMouseInButtonStart()){
  //  buttonImage.HOVER_BTN_START = true;
  //}else{
  //  buttonImage.HOVER_BTN_START = false;
  //}
  
  //if(isMouseInButtonSet()){
  //  buttonImage.HOVER_BTN_SET = true;
  //}else{
  //  buttonImage.HOVER_BTN_SET = false;
  //}
  
  //if(buttonImage.HOVER_BTN_START){
  //  tint(150,100);
  //}else{
  //  noTint();
  //}
  //image(buttonImage.BTN_START, width/2, height/1.5, buttonImage.BTN_START.width/4, buttonImage.BTN_START.height/5);
  
  //if(buttonImage.HOVER_BTN_SET){
  //  tint(150,100);
  //}else{
  //  noTint();
  //}
  //image(buttonImage.BTN_SET, width/2, height/1.5+gameConstant.BUTTON_SPACE, buttonImage.BTN_START.width/4, buttonImage.BTN_START.height/5);
  //noTint();
}
