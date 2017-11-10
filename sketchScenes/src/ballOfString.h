//
//  ballOfString.h
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/8/17.
//

#ifndef ballOfString_h
#define ballOfString_h
#include "ofxScene.h"

class ballOfString : public ofxScene{
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
    
    float rotateX;
    float rotateY;
    float rotateZ;
    
    float distFromCenter;
    
    ofColor color;
    
    ofPolyline line;
    vector < ofPolyline > lines;

};

#endif /* ballOfString_h */
