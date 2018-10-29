//
//  ProductTest.swift
//  GridTests
//
//  Created by Rahul Narang on 29/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import XCTest
@testable import Grid

class ProductTest: XCTestCase {

    private var product: Product!
    override func setUp() {
       self.initializeProduct()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func initializeProduct() {
        let bundle: Bundle = Bundle(for: type(of: self))
        if let productDictionary = TestUtility.getTestDataForFile(fileName: "product", inBundle: bundle) as? [String: Any?] {
            product = Product(response: productDictionary)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Test Product
    func testProduct() {
        XCTAssertEqual(product.title, "Cadbury Dairy Milk Packed With Picnic", "Product title should is wrongly parsed")
        XCTAssertEqual(product.desc, "Cadbury Dairy Milk Picnic contains Dairy milk chocolate with vanilla flavoured creme, smooth flowing caramel and peanut pieces.", "Product description is wrongly parsed")
        XCTAssertEqual(product.getDisplayedPrice(), "$5.2", "Product price is wrongly parsed")
    }
}
