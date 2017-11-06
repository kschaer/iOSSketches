//
//  wobblyText.h
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/6/17.
//

#ifndef wobblyText_h
#define wobblyText_h

#include "ofxScene.h"
#include "ofxHersheyFont.h"

class wobblyText : public ofxScene{
public:
    
    void setup();
    void update();
    void draw();
    void exit();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    
    ofxHersheyFont myFont;
    ofPath myFontPath;
    ofPath outline;
    vector <vector <ofVec2f> > points;
    string myText;


    float time;
    float width;
    float height;
    float wiggleMod;
    float wiggleMod2;
    
    float posY;
    float posX;
    float tempY;
    float tempX;
    float lerpX;
    float lerpY;
    
};

#endif /* wobblyText_h */
