//
//  File.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit
extension UIImageView {
    private static var _imageUrlString = [String: String?]()
    
    var imageUrlString: String? { // to check for image when reusing cells
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UIImageView._imageUrlString[tmpAddress] ?? nil
        }
        set(newValue) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UIImageView._imageUrlString[tmpAddress] = newValue
        }
    }
    
    // MARK: - Download Image from Server
    func setImage(url: URL) {
        self.imageUrlString = url.absoluteString
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        if self?.imageUrlString == url.absoluteString {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}
