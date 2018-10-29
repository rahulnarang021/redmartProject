
//
//  TestUtility.swift
//  oyo-iosTests
//
//  Created by Rahul Narang on 19/09/18.
//  Copyright © 2018 oyo. All rights reserved.
//

import UIKit
@testable import Grid

class TestUtility: NSObject {

    class func getProuctList(bundle: Bundle) -> [Product]? {
        var productArray: [Product]?
        if let response = TestUtility.getTestDataForFile(fileName: "productList", inBundle: bundle) {
            if let responseDictionary: [String: Any?] = response as? [String: Any?] {
                if let productDictionaryArray: [[String: Any?]] = responseDictionary["products"] as? [[String: Any?]] {
                    productArray = []
                    for productDictionary: [String: Any?] in productDictionaryArray {
                        let productObject: Product = Product(response: productDictionary)
                        productArray?.append(productObject)
                    }
                }
            }
        }
        return productArray
    }
    class func getTestDataForFile(fileName: String, inBundle bundle: Bundle) -> Any? {
        do {
            if let filePath = bundle.path(forResource: fileName, ofType: "json") {
                let jsonString = try NSString(contentsOf: URL(fileURLWithPath: filePath), encoding: String.Encoding.utf8.rawValue)
                return self.convertToDictionary(text:(jsonString as String))
            }
        }
        catch {
            
        }
        return nil
    }
    
    private class func convertToDictionary(text: String) -> [String: Any?]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any?]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

}
