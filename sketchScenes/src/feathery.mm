//
//  feathery.m
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/6/17.
//

#include "feathery.h"

void feathery::setup(){
    
    
    ofBackground(0,0,0);
    height = ofGetHeight();
    width = ofGetWidth();
    time = ofGetElapsedTimef();
    
    posX = 0;
    posY = 0;
    tempY = 0;
    tempX = 0;
    
    rotAngle = 90;
    tempAngle = 90;
    
    wiggleMod1 = 0;
    wiggleMod2 = 0;
    
    rippleVal = 1;
    maxRipple = 10;

    ofSetCircleResolution(120);
    
}
//--------------------------------------------------------------------

void feathery::update(){
    time = ofGetElapsedTimef();
    
    posX = ofLerp(posX, tempX, .2);
    posY = ofLerp(posY, tempY, .2);
    
    rotAngle = ofLerp(rotAngle, tempAngle, .1);
    
    wiggleMod1 = ofMap(posX, 0, width, -1,1);
    wiggleMod2 = ofMap(posY, 0, height, -.2,.2);
    
    rippleVal = ofLerp(rippleVal, maxRipple, .1);

    ofNoFill();
    //ofSetLineWidth(2.5+2*sin(time));
    cout << rotAngle << endl;
}
//--------------------------------------------------------------------

void feathery::draw(){
    ofBackground(0,0,0);
    
    ofPushMatrix();
    //ofRotateZ(rotAngle);
    ofTranslate(width/2,height/2);
    ofRotateZ(rotAngle);
    
    for (int i = 0; i < 720; i++){
        for (int j = 0; j <2; j++){
            ofRotateZ(360/j-120);

            ofPushMatrix();
            //ofSetLineWidth(2.5+2*sin(time-.1*i));
             ofPushMatrix();
            ofSetColor(150+75*cos(.2*time-.1*i),120+10*rippleVal);
            
            ofPushMatrix();
            ofTranslate((width/5)*j,0);
            ofTranslate(0,.2*i);
            ofRotateZ(i-360);

            ofDrawCircle(0, 0, posX/3-180*rippleVal*wiggleMod1*sin(time-.5*i*wiggleMod2), i+4*sin(time-wiggleMod1-.1*i));
            ofPopMatrix();
            ofPopMatrix();
            ofPopMatrix();
        }

    }
    
    ofPopMatrix();
}
//--------------------------------------------------------------------
void feathery::touchDown(ofTouchEventArgs & touch){
    tempX = touch.x;
    tempY = touch.y;
    
    maxRipple = 10;
    
    tempAngle = acos(ofDist(width/2, height/2, width/2, touch.y) / ofDist(width/2, height/2, touch.x, touch.y))*(180/PI);
    //cout <<tempAngle << endl;
}
//--------------------------------------------------------------------

void feathery::touchUp(ofTouchEventArgs & touch){
    tempX = touch.x;
    tempY = touch.y;
        tempAngle = acos(ofDist(width/2, height/2, width/2, touch.y) / ofDist(width/2, height/2, touch.x, touch.y))*(180/PI);
}
//--------------------------------------------------------------------

void feathery::touchMoved(ofTouchEventArgs & touch){
    tempX = touch.x;
    tempY = touch.y;
    maxRipple= 1;
    tempAngle = acos(ofDist(width/2, height/2, width/2, touch.y) / ofDist(width/2, height/2, touch.x, touch.y))*(180/PI);
}

