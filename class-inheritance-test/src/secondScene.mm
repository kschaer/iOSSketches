//
//  secondScene.m
//  class-inheritance-test
//
//  Created by Kaitlin Schaer on 11/5/17.
//

#import <Foundation/Foundation.h>
#include "secondScene.h"

//----------------------------------------------------------------
void secondScene::setup(){
    
    posX = width/2;
    posY = height/2;
}
//----------------------------------------------------------------
void secondScene::update(){
    
}
//----------------------------------------------------------------
void secondScene::draw(){
    ofDrawRectangle(posX,posY,50,50*sin(time));
}
//----------------------------------------------------------------
void secondScene::touchUp(ofTouchEventArgs & touch){
    
}
//----------------------------------------------------------------
void secondScene::touchDown(ofTouchEventArgs & touch){
    
}
//----------------------------------------------------------------
void secondScene::touchMoved(ofTouchEventArgs & touch){
    posX = touch.x;
    posY = touch.y;
}
//----------------------------------------------------------------
void secondScene::touchDoubleTap(ofTouchEventArgs & touch){
    
}

