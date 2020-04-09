//
//  Toast.swift
//  test
//
//  Created by madara on 4/6/20.
//

import Foundation
import UIKit




@objc(Toast)
class Toast:  RCTViewManager {
   

    @objc(show:)
    func show(message: String) {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                    print("default")

              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")


        }}))
        self.present(alert, animated: true, completion: nil)
    }
}
