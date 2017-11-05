#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	
//    firstScene.setup();
//    firstScene sceneOne;//= firstScene();
    myScenes.push_back((firstScene*)&sceneOne);
    myScenes[0]->setup();
}

//--------------------------------------------------------------
void ofApp::update(){
//    sceneOne.update();
     myScenes[0]->update();
}

//--------------------------------------------------------------
void ofApp::draw(){
//    sceneOne.draw();
     myScenes[0]->draw();
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
       myScenes[0]->touchDown(touch);
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
     myScenes[0]->touchMoved(touch);
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
     myScenes[0]->touchUp(touch);
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

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
