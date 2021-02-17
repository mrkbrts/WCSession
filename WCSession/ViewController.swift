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
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
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
        wcSession.transferUserInfo(dataToSend)
    }
    
    @IBAction func sendmButton(_ sender: UIButton) {
        let txt = "hellocska"
        let message = ["message":txt]
        wcSession.sendMessage(message, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
    }
    
    
}

