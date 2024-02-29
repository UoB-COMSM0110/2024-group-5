class LightDecrease extends Environment{
  
  @Override
  void change(int flag, PImage img){
    for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    float r,g,b;
    if(flag==0){
     r = red(c)*2.5;  
      g = green(c)*2.5;  
       b = blue(c)*2.5;  
    }else if(flag==1){
       r = red(c);  
     g = green(c);  
     b = blue(c);  
    }else{
      r =red(c) * 0.4;  
       g = green(c) * 0.4;  
      b = blue(c) * 0.4;  
    }
    color newColor = color(r, g, b);
    img.pixels[i] = newColor;
    }
  }

}
