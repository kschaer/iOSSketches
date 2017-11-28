//
//  begin.m
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/10/17.
//
//
//  ballOfString.mm
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/8/17.

#include "begin.h"

void beginningScene::setup(){
    
    myImage.load("beginning.png");
    
}
//------------------------------------------------------------------------------
void beginningScene::update(){
    
}
//--------------------------------------------------------------------

void beginningScene::draw(){
    //ofSetColor(255,255,255);
    ofBackground(0,0,0);
    myImage.draw(0,0);

}
//--------------------------------------------------------------------
void beginningScene::touchDown(ofTouchEventArgs & touch){

}
//--------------------------------------------------------------------

void beginningScene::touchUp(ofTouchEventArgs & touch){

    
}
//--------------------------------------------------------------------

void beginningScene::touchMoved(ofTouchEventArgs & touch){

    
}




#import <Foundation/Foundation.h>
