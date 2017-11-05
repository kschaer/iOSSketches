//
//  spirograph1.h
//  spirograph1
//
//  Created by Kaitlin Schaer on 11/3/17.
//

#ifndef spirograph1_h
#define spirograph1_h

//#include "ofxiOS.h"
//#include "scene.h"

#include "ofxScene.h"

class spirograph1 : public ofxScene{
public:
    void setup();
    void update();
    void draw();
    void exit();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);

    void touchMoved(ofTouchEventArgs & touch);

    
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
    float tempY;
    float tempX;
    float lerpX;
    float lerpY;
    
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

#endif /* spirograph1_h */
