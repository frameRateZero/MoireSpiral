//adapted from Danial Shiffman 2D Noise
//https://processing.org/examples/noise2d.html


float noiseIncrement = 0.02; //slider
float detail = 0.1; //slider
int noiseRange = 0;

void perlin(PImage preProcessedImage) {
  
  //loadPixels();

  float xoff = 0.0; // Start xoff at 0
   noiseDetail(8, detail);
  
    //loop thorugh the pixels
     // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
for (int x = 0; x < preProcessedImage.width; x = x+1) {
  xoff += noiseIncrement;   // Increment xoff 
   float yoff = 0.0;   // For every xoff, start yoff at 0
   
  for (int y = 0; y < preProcessedImage.height; y = y+1  ) {
    
  yoff += noiseIncrement;
 
      // Calculate noise and scale by noiseRange, subtract half noiseRange to make brightness change +/-
      float bright = noise(xoff, yoff) * noiseRange -  noiseRange/2; //(noise always  btwn 0-1)

      // random noise:
      //float bright = random(0,255);
      
      // Set each pixel onscreen to a grayscale value
      int loc = x + y*preProcessedImage.width; //pixel location
      //println(bright);
      
      preProcessedImage.pixels[loc] = color(brightness(preProcessedImage.pixels[loc]) + bright);
      
    }
  }
  

}
