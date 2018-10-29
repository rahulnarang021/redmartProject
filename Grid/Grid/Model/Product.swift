//
//  Product.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import Foundation
class Product: NSObject {
    
    var title: String?
    var imageUrl: String?
    var desc: String?
    var price: Double?
    
    // MARK: - Response Parsing
    init(response: [String: Any?]?) {
        super.init()
        title = response?["title"] as? String
        desc = response?["desc"] as? String
        self.parseImages(imageArray: response?["images"] as? [[String: Any?]])
        self.parsePrice(priceDict: response?["pricing"] as? [String: Any?])
        
    }
    
    func parseImages(imageArray: [[String: Any?]]?) {
        if let images = imageArray, images.count > 0 {
            imageUrl = images[0]["name"] as? String
        }
    }
    
    func parsePrice(priceDict: [String: Any?]?) {
        if let priceDict = priceDict {
            price = priceDict["price"] as? Double
        }
    }
    // MARK: - Helper Functions
    func getImageUrl() -> URL? {
        if let imagePath = self.imageUrl, let imageURL = URL(string: CommonUtility.getFullImageUrlPath(path: imagePath)) {
            return imageURL
        }
        return nil
    }
    func getDisplayedPrice() -> String? {
        if let price = self.price {
            return "$ \(price)"
        }
        return nil
    }
}
