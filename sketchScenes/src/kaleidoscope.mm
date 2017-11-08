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
    
    myText = "slippery ";
    myFont.load("Avenir Next.ttc", 300, true,true,true);
    myFont.getFontTexture();
    ofSetColor(255,255,255);
    fontBox.set(myFont.getStringBoundingBox(myText, 0, 0));
    fontWidth = fontBox.width;
    fontHeight = fontBox.height;
    textFBO.allocate(10+fontWidth,fontHeight, GL_RGBA);
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
    //ofPushMatrix();
    //ofTranslate(100,100);

    textFBO.begin();
    ofClear(0,0,0,0);
    //glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);

    //myFont.drawString(myText, tempX,tempY);
    
    //yFont.drawStringAsShapes(myText, 0, -fontHeight);
    ofSetColor(40,140,210);
    //ofNoFill();
    //ofDrawRectangle(fontBox.x+1, fontBox.y+1, fontBox.width-2, fontBox.height-2);
    ofSetLineWidth(3);
    myFont.drawString(myText, textMover.x-1, textMover.y);
    textFBO.end();
    
    ofPushMatrix();
    ofScale(.8,.8);
    textFBO.draw(100,100);
    ofPopMatrix();
    
    
    
    
    ofMesh mainMesh;
    mainMesh.setMode(OF_PRIMITIVE_TRIANGLE_STRIP);
    for (int i = 0 ; i < baseLine.size(); i++){
        
    }
    
    
    
    
    
   // float time = ofGetElapsedTimef();
        ofMesh myMesh;
        myMesh.setMode(OF_PRIMITIVE_TRIANGLE_STRIP);
        for (int i = 0; i < smoothLine.size(); i++){

        
        int i_m_1 = MAX(i-1,0);
        int i_p_1 = MIN(i+1,smoothLine.size()-1);
        ofPoint a = smoothLine[i_m_1];
        ofPoint b = smoothLine[i_p_1];
        
        distance += (smoothLine[i] - a).length();
        
        ofPoint diff = b-a;
        diff.normalize();
        diff.rotate(90, ofPoint(0,0,1));
        myMesh.addVertex( smoothLine[i] + diff * 180+50*sin(time-.06*i));
        myMesh.addVertex( smoothLine[i] - diff * 180+50*cos(time-.04*i));
        
        myMesh.addColor(ofColor(70));
        myMesh.addColor(ofColor(255));
//float x = fontBox.width/1 + (fontBox.width/1 * sin(2*distance * ofMap(sin(time-.05*i), -1, 1, 0.01, 0.001) + time*.01));
            //   float x = fontWidth/2 + (fontWidth * sin(distance * ofMap(sin(.1*time), -1, 1, ofMap(tempX,0,width,0.00001,.001),  ofMap(tempY,0,height,0.00001,.001)) + time*1.0));
           // float x = fontWidth/2 + (fontWidth/2 * sin(time-distance));
           // float x = (10+fontWidth)/2 + ((10+fontWidth)/2 * sin(distance * ofMap(sin(ofMap(tempY,0,height,0.0001,.001)*time), -1, 1, 0.01, 0.001) + time*.01));
            
            float x = (10+fontWidth)/2 + ((10+fontWidth)/1)*sin(.1*time-ofMap(posY,0,height,.01,.5)*i);

            cout << x << endl;


                        myMesh.addTexCoord(  myFont.getFontTexture().getCoordFromPoint(x, 0)   );
                        myMesh.addTexCoord(  myFont.getFontTexture().getCoordFromPoint(x,1.5*height)   );
            
        }
    textFBO.getTexture().bind();
    //glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);

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

