//
//  ListInteractor.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

class ListInteractor: NSObject {
    
    var apiWrapper: ProductListAPIInput?
    weak var presenter: ListInteractorOutput?
    var productList: [Product]? {
        didSet {
            presenter?.productListDidFetch(products: productList)
        }
    }
    
    init(apiWrapper: ProductListAPIInput?) {
        super.init()
        self.apiWrapper = apiWrapper
        self.apiWrapper?.output = self
    }
}
extension ListInteractor: ListInteractorInput {
    func fetchListOfAllProducts(page: Int) {
        if page >= 0 {
            apiWrapper?.getProductList(page: page)
        }
    }
}

extension ListInteractor: ProductListAPIOutput {
    func productListDidFetch(products: [Product]?, error: Error?) {
        if let productArray = products {
            if self.productList == nil {
                self.productList = Array(productArray)
            }
            else {
                self.productList?.append(contentsOf: productArray)
            }
        }
        else {
            presenter?.productListDidFail(error: error)
        }
    }
}
