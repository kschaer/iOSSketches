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
    
    myTextureImage.load("transparentleaves.png");
    
    textureFont.load("OCRAStd.otf",50,true,true,true);
    
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

    
    textureText = "hi!";
    textureFont.getFontTexture();
    ofSetColor(255,255,255);
    fontBox.set(textureFont.getStringBoundingBox(myText, 0, 0));
    fontWidth = fontBox.width;
    fontHeight = fontBox.height;
    
    
    
    
    oneFBO.allocate(width,height, GL_RGBA);
    
    textFBO.allocate(10+fontWidth+0,fontHeight*5, GL_RGBA);
    textMover.set(5+fontBox.width-(fontBox.width+fontBox.x),fontBox.height-(fontBox.height + fontBox.y));
    
    ofSetColor(255);
    
    vector <ofPolyline> polylines = myFontPath.getOutline();
    for (int i = 0; i < polylines.size(); i++){
        
        vector <ofVec2f> linePoints;
        ofPolyline reSpacedPolyline = polylines[i].getResampledBySpacing(2);
        boundingBox.set(reSpacedPolyline.getBoundingBox());
        ofDrawRectangle(boundingBox);

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
    
    textFBO.begin();
    ofClear(0,0,0,255);
   // ofSetColor(ofMap(posX,0,width,50,100),ofMap(posY,0,height,130,40),200+50*sin(time));
    //for( int i = 0; i <4 ; i++){
        ofPushMatrix();
        ofSetColor(255);
      //  textureFont.drawString(myText, 5+textMover.x-1, textMover.y);
    textureFont.drawString(textureText, tempX, tempY);
        ofPopMatrix();
    //}
    textFBO.end();
    
    textFBO.draw(200,200);
    
    ofBackground(0,0,0);
    ofPushMatrix();

    
    
    ofMesh myMesh;
    myMesh.setMode(OF_PRIMITIVE_TRIANGLE_STRIP);


    for (int i = 0; i < points.size(); i++){
        vector <ofVec2f> & wordPoints = points[i];
        for (int j = 0; j < wordPoints.size(); j++){
            boundingLine.addVertex(wordPoints[j]);
            
            int j_m_1 = MAX(j-1,0);
            int j_p_1 = MIN(j+1,wordPoints.size()-1);
            ofPoint a = wordPoints[j_m_1];
            ofPoint b = wordPoints[j_p_1];

            distance += (wordPoints[j] - a).length();
            if (distance > 2000*(wordPoints[j] - a).length()){
                distance = 0;
            } else {
                distance += (wordPoints[j] - a).length();
                
            }
            ofPoint diff = b-a;
            diff.normalize();
            diff.rotate(90, ofPoint(0,0,1));
            
            
           // ofPoint zMod;
            //zMod.set(0,0, -800+(j+1)%100-.2*posY*sin(.1*j-time)-185*cos(.01*j+.3*time));
            
            
            ofPoint finalPoints1;
            //finalPoints1.set( wordPoints[j] + diff * (90+50*cos(time- .1*j-2*wiggleMod)) + zMod);
            finalPoints1.set( wordPoints[j] + diff * (.3*posX+50*cos(.1*time- .05*j-2*wiggleMod)));
            ofPoint finalPoints2;
            //finalPoints2.set(wordPoints[j]  - diff *  (90+350*sin(time- .1*j-2*wiggleMod*.05*j))+ zMod);
            finalPoints2.set(wordPoints[j]  - diff *  (.4*posY+(.4*posY/2)*sin(.2*time- .01*j-1*wiggleMod*.01*j)));
            

//            myMesh.addVertex( ofPoint(finalPoints1.x,finalPoints1.y,zMod.z));
            myMesh.addVertex( ofPoint(finalPoints1.x,finalPoints1.y));

            myMesh.addColor(ofColor(255));
           // myMesh.addColor(ofColor(255));

//            myMesh.addVertex( ofPoint(finalPoints2.x,finalPoints2.y,zMod.z));
            myMesh.addVertex( ofPoint(finalPoints2.x,finalPoints2.y));

            myMesh.addColor(ofColor(0));
            
             float x = textureFont.getFontTexture().getWidth()/2 + (textureFont.getFontTexture().getWidth()/2 *sin(distance * ofMap(sin(1*time*.6234), -1, 1, 0.001, 0.0001) +time));
            
            
            //float x = (fontBox.width+10)/2 + (fontBox.width+10)/2 *sin(distance * ofMap(sin(1*time*.6234), -1, 1, 0.001, 0.0001) +time);
            myMesh.addTexCoord(  textureFont.getFontTexture().getCoordFromPoint(x, 0)   );
            myMesh.addTexCoord( textureFont.getFontTexture().getCoordFromPoint(x,textureFont.getFontTexture().getHeight())   );
          //  cout <<wordPoints.size()<<endl;
            


        }
    }

    ofRectangle boundingRect;
    boundingRect.set(boundingLine.getBoundingBox());
    
    ofSetColor(0,0,255);
    //ofDrawCircle(boundingRect.x,boundingRect.y,100);
    ofTranslate(-boundingRect.x-boundingRect.width/2 , -boundingRect.y-boundingRect.height/2);

    ofPushMatrix();
    ofTranslate(width/2,height/2);

    textureFont.getFontTexture().bind();
    myMesh.draw();
    textureFont.getFontTexture().unbind();
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
