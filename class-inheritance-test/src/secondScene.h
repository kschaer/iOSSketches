//
//  secondScene.h
//  class-inheritance-test
//
//  Created by Kaitlin Schaer on 11/5/17.
//

#ifndef secondScene_h
#define secondScene_h

#include "ofxiOS.h"
#include "scenemanager.h"

class secondScene : public sceneManager {
public:
    void setup();
    void update();
    void draw();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    
    float posX;
    float posY;
};

#endif /* secondScene_h */
