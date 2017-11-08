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
    
    myText = "0";
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

    ofRotateY(180+180*sin(posY));
    ofTranslate(width/4, 2*height/3);

    //ofTranslate(width/2,0);
    ofMesh myMesh;
    myMesh.setMode(OF_PRIMITIVE_TRIANGLE_STRIP);

    for (int i = 0; i < points.size(); i++){
        vector <ofVec2f> & wordPoints = points[i];
        for (int j = 0; j < wordPoints.size(); j++){
            
            //ofDrawCircle(wordPoints[j], 5);
            int j_m_1 = MAX(j-1,0);
            int j_p_1 = MIN(j+1,wordPoints.size()-1);
            ofPoint a = wordPoints[j_m_1];
            ofPoint b = wordPoints[j_p_1];
            
            distance += (wordPoints[j] - a).length();
            
            ofPoint diff = b-a;
            diff.normalize();
            diff.rotate(90, ofPoint(0,0,1));
            //myMesh.addVertex(wordPoints[i+1] + diff *50);

            myMesh.addVertex( wordPoints[j] + diff * (90+50*cos(time- .1*j-2*wiggleMod)));
            myMesh.addColor(ofColor::white);

            myMesh.addVertex( wordPoints[j] - diff *  (90+350*sin(time- .1*j-2*wiggleMod*.05*j)));
            myMesh.addColor(ofColor::black);
            myMesh.addColor(ofColor::black);

            



            





        }
    }
    myMesh.draw();
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
