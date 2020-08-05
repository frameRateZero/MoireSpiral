class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;

  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);
    
fill(0);
  stroke(0);

  
  // Slider for contrast
  cp5.addSlider("RADIUS")
     .plugTo(parent, "RADIUS")
     .setLabel("RADIUS")
     .setPosition(20,50)
     .setValue(400)
     .setRange(300,800)
     .setColorLabel(0)
     .setSize(100, 20) 
     ;
    

   cp5.addSlider("NUMTURNS")
    .plugTo(parent, "NUMTURNS")
     .setLabel("NUMTURNS")
     .setPosition(20,75)
     .setValue(40)
     .setRange(20,80)
     .setColorLabel(0)
      ; 
   cp5.addSlider("hysteresis")
    .plugTo(parent, "hysteresis")
     .setLabel("hysteresis")
     .setPosition(20,90)
     .setValue(0.5)
     .setRange(0.01,1)
     .setColorLabel(0)
      ; 
           // Slider for x offset
   cp5.addSlider("magnitudeX")
    .plugTo(parent, "magnitudeX")
     .setLabel("magnitudeX")
     .setPosition(20,150)
     .setValue(0.0)
     .setRange(-4,4)
     .setColorLabel(0)
      ;
         cp5.addSlider("magnitudeY")
    .plugTo(parent, "magnitudeY")
     .setLabel("magnitudeY")
     .setPosition(20,165)
     .setValue(0.0)
     .setRange(-4,4)
     .setColorLabel(0)
      ;  
      

      // Slider for preFilter
  cp5.addSlider("preFilter")
  .plugTo(parent, "preFilter")
     .setLabel("preFilter")
     .setPosition(20,200)
     .setValue(0)
     .setRange(0,4)
     .setColorLabel(0)
      ;
            
  cp5.addSlider("blurVal")
  .plugTo(parent, "blurVal")
     .setLabel("blur")
     .setPosition(20,215)
     .setValue(1)
     .setRange(0,20)
     .setColorLabel(0)
      ;   
  cp5.addSlider("postVal")
  .plugTo(parent, "postVal")
     .setLabel("posterize")
     .setPosition(20,230)
     .setValue(16)
     .setRange(2,48)
     .setColorLabel(0)
      ;      
      
  
          // Sliders for Noise
   cp5.addSlider("noiseRange")
  .plugTo(parent, "noiseRange")
     .setLabel("amount of brightness added/subtracted")
     .setPosition(20,400)
     .setValue(50)
     .setRange(0,400)
     .setColorLabel(0)
      ;
      
   cp5.addSlider("detail")
  .plugTo(parent, "detail")
     .setLabel("falloff factor for each octave")
     .setPosition(20,425)
     .setValue(0.2)
     .setRange(0.1,0.6)
     .setColorLabel(0)
      ;
      
  cp5.addSlider("noiseIncrement")
  .plugTo(parent, "noiseIncrement")
     .setLabel("Pixeloffset")
     .setPosition(20,450)
     .setValue(0.02)
     .setRange(0.01,0.04)
     .setColorLabel(0)
      ;
  }
    void draw() {
    background(190);
  }
}
