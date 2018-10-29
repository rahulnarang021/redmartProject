//
//  ListMockAPIWrapper.swift
//  GridTests
//
//  Created by Rahul Narang on 29/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit
@testable import Grid

class ListMockAPIWrapper: NSObject, ProductListAPIInput {
    weak var output: ProductListAPIOutput?
    let bundle: Bundle
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    func getProductList(page: Int) {
        let productArray: [Product]? = TestUtility.getProuctList(bundle: bundle)
        self.output?.productListDidFetch(products: productArray, error: nil)

    }
    
}
