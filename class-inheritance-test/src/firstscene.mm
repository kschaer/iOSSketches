//
//  firstscene.m
//  class-inheritance-test
//
//  Created by Kaitlin Schaer on 11/5/17.
//

//#import <Foundation/Foundation.h>
#include "firstscene.h"

//----------------------------------------------------------------
void firstScene::setup(){
    
    posX = width/2;
    posY = height/2;
}
//----------------------------------------------------------------
void firstScene::update(){
    time = ofGetElapsedTimef();
    ofLog()<<time<<endl;
}
//----------------------------------------------------------------
void firstScene::draw(){
    ofBackground(255, 0, 255);
    ofSetColor(255, 255, 0);
    ofDrawCircle(posX,posY,10*abs(sin(time)));
}
//----------------------------------------------------------------
void firstScene::touchUp(ofTouchEventArgs & touch){
    posX = touch.x;
    posY = touch.y;
}
//----------------------------------------------------------------
void firstScene::touchDown(ofTouchEventArgs & touch){
    posX = touch.x;
    posY = touch.y;
}
//----------------------------------------------------------------
void firstScene::touchMoved(ofTouchEventArgs & touch){
    posX = touch.x;
    posY = touch.y;
}
//----------------------------------------------------------------
void firstScene::touchDoubleTap(ofTouchEventArgs & touch){
    
}

