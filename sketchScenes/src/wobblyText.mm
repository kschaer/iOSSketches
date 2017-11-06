//
//  spirograph1.m
//  spirograph1
//
//  Created by Kaitlin Schaer on 11/3/17.
//

//#import <Foundation/Foundation.h>
#include "wobblyText.h"

//-----------------------------------------------
void wobblyText::setup(){
    points.clear();
    
    time = 0;
    wiggleMod = 0;
    wiggleMod2 = 0;
    width = ofGetWidth();
    height = ofGetHeight();
    posX = width/2;
    posY = height/2;
    
    ofBackground(0, 0, 0);
    ofSetColor(10,50,100);
    
    myText = "wiggle";
    myFontPath = myFont.getPath(myText,13);
    myFontPath.setStrokeColor(255);
    myFontPath.setFillColor(ofColor(255,20,100));
    myFontPath.setFilled(true);
    //myFontPath.setMode(ofPath::POLYLINES);
    
    
    vector <ofPolyline> polylines = myFontPath.getOutline();
    for (int i = 0; i < polylines.size(); i++){
        vector <ofVec2f> linePoints;
        ofPolyline reSpacedPolyline = polylines[i].getResampledBySpacing(2);
        for (int j = 0; j<reSpacedPolyline.size(); j++){
            linePoints.push_back(reSpacedPolyline[j]);
        }
        points.push_back(linePoints);
    }
    
}

//-----------------------------------------------
void wobblyText::update(){
    time = ofGetElapsedTimef();
    
    posX = ofLerp(posX, tempX, .02);
    posY = ofLerp(posY, tempY, .02);
    
    wiggleMod = ofMap(posX,0,width,-1,1);
    wiggleMod2 = ofMap(posY,0,width,1,2);

}
//-----------------------------------------------
void wobblyText::draw(){
    ofBackground(0, 0, 0);

    ofPushMatrix();
    //ofTranslate (posX-width/2, posY);
    ofTranslate(150,height/2);
    for (int i = 0; i < points.size(); i++){
        vector <ofVec2f> wordPoints = points[i];
        for (int j = 0; j < wordPoints.size(); j++){
           // float tempI = i;
            float tempJ = j;
            ofPoint wigglingPoint;
            //            cout << points.size() << endl;
            //ofSetColor(255-ofMap(i,0,points.size(),0,255), ofMap(i,0,points.size(),0,255), ofMap(i,0,points.size(),0,255));
            
            ofSetColor(255-ofMap(i,0,points.size(),200,255), ofMap(sin(ofGetElapsedTimef()-.6*i),-1,1,100,200), ofMap(i*posX, 0, width*points.size(), 20, 200));
            
            
            
            wiggleMod = ofMap(posX, 0, width, -1, 1);

            wigglingPoint.set(.5*j*sin(-10*wiggleMod-ofGetElapsedTimef()), wiggleMod2*
                              8*cos(10*wiggleMod-ofGetElapsedTimef()-.1*tempJ-.1*i)+10*sin(1*ofGetElapsedTimef()-.01*i-.01*j), 0);
            
            
            ofPoint wiggleZ;
            wiggleZ.set(0,0,15*cos(ofGetElapsedTimef()-.05*j)+80*sin(.3*ofGetElapsedTimef()-.3*i));
            ofPoint newPoint = wordPoints[j]+wigglingPoint;
            ofPushMatrix();
            {
                ofTranslate(newPoint);
                //ofRotateY(360*sin(ofGetElapsedTimef()-j));
                ofFill();
                

                ofDrawCircle(10*wiggleMod,  50* wiggleMod ,wiggleZ.z, 15+wiggleMod2*7*sin(ofGetElapsedTimef()-.1*tempJ));
                
                ofPoint basePoint;
                
                basePoint.set(width/i, height/2, 0);
            }
            ofPopMatrix();
            
            //ofDrawLine(newPoint, basePoint);
        }
    }
    
    ofPopMatrix();
}
//-----------------------------------------------
void wobblyText::touchDown(ofTouchEventArgs & touch){
    
    tempX = touch.x;
    tempY = touch.y;
}
//---------------------------------------------
void wobblyText::touchUp(ofTouchEventArgs & touch){
    tempX = touch.x;
    tempY = touch.y;
    
}


//-----------------------------------------------
void wobblyText::touchMoved(ofTouchEventArgs & touch){
    
    tempX = touch.x;
    tempY = touch.y;
    
    
}

