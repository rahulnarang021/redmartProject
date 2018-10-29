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
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    func fetchListOfAllProducts(page: Int) {
        presenter?.productListDidFetch(products: TestUtility.getProuctList(bundle: bundle))
    }
}
