#pragma once

#include "ofxiOS.h"
#include "spirograph1.h"


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
    
    bool bSmooth;
    float counter;
    
    ofTrueTypeFont myFont;
    
    float time;
    float sinTime;
    
    float width;
    float height;
    
    string myText;
    float posY;
    float posX;
    ofPoint centerText;
    ofRectangle textBounding;
    
    vector <vector <ofVec2f> > points;
    vector <vector <ofVec2f> > points2;
    
    ofPath outline;
    
    float angle;
    int numPoints;
    float radius;
    ofPoint circCenter;
    ofPoint circPoints[75];
    
    float chaos1;
    float chaos2;
    
    int spaceCount;
    
    float lightness;
    
    float nextPointSpeed;
    
    int frameCount;
    
    float rotateSpeed;
    
};


