//
//  CommonUtility.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

class CommonUtility: NSObject {

    // MARK: - Show Error Message
    class func showErrorMessage(title: String?, message: String? = errorMessage) {
        
        let titleMessage: String = title ?? "Error"
        let alert = UIAlertController(title: titleMessage, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
    }
    
    // MARK: - GetFullImageURL
    class func getFullImageUrlPath(path: String) -> String {
       return ("\(baseImageUrl)\(path)")
    }
}
