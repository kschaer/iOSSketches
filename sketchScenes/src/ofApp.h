#pragma once

#include "ofMain.h"
#include "ofxiOS.h"

#include "spirograph1.h"
#include "ofxSceneManager.h"
#include "wobblyText.h"
#include "feathery.h"
#include "meshStripText.h"
#include "kaleidoscope.h"
#include "ballOfString.h"
#include "begin.h"
class ofApp : public ofxiOSApp{
    
public:
    void setup();
    void update();
    void draw();
    void exit();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);
    

    //spirograph1 spiroText;
    ofxSceneManager sceneManager;
     
    
};


