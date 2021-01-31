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
    
    
    //The dictionary to be passed to the Watch
    var dictionaryToPass = ["product1": 0, "product2": 0]
    
    
    //This will run, if the connection is successfully completed.
    //BUG: After '.activate()'-ing the session, this function successfully runs in the '.activated' state.
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("WCSession - activationDidCompleteWith:", activationState, "and error code:", error as Any)
        switch activationState {
            case .activated:
                print("WCSession - activationDidCompleteWith .activated")
                //session.transferUserInfo(dictionaryToPass)
            case .inactive:
            print("WCSession - activationDidCompleteWith .inactive")
            case .notActivated:
            print("WCSession - activationDidCompleteWith .notActivated")
            default:
                print("WCSession - activationDidCompleteWith: something other ")
                break
            }
    }
    
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("WCSession - sessionDidBecomeInactive")
    }
    func sessionDidDeactivate(_ session: WCSession) {
        print("WCSession - sessionDidDeactivate")
    }
    
    
    //Pushing the button on the iOS storyboard will attempt iOS-watchOS connection.
    @IBAction func button(_ sender: UIButton) {
        let session = WCSession.default
        if session.isReachable {
            session.transferUserInfo(dictionaryToPass)
        } else if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }
    }
    
    
}

