//
//  kaleidoscope.m
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/7/17.
//

#import <Foundation/Foundation.h>
//
//  feathery.m
//  sketchScenes
//
//  Created by Kaitlin Schaer on 11/6/17.
//

#include "kaleidoscope.h"

void kaleidoscope::setup(){
    line.clear();
    
    ofBackground(0,0,0);
    height = ofGetHeight();
    width = ofGetWidth();
    time = ofGetElapsedTimef();
    
    posX = 0;
    posY = 0;
    tempY = 0;
    tempX = 0;
    
    distance = 0;
    
    //625 x 212
    //textImage.load("text.png");
    
    myText = "ribbons";
    myFont.load("Avenir Next.ttc", 200, true,true,true);
    myFont.getFontTexture();
    ofSetColor(255,255,255);
    fontBox.set(myFont.getStringBoundingBox(myText, 0, 0));
    fontWidth = fontBox.width;
    fontHeight = fontBox.height;
    
    
    oneFBO.allocate(10+fontWidth,fontHeight, GL_RGBA);
    
    textFBO.allocate(10+fontWidth+30*5,fontHeight*5, GL_RGBA);
    textMover.set(5+fontBox.width-(fontBox.width+fontBox.x),fontBox.height-(fontBox.height + fontBox.y));
    
    // baseline.set(0,0);
    // boundingbox coordinates are top left of corner
    //allocate the fbo at baseline minus bounding box coordinates
    //
    
    
}
//--------------------------------------------------------------------

void kaleidoscope::update(){
    time = ofGetElapsedTimef();
    
    posX = ofLerp(posX, tempX, .2);
    posY = ofLerp(posY, tempY, .2);
    
    smoothLine = line.getSmoothed(3);
    smoothLine = line.getResampledBySpacing(5);

}
//--------------------------------------------------------------------

void kaleidoscope::draw(){
    ofBackground(0,0,0);


    oneFBO.begin();
    ofClear(0,0,0,0);


    ofSetColor(240,255,110);

    ofSetLineWidth(3);
    myFont.drawString(myText, textMover.x-1, textMover.y);
    oneFBO.end();
//
//    ofPushMatrix();
//    ofScale(.8,.8);
//    oneFBO.draw(100,100);
//    ofPopMatrix();

    
    
    
    ofMesh oneMesh;
    ofPolyline baseLine;
    for(int i = 0; i < width/2; i++){
        baseLine.addVertex(ofPoint(width/4+i,300));
    }
    baseLine.draw();
    
    
    for (int i = 0 ; i < baseLine.size(); i++){
        
    }
    
    
    //------------
    
    
    textFBO.begin();
    ofClear(0,0,0,0);
    ofSetColor(ofMap(posX,0,width,50,100),ofMap(posY,0,height,130,40),200+50*sin(time));
    for( int i = 0; i <4 ; i++){
        ofPushMatrix();
        
        myFont.drawString(myText, textMover.x-1+30*i, textMover.y+fontHeight*i);
        ofPopMatrix();
    }
    textFBO.end();

        ofPushMatrix();
        ofScale(.8,.8);
       // textFBO.draw(100,100);
        ofPopMatrix();
    
    
    
    
    
    //ofMesh mainMesh;
    //mainMesh.setMode(OF_PRIMITIVE_TRIANGLE_STRIP);
    for (int i = 0 ; i < baseLine.size(); i++){
        
    }
    
        ofMesh myMesh;
        myMesh.setMode(OF_PRIMITIVE_TRIANGLE_STRIP);
        for (int i = 0; i < smoothLine.size(); i++){

        
        int i_m_1 = MAX(i-1,0);
        int i_p_1 = MIN(i+1,smoothLine.size()-1);
        ofPoint a = smoothLine[i_m_1];
        ofPoint b = smoothLine[i_p_1];
        
        
       distance += (smoothLine[i] - a).length();
            if (distance > 2000*(smoothLine[i] - a).length()){
                distance = 0;
            } else {
                distance += (smoothLine[i] - a).length();

            }
    
        ofPoint diff = b-a;
        diff.normalize();
        diff.rotate(90, ofPoint(0,0,1));
        myMesh.addVertex( smoothLine[i] + diff * 180+50*sin(time-.06*i+.01*posY));
        myMesh.addVertex( smoothLine[i] - diff * 180+50*cos(time-.04*i-.01*posX));
        
        myMesh.addColor(ofColor(70));
        myMesh.addColor(ofColor(255));
//float x = (fontBox.width+10)/2 + (((fontBox.width+10)/2) *  sin(.03*distance * ofMap(sin(.01*time), -1, 1, 0.001, 0.0001) + sin(time-.01*i)));
            //float xMod = ofMap(tempY, 0, width, .001,1);
            
            
            float x = (fontBox.width+10)/2 + (fontBox.width+10)/2 *sin(distance * ofMap(sin(1*time*.6234), -1, 1, 0.001, 0.0001) +time);
            
            
            
             // float x = fontWidth/2 + (fontWidth * sin(distance * ofMap(sin(.1*time), -1, 1, ofMap(tempX,0,width,0.001,.1),  ofMap(tempY,0,height,0.00001,.001)) + time*1.0));
           // float x = fontWidth/2 + (fontWidth/2 * sin(time-distance));
            //float x = (10+fontWidth)/2 + ((10+fontWidth)/2 * sin(distance * ofMap(sin(ofMap(tempY,0,height,0.000001,1)*time), -1, 1, 0.01, 0.001) + time*.01));

          //  cout << xMod << endl;


                        myMesh.addTexCoord(  textFBO.getTexture().getCoordFromPoint(x, 0)   );
                        myMesh.addTexCoord(  textFBO.getTexture().getCoordFromPoint(x,fontHeight*5)   );
            
        }
    textFBO.getTexture().bind();
    myMesh.draw();
    textFBO.getTexture().unbind();
    
    
    
    
//
//    myFont.getFontTexture().bind();
//    myMesh.draw();
//    myFont.getFontTexture().unbind();
//
    
    
    
    

    
}
//--------------------------------------------------------------------
void kaleidoscope::touchDown(ofTouchEventArgs & touch){
    tempX = touch.x;
    tempY = touch.y;

    line.clear();
}
//--------------------------------------------------------------------

void kaleidoscope::touchUp(ofTouchEventArgs & touch){
    tempX = touch.x;
    tempY = touch.y;
}
//--------------------------------------------------------------------

void kaleidoscope::touchMoved(ofTouchEventArgs & touch){
    tempX = touch.x;
    tempY = touch.y;
    line.addVertex(touch.x,touch.y);


}

