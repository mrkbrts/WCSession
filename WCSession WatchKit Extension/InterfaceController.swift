//
//  InterfaceController.swift
//  WCSession WatchKit Extension
//
//  Created by Bartos Márk on 2021. 01. 28..
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    private var session: WCSession = .default
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("watchOS - activationDidCompleteWith:", activationState)
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        print("watchOS - didReceiveUserInfo", userInfo)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("watchOS - didReceiveMessage", message)
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        replyHandler(["does it work?": "yes sir"])
        print("watchOS - didReceiveMessage", message)
    }
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        session.delegate = self
        session.activate()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        if WCSession.isSupported() {
                let session = WCSession.default
                session.delegate = self
                session.activate()
            }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
