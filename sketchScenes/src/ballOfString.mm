//
//  ballOfString.mm
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/8/17.

#include "ballOfString.h"


void ballOfString::setup(){
    
    
    ofBackground(0,0,0);
    height = ofGetHeight();
    width = ofGetWidth();
    time = ofGetElapsedTimef();
    
    posX = 0;
    posY = 0;
    tempY = 0;
    tempX = 0;
    
    rotateX = 0;
    rotateY = 0;
    rotateZ = 0;
    
   // rot.set(0,0,0);
    rotAngle = 90;
    tempAngle = 90;
    
    distFromCenter = 0;
    
    ofSetCircleResolution(120);
    
    lines.clear();
    line.clear();
    
    
    for (int i = 0; i <100; i++){
        line.addVertex(width*ofSignedNoise(i*ofGetElapsedTimef()*0.012412), width*ofSignedNoise(i*ofGetElapsedTimef()*0.008013), width*ofSignedNoise(i*ofGetElapsedTimef()*0.01231));
    }
//    for (int i = 0; i < lines.size(); i++){
//        for(int j = 0; j< lines[i].getVertices().size(); j++){
//            //            ofPoint pointys;
//            //            pointys.set(lines[i].getResampledBySpacing(30).getVertices()[j]);
//            ofPoint fromCenter = lines[i].getVertices()[j] - ofPoint(ofGetWidth()/2, ofGetHeight()/2);
//
//            // line.getSmoothed(3);
//            ofPushMatrix();
//            ofTranslate(width/2,height/2);
//            float radius;
//            radius = 5+5*sin(i+.08*j);
//            ofSetColor(200+55*sin(time-.4*j));
//            ofDrawCircle(fromCenter, radius);
//
//            ofPopMatrix();
//
//        }
//
//}
}
//--------------------------------------------------------------------

void ballOfString::update(){
    time = ofGetElapsedTimef();
    
    posX = ofLerp(posX, tempX, .2);
    posY = ofLerp(posY, tempY, .2);
    
    rotAngle = ofLerp(rotAngle, tempAngle, .1);
    
    distFromCenter = ofDist(width/2,height/2,posX,posY);
    
    if (tempX > posX){
        rotateX = 1*(tempX-posX);
    }else if (tempX < posX){
        rotateX = -1*(tempX-posX);
    } else {
        rotateX = 0;
    }

    if (tempY > posY){
        rotateY = 1*(tempY-posY);
    }else if (tempY < posY){
        rotateX = -1*(tempY-posY);
    } else {
        rotateY = 1;
    }
    
    
//
//    rotateX = 1;
//    rotateY = 1;
    rotateZ = 1;
    for (int i = 0; i < line.getVertices().size(); i++){
        ofPoint fromCenter = line.getVertices()[i] - ofPoint(ofGetWidth()/2, ofGetHeight()/2);
        ofMatrix4x4 rotateMatrix;
        rotateMatrix.makeRotationMatrix(1, rotateX, rotateY, rotateZ);
        ofPoint rot = fromCenter * rotateMatrix + ofPoint(ofGetWidth()/2, ofGetHeight()/2);
        line.getVertices()[i] = rot;
    }
    
    for (int i = 0; i < lines.size(); i++){
        for (int j = 0; j < lines[i].getVertices().size(); j++){
            ofPoint fromCenter = lines[i].getVertices()[j] - ofPoint(ofGetWidth()/2, ofGetHeight()/2);
            ofMatrix4x4 rotateMatrix;
            rotateMatrix.makeRotationMatrix(1, rotateX, rotateY, rotateZ);
            ofPoint rot = fromCenter * rotateMatrix + ofPoint(ofGetWidth()/2, ofGetHeight()/2);
            lines[i].getVertices()[j] = rot;
        }
    }
    


}
//--------------------------------------------------------------------

void ballOfString::draw(){
    
    
    
    ofFill();
    ofSetColor(255,255,255);
    ofBackground(0,0,0);
    
    //ofDrawSphere(tempX,tempY,10);
//
//    for(int i = 0; i <5; i++){
//        for (int j = 0; j<5; j++){
//            ofSeedRandom(100000*i*j);
//            ofPoint randPoints;
//            randPoints.set(ofRandom(50-j,width-50*i),ofRandom(50-j,height-50-i));
//            ofDrawCircle(randPoints, ofRandom(3,10));
//        }
//    }
    
    ofSetColor(80);
    line.draw();
    for (int i = 0; i < lines.size(); i++){
        for(int j = 0; j< lines[i].getVertices().size(); j++){
//            ofPoint pointys;
//            pointys.set(lines[i].getResampledBySpacing(30).getVertices()[j]);
            ofPoint fromCenter = lines[i].getVertices()[j] - ofPoint(ofGetWidth()/2, ofGetHeight()/2);

           // line.getSmoothed(3);
            ofPushMatrix();
            ofTranslate(width/2,height/2);
            float radius;
            radius = 5+5*sin(time+.18*j);
            ofSetColor(200+55*sin(time-.4*j));
            ofDrawCircle(fromCenter, radius);
            
            ofPopMatrix();
            
        }

    }
}
//--------------------------------------------------------------------
void ballOfString::touchDown(ofTouchEventArgs & touch){
    tempX = touch.x;
    tempY = touch.y;
    line.clear();
 //   lines.clear();
    

    
    tempAngle = acos(ofDist(width/2, height/2, width/2, touch.y) / ofDist(width/2, height/2, touch.x, touch.y))*(180/PI);
    //cout <<tempAngle << endl;
}
//--------------------------------------------------------------------

void ballOfString::touchUp(ofTouchEventArgs & touch){
    tempX = touch.x;
    tempY = touch.y;
    tempAngle = acos(ofDist(width/2, height/2, width/2, touch.y) / ofDist(width/2, height/2, touch.x, touch.y))*(180/PI);
    lines.push_back(line);


}
//--------------------------------------------------------------------

void ballOfString::touchMoved(ofTouchEventArgs & touch){
    tempX = touch.x;
    tempY = touch.y;
    tempAngle = acos(ofDist(width/2, height/2, width/2, touch.y) / ofDist(width/2, height/2, touch.x, touch.y))*(180/PI);
    
    for (int i = 0; i < 5; i++){
       // ofSeedRandom(touch.x*100000);
   // line.addVertex(ofPoint(touch.x+ofRandom(-10,50)*i*sin(time),touch.y-ofRandom(-3,3)));
        line.addVertex(ofPoint(touch.x,touch.y));
    }

}



