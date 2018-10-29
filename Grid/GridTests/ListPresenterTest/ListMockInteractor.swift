//
//  ListMockInteractor.swift
//  GridTests
//
//  Created by Rahul Narang on 29/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit
@testable import Grid

class ListMockInteractor: NSObject, ListInteractorInput {
    var presenter: ListInteractorOutput?
    let bundle: Bundle
    var productList: [Product]  = [] {
        didSet {
            presenter?.productListDidFetch(products: productList)
        }
    }
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    func fetchListOfAllProducts(page: Int) {
        if let products = TestUtility.getProuctList(bundle: bundle) {
            productList.append(contentsOf: products)
        }
    }
}
