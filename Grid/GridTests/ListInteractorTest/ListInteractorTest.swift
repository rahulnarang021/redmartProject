//
//  ListInteractorTest.swift
//  GridTests
//
//  Created by Rahul Narang on 29/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import XCTest
@testable import Grid

class ListInteractorTest: XCTestCase {

    private var interactor: ListInteractor!
    override func setUp() {
        self.initialiseInteractor()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Initialisation
    func initialiseInteractor() {
        let bundle: Bundle = Bundle(for: type(of: self))
        
        let apiWrapper: ProductListAPIInput = ListMockAPIWrapper(bundle: bundle)
        interactor = ListInteractor(apiWrapper: apiWrapper)
    }
    
    func testInteractor() {
        XCTAssertEqual(interactor.productList?.count ?? 0, 0, "Product List Should be Empty")
        interactor.fetchListOfAllProducts(page: -1)
        XCTAssertEqual(interactor.productList?.count ?? 0, 0, "Product List Should be Empty")
        interactor.fetchListOfAllProducts(page: 0)
        XCTAssertEqual(interactor.productList?.count ?? 0, 30, "Product List Should contain 30 products")
        interactor.fetchListOfAllProducts(page: 1)
        XCTAssertEqual(interactor.productList?.count ?? 0, 60, "Product List Should contain 60 products")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
