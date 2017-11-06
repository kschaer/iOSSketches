//
//  feathery.h
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/6/17.
//

#ifndef feathery_h
#define feathery_h

#include "ofxScene.h"

class feathery : public ofxScene{
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
    
    float rotAngle;
    float tempAngle;

    
    float posY;
    float posX;
    float tempY;
    float tempX;
    float lerpX;
    float lerpY;
    
    ofColor color;
    
    float wiggleMod1;
    float wiggleMod2;
    
    float rippleVal;
    float maxRipple;
    
};
#endif /* feathery_h */
