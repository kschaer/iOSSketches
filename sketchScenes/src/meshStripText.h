//
//  meshStripText.h
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/6/17.
//

#ifndef meshStripText_h
#define meshStripText_h

//#include "ofxHersheyFont.h"
#include "ofxScene.h"

class meshStripText : public ofxScene{
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
    
    ofRectangle boundingBox;
    ofPolyline boundingLine;

    string textureText;
    ofTrueTypeFont textureFont;
    ofRectangle fontBox;
    float fontWidth;
    float fontHeight;
    ofFbo textFBO;
    ofFbo oneFBO;
    ofPoint textMover;
    ofTexture charTexture;

    
    ofPoint rot;
    
    ofxHersheyFont myFont;
   // ofTrueTypeFont myFont;
    
    ofPath myFontPath;
    ofPath outline;
    vector <vector <ofVec2f> > points;
    
    ofImage myTextureImage;
    
    float distance;
    
    float wiggleMod;
    
    
};

#endif /* meshStripText_h */
