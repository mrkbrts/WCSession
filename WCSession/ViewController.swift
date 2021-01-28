//
//  ViewController.swift
//  WCSession
//
//  Created by Bartos Márk on 2021. 01. 28..
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    
    //Here is the dictionary to be passed to the Watch
    var watchInAppPurchases = ["Lift": 0, "Watch": 0]
    
    
    //This will run, if the connection is successfully completed
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("WCSession - activationDidCompleteWith:", activationState, "and error code:", error as Any)
        
        switch activationState {
            case .activated:
                print("WCSession - activationDidCompleteWith .activated")
                //session.transferUserInfo(watchInAppPurchases)
                session.sendMessage(watchInAppPurchases, replyHandler: nil, errorHandler: nil)
            case .inactive:
            print("WCSession - activationDidCompleteWith .inactive")
            case .notActivated:
            print("WCSession - activationDidCompleteWith .notActivated")
            default:
                // handle other states
                print("WCSession - activationDidCompleteWith .otherCases")
                break
            }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("WCSession - sessionDidBecomeInactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("WCSession - sessionDidDeactivate")
    }
    
    
    //Pushing this button will attempt iOS-watchOS connection
    @IBAction func button(_ sender: UIButton) {
        if WCSession.isSupported() {
                let session = WCSession.default
                session.delegate = self
                session.activate()
            }
    }
    
}

