//
//  scenemanager.h
//  class-inheritance-test
//
//  Created by Kaitlin Schaer on 11/5/17.
//

#ifndef scenemanager_h
#define scenemanager_h

#include "ofxiOS.h"

class sceneManager {
public:


    void setup(){};
    void update(){};
    void draw(){};
    
    void touchDown(ofTouchEventArgs & touch){};
    void touchUp(ofTouchEventArgs & touch){};
    void touchMoved(ofTouchEventArgs & touch){};
    void touchDoubleTap(ofTouchEventArgs & touch){};
    float time;
    float width;
    float height;
    
    
};


#endif /* scenemanager_h */
