//
//  ToastTest.swift
//  test
//
//  Created by madara on 4/8/20.
//

import UIKit

@objc(Taost)
class Taost: NSObject, RCTBridgeModule {
  
  

  static func moduleName() -> String! {
    return "Toast"
  }
  
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  
  
  @objc(show:)
  func show(message: String) -> Void{
    
//    let rootView = UIApplication.shared.delegate.window.rootViewController
    
    
    DispatchQueue.main.async {
      let del =  (UIApplication.shared.delegate as? AppDelegate)
      let rootView = del?.window.rootViewController

      
      let toastLabel = UILabel(frame: CGRect(x: rootView!.view.frame.size.width/2 - 75, y: rootView!.view.frame.size.height-100, width: 150, height: 35))
      toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
      toastLabel.textColor = UIColor.white
      toastLabel.textAlignment = .center;
      toastLabel.text = message
      toastLabel.alpha = 1.0
      toastLabel.layer.cornerRadius = 10;
      toastLabel.clipsToBounds  =  true
      rootView!.view.addSubview(toastLabel)
      UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
           toastLabel.alpha = 0.0
      }, completion: {(isCompleted) in
          toastLabel.removeFromSuperview()
      })
    }
    
  }
  

}
