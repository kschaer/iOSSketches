//
//  firstscene.h
//  class-inheritance-test
//
//  Created by Kaitlin Schaer on 11/5/17.
//

#ifndef firstscene_h
#define firstscene_h
#include "scenemanager.h"

class firstScene : public sceneManager {
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


#endif /* firstscene_h */
