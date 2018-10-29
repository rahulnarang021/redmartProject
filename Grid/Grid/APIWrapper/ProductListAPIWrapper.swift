//
//  ProductListAPIWrapper.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

protocol ProductListAPIInput {
    var output: ProductListAPIOutput? { get set }
    func getProductList(page: Int)
}
@objc protocol ProductListAPIOutput {
    func productListDidFetch(products: [Product]?, error: Error?)
}
class ProductListAPIWrapper: NSObject, ProductListAPIInput {
    weak var output: ProductListAPIOutput?
    
    // MARK: - Fetch Product List From API
    func getProductList(page: Int) {
        let apiPath: String = "\(listUrlPath)\(page)"
        NetworkingManager.sharedInstance.makeAPICallWithUrl(path: apiPath, requestType: .Get) {[weak self] (response: Any?, error: Error?) in
            var productArray: [Product]?
            if let responseDictionary: [String: Any?] = response as? [String: Any?] {
                if let productDictionaryArray: [[String: Any?]] = responseDictionary["products"] as? [[String: Any?]] {
                     productArray = []
                    for productDictionary: [String: Any?] in productDictionaryArray {
                        let productObject: Product = Product(response: productDictionary) // product parsing
                        productArray?.append(productObject)
                    }
                }
            }
            self?.output?.productListDidFetch(products: productArray, error: error)
        }
    }
}
