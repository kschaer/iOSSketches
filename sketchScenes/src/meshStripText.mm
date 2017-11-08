//
//  meshStripText.m
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/6/17.
//

#include "meshStripText.h"


//-----------------------------------------------
void meshStripText::setup(){
    points.clear();
    
    time = 0;
    tempX = 0;
    tempY = 0;
    posX = 0;
    posY = 0;
    width = ofGetWidth();
    height = ofGetHeight();
    
   // of3dPrimitive primitive;
    
    myText = "O";
    myFontPath = myFont.getPath(myText,41);
//    myFontPath.setStrokeColor(255);
//    myFontPath.setFillColor(ofColor(255,20,100));
//    myFontPath.setFilled(true);
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
    wiggleMod = 0;
    distance = 0;
}
//-----------------------------------------------
void meshStripText::update(){
    time = ofGetElapsedTimef();
    
    posX = ofLerp(posX, tempX, .2);
    posY = ofLerp(posY, tempY, .2);
    
    wiggleMod = ofMap(posX, 0, width, -1, 1);
    
}
//-----------------------------------------------
void meshStripText::draw(){
    ofBackground(0,0,0);
    ofPushMatrix();
//    ofTranslate(346,1449);
//    //ofTranslate(-tempX,-tempY);
//    ofTranslate(-785,-1025);
    ofTranslate(width/2, height/2);
    //ofTranslate(0,0,-300);

    ofPushMatrix();
    ofPoint  translatePoint;
    translatePoint.set(-1167,-614);
    ofRotateX(posY+90*sin(time+.01*posY));
    ofRotateY(posX+90*sin(time+.01*posX));
   // ofRotateZ(180*sin(time));
    ofTranslate(translatePoint);

    
    cout << "x " << tempX << " y " << tempY << endl;
    
    ofMesh myMesh;
    myMesh.setMode(OF_PRIMITIVE_TRIANGLE_STRIP);

    for (int i = 0; i < points.size(); i++){
        vector <ofVec2f> & wordPoints = points[i];
        for (int j = 0; j < wordPoints.size(); j++){
            
            ofPushMatrix();

          // ofRotateY(.01*j);
//            ofPushMatrix();
//            ofRotateY(posY*j);
//            ofPoint rotatePoint;
//            rotatePoint.set(300,0);
//            ofDrawCircle(rotatePoint, 5);
//            ofPopMatrix();

            
            int j_m_1 = MAX(j-1,0);
            int j_p_1 = MIN(j+1,wordPoints.size()-1);
            ofPoint a = wordPoints[j_m_1];
            ofPoint b = wordPoints[j_p_1];

            distance += (wordPoints[j] - a).length();
            
            ofPoint diff = b-a;
            diff.normalize();
            diff.rotate(90, ofPoint(0,0,1));
            
            
            ofPoint zMod;
            zMod.set(0,0, -300+(j+1)%100-.2*posY*sin(.1*j-time)-.1*posX*cos(.2*j+.3*time));
            
            
            ofPoint finalPoints1;
            finalPoints1.set( wordPoints[j] + diff * (90+50*cos(time- .1*j-2*wiggleMod)) + zMod);
            
            ofPoint finalPoints2;
            finalPoints2.set(wordPoints[j]  - diff *  (90+350*sin(time- .1*j-2*wiggleMod*.05*j))+ zMod);
            
           // diff.rotate(0, .001*posY+j, 0);

//            myMesh.addVertex( wordPoints[j] + translatePoint+ diff * (90+50*cos(time- .1*j-2*wiggleMod)));
//            myMesh.addColor(ofColor(255));
//
//            myMesh.addVertex( wordPoints[j] + translatePoint  - diff *  (90+350*sin(time- .1*j-2*wiggleMod*.05*j)));
            myMesh.addVertex( ofPoint(finalPoints1.x,finalPoints1.y,zMod.z));
            myMesh.addColor(ofColor(255));
            
            myMesh.addVertex( ofPoint(finalPoints2.x,finalPoints2.y,zMod.z));
           // myMesh.addColor(ofColor(0));
            myMesh.addColor(ofColor(0));
           // myMesh.addColor(ofColor(0));
    

            
            ofPopMatrix();


        }
    }
    ofTranslate(width/2,height/2);
    myMesh.draw();
    ofPopMatrix();
    ofPopMatrix();
}
//-----------------------------------------------
void meshStripText::touchDown(ofTouchEventArgs & touch){
    
    tempX = touch.x;
    tempY = touch.y;
    
}
//---------------------------------------------
void meshStripText::touchUp(ofTouchEventArgs & touch){
    
    tempX = touch.x;
    tempY = touch.y;
    
}


//-----------------------------------------------
void meshStripText::touchMoved(ofTouchEventArgs & touch){
    
    tempX = touch.x;
    tempY = touch.y;
    
    
}
