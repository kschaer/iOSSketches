//
//  kaleidoscope.h
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/7/17.
//

#ifndef kaleidoscope_h
#define kaleidoscope_h
#include "ofxScene.h"

class kaleidoscope : public ofxScene{
public:
    
    void setup();
    void update();
    void draw();
    void exit();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    
    float time;
    
    float width;
    float height;
    
    string myText;
    float posX;
    float posY;
    
    float tempX;
    float tempY;
    
    ofRectangle fontBox;
    float fontWidth;
    float fontHeight;

    ofPolyline line;
    ofPolyline baseLine;

    ofPolyline drawnLine;
    ofPolyline smoothLine;
    
    ofTrueTypeFont myFont;
    ofPoint textMover;
    
    float distance;
    
    float wiggleMod;
    
    ofImage textImage;
    
    ofFbo textFBO;
    ofFbo oneFBO;
    
    
};


#endif /* kaleidoscope_h */
