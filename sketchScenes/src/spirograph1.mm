//
//  spirograph1.m
//  spirograph1
//
//  Created by Kaitlin Schaer on 11/3/17.
//

//#import <Foundation/Foundation.h>
#include "spirograph1.h"

//-----------------------------------------------
void spirograph1::setup(){
    points.clear();
    
    ofEnableAntiAliasing();
    counter = 0;
    ofSetCircleResolution(20);
    ofBackground(0);
    //bSmooth = true;
    
    ofNoFill();
    
    posX = ofGetWidth()/2;
    posY = ofGetHeight()/2;
    tempX = posX;
    tempY = posY;
    lerpX = tempX;
    lerpY= tempY;
    
    lightness = 0;
    
    myText = "hello";
    myFont.load("Avenir Next.ttc", 400, true,true,true);
    centerText.set(0,0);
    
    spaceCount = 75;
    frameCount = 0;
    
    chaos1= 0;
    chaos2 = 0;
    
    radius = 200;
    circCenter.set(posX,posY);
    
    numPoints = spaceCount;
    
    angle = (2*PI)/(float(numPoints));
    for (int i = 0; i <numPoints; i++){
        circPoints[i] = ofPoint(circCenter.x+600*sin(angle*i), circCenter.y+1000*cos(angle*i));
        ofDrawCircle(circPoints[i], 10);
    }
    
    
    
    vector <ofTTFCharacter> paths = myFont.getStringAsPoints(myText);
    for (int i = 0; i <paths.size(); i++){
        //for every character in the string, is a separate polyline
        vector <ofPolyline> polylines = paths[i].getOutline();
        //for every polyline...
        for (int j = 0; j <polylines.size(); j++){
            //create a vector to store all points of a single polyline
            vector <ofVec2f> linePoints;
            // and then resample that polyline to acheive equal spacings
            ofPolyline reSpacedPolyline = polylines[j].getResampledByCount(spaceCount);
            //add all these resampled points into the vector for character points
            for (int k = 0; k < reSpacedPolyline.size(); k++){
                linePoints.push_back(reSpacedPolyline[k]);
                
                
                
                
                
                
                ofPushMatrix();
                
                textBounding.set(myFont.getStringBoundingBox(myText,0,0));
                centerText.set(-textBounding.width/2,20-textBounding.height/2);
                ofTranslate(centerText);
                
                ofPopMatrix();
            }
            //put the vector of points back into the main vector
            points.push_back(linePoints);
            
            
        }
    }
    
    nextPointSpeed = 0;
    rotateSpeed = 0;
}

//-----------------------------------------------
void spirograph1::update(){
    time = ofGetElapsedTimef();
    sinTime = sin(ofGetElapsedTimef());
    ofSetCircleResolution(20);
    
    posX = ofLerp(posX, tempX, .2);
    posY = ofLerp(posY, tempY, .2);
    

    textBounding = myFont.getStringBoundingBox(myText,posX ,posY);
    centerText.set(posX-textBounding.width/2,posY+textBounding.height/2);
    
    
    nextPointSpeed = .4;
    
    
    frameCount = (int)(ofGetFrameNum()*nextPointSpeed);
    
    spaceCount = 100;
    numPoints = spaceCount;
    radius = 1000+300*sin(ofGetElapsedTimef());
    circCenter.set(posX,posY);
    numPoints = spaceCount;
    
        chaos1 = 500*sin(.1*time);
        chaos2 = 500*cos(.2*time);
    

}
//-----------------------------------------------
void spirograph1::draw(){
    
    ofBackground(0, 0, 0);
    
    ofSetColor(lightness);
    ofPushMatrix();

    
    for (int i = 0; i < points.size(); i++){
        vector <ofVec2f>charPoints = points[i];
        
        for (int j = 0; j< charPoints.size(); j++){

            angle = TWO_PI/(float(charPoints.size()));
            
            circPoints[j] = ofPoint(ofGetWidth()/2+radius*sin(angle*j),ofGetHeight()/2+radius*cos(angle*j));
            ofPoint movingCircle;
            movingCircle.set(circPoints[(j+frameCount)% charPoints.size()].x+chaos1*sin(angle*j),circPoints[(j+frameCount)% charPoints.size()].y+chaos2*cos(angle*j) );

            ofDrawCircle(movingCircle,5);

            
            ofPoint movedPoints;
            movedPoints.set(centerText+charPoints[j] );
            
            //ofDrawLine(circPoints[i], movedPoints);
            ofSetColor(ofMap(j, 0 , charPoints.size(), 140, 255), ofMap(j, 0, charPoints.size(), 200, 255), ofMap(i, 0, points.size(), 0, 255));
            //ofDrawLine(circPoints[(j+frameCount)% charPoints.size()], movedPoints);
            ofDrawLine(movedPoints, movingCircle );
            ofFill();
            
            ofDrawCircle(movedPoints,3+3*((j+frameCount)% charPoints.size())%4);

            //cout << charPoints.size() << endl;


            
        }
    }

    
    ofSetColor(0,150);
    myFont.drawStringAsShapes(myText, centerText.x,centerText.y);
    ofPopMatrix();
    
    
}
//-----------------------------------------------
void spirograph1::touchDown(ofTouchEventArgs & touch){

    tempX = touch.x;
    tempY = touch.y;
}
//---------------------------------------------
void spirograph1::touchUp(ofTouchEventArgs & touch){
    tempX = touch.x;
    tempY = touch.y;
    
}


//-----------------------------------------------
void spirograph1::touchMoved(ofTouchEventArgs & touch){

    tempX = touch.x;
    tempY = touch.y;
    

}
