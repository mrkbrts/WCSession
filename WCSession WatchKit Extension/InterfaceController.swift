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
        //print("watchOS - activationDidCompleteWith:", activationState)
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        print("watchOS - didReceiveApplicationContext")
    }
    
    //Whatever arrives, it will get printed to the console as well as the 'helloLabel' will be changed to help the debugging progress.
    //BUG: This is the part, that never gets run, even tough the WCSession activated successfully.
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        print("watchOS - didReceiveUserInfo")
        helloLabel.setText("userInfo")
    }
    
//    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : String] = [:]) {
//        print("watchOS - didReceiveUserInfo")
//        //helloLabel.setText("didReceiveUserInfo")
//    }
//
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        print("didReceiveMessage", message)
        let text = message["message"] as! String
        helloLabel.setText(text)
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        //replyHandler(["does it work?": "yes sir"])
        //print("watchOS - didReceiveMessage", message)
        //helloLabel.setText("didReceiveMessage")
    }
    
    
    //Setting the Interface Controller as WCSession Delegate
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        //session.delegate = self
        //session.activate()
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
