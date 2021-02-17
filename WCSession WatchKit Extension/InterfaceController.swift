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
    
    var wcSession : WCSession!
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        print("watchOS - didReceiveUserInfo", userInfo)
        helloLabel.setText("userInfo")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("didReceiveMessage", message)
        let text = message["message"] as! String
        helloLabel.setText(text)
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
    }
    
    
    //Setting the Interface Controller as WCSession Delegate
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    
    //Activating the session on the watchOS side as well.
    override func willActivate() {
        super.willActivate()
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
}
