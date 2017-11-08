#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    
   // spiroText.setup();
//    sceneManager.addScene(ofPtr<ofxScene>(new kaleidoscope)); //working,  NOT done
//
//    sceneManager.addScene(ofPtr<ofxScene>(new spirograph1)); // working, done
//    sceneManager.addScene(ofPtr<ofxScene>(new wobblyText)); //working, done - may do more of these
//    sceneManager.addScene(ofPtr<ofxScene>(new feathery)); //working, done- could be re-colored
//
    
    sceneManager.addScene(ofPtr<ofxScene>(new meshStripText));


    //sceneManager.addScene(ofPtr<ofxScene>(new SecondScene));
    sceneManager.setExitByTime(false);
    //sceneManager.setSceneDuration(0.3, 1.5, 0.3);
    sceneManager.setSceneDuration(.3, .3); //fade in, fade out time
    
    sceneManager.run();
    
}
void ofApp::update(){
    sceneManager.update();
    //spiroText.update();
}
//--------------------------------------------------------------
void ofApp::draw(){
   // spiroText.draw();
    sceneManager.draw();
}

//--------------------------------------------------------------
void ofApp::exit(){
    
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    
    //spiroText.touchDown(touch);
    
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

    //spiroText.touchMoved(touch);
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    sceneManager.changeScene();
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}

