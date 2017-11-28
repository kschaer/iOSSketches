//
//  begin.h
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/10/17.
//

#ifndef begin_h
#define begin_h
#include "ofxScene.h"


class beginningScene : public ofxScene{
public:
    
    void setup();
    void update();
    void draw();
    void exit();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    
    void touchMoved(ofTouchEventArgs & touch);
    
    ofImage myImage;
};
#endif /* begin_h */
