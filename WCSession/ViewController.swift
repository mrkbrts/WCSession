//
//  ViewController.swift
//  WCSession
//
//  Created by Bartos Márk on 2021. 01. 28..
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    
    var wcSession : WCSession! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //lehet kéne még egy check, hogy if WCSession.avalaible()
        //az eredeti, variable nélküli így nézett ki:
        // let session = WCSession.default
        //        } else if WCSession.isSupported() {
        //            session.delegate = self
        //            session.activate()
        
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//        print("WCSession - activationDidCompleteWith:", activationState, "and error code:", error as Any)
//        switch activationState {
//            case .activated:
//                print("WCSession - activationDidCompleteWith .activated")
//                //session.transferUserInfo(dictionaryToPass)
//            case .inactive:
//            print("WCSession - activationDidCompleteWith .inactive")
//            case .notActivated:
//            print("WCSession - activationDidCompleteWith .notActivated")
//            default:
//                print("WCSession - activationDidCompleteWith: something other ")
//                break
//            }
    }
    
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("WCSession - sessionDidBecomeInactive")
    }
    func sessionDidDeactivate(_ session: WCSession) {
        print("WCSession - sessionDidDeactivate")
    }
    
    var dataToSend = ["userInfo":"júzerInfó"]
    
    //Pushing the button on the iOS storyboard will attempt iOS-watchOS connection.
    @IBAction func tuiButton(_ sender: UIButton) {
        
        //let dictionaryToPass = ["product1": 0, "product2": 0]
        //let userInfo = []
        
        //try? wcSession.updateApplicationContext(dataToSend)
        //else {print("Nem sikerült a try")}
        
        //var data = dataToSend
        wcSession.transferUserInfo(dataToSend)
        
        //wcSession.transferUserInfo(["it works": "yeah kinda","but for real": "does it work?"])
        //wcSession.transferUserInfo(dictionaryToPass)
        
//        let session = WCSession.default
//        if session.isReachable {
//            session.transferUserInfo(dictionaryToPass)
//        } else if WCSession.isSupported() {
//            session.delegate = self
//            session.activate()
//        }
    }
    @IBAction func sendmButton(_ sender: UIButton) {
        
        let txt = "hellocska"
        let message = ["message":txt]
        
        wcSession.sendMessage(message, replyHandler: nil) { (error) in
            
            print(error.localizedDescription)
            
        }
        
        
//        let session = WCSession.default
//        if session.isReachable {
//            session.sendMessage(dictionaryToPass, replyHandler: { reply in
//                print(reply)
//            }, errorHandler: nil)
//        } else if WCSession.isSupported() {
//            session.delegate = self
//            session.activate()
//        }
    }
    
    
}

