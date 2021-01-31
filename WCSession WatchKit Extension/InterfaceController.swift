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
    
    //The text label on the Watch Storyboard. Helps with debugging.
    @IBOutlet weak var helloLabel: WKInterfaceLabel!
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("watchOS - activationDidCompleteWith:", activationState)
    }
    
    
    //Whatever arrives, it will get printed to the console as well as the 'helloLabel' will be changed to help the debugging progress.
    //BUG: This is the part, that never gets run, even tough the WCSession activated successfully.
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        print("watchOS - didReceiveUserInfo", userInfo)
        helloLabel.setText("didReceiveUserInfo")
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("watchOS - didReceiveMessage", message)
        helloLabel.setText("didReceiveMessage 1")
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        replyHandler(["does it work?": "yes sir"])
        print("watchOS - didReceiveMessage", message)
        helloLabel.setText("didReceiveMessage 2")
    }
    
    
    //Setting the Interface Controller as WCSession Delegate
    private var session: WCSession = .default
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        session.delegate = self
        session.activate()
    }
    
    
    //Activating the session on the watchOS side as well.
    override func willActivate() {
        if WCSession.isSupported() {
                let session = WCSession.default
                session.delegate = self
                session.activate()
            }
    }
    
    override func didDeactivate() {
    }
    
}
