//
//  ListPresenterTest.swift
//  GridTests
//
//  Created by Rahul Narang on 29/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import XCTest
@testable import Grid

class ListPresenterTest: XCTestCase {

    private var presenter: ListPresenter!
    override func setUp() {
        self.initialisePresenter()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func initialisePresenter() {
        let bundle: Bundle = Bundle(for: type(of: self))
        presenter = ListPresenter()
        let interactor: ListMockInteractor = ListMockInteractor(bundle: bundle)
        interactor.presenter = presenter
        presenter.interactor = interactor
    }
    
    func testPresenter() {
        XCTAssertEqual(presenter.productArray.count, 0, "Productlist should be empty")
        XCTAssertEqual(presenter.getNumberOfItems(0), 0, "Productlist should contain 30 products")
        XCTAssertEqual(presenter.getNumberOfItems(1), 0, "Productlist should contain 30 products")
        XCTAssertNil(presenter.getProductAtIndexPath(IndexPath(item: 0, section: 0)), "Product should be nil")
        presenter.viewLoaded()
        XCTAssertEqual(presenter.productArray.count, 30, "Productlist should contain 30 products")
        XCTAssertEqual(presenter.getNumberOfItems(0), 30, "Productlist should contain 30 products")
        XCTAssertNotNil(presenter.getProductAtIndexPath(IndexPath(item: 0, section: 0)), "Product should be nil")
        XCTAssertEqual(presenter.getNumberOfItems(1), 1, "Productlist should contain 30 products")
        XCTAssertEqual(presenter.shouldShowLoaderCell(IndexPath(item: 0, section: 0)), false, "Should not show loader")
        XCTAssertEqual(presenter.shouldShowLoaderCell(IndexPath(item: 0, section: 1)), true, "Should not show loader")
        XCTAssertEqual(presenter.shouldShowLoaderCell(IndexPath(item: 0, section: 1)), true, "Should not show loader")
        XCTAssertEqual(presenter.getItemsInRow(), 3, "Should show 3 items in a row")
        presenter.cellDisplayedAtIndexPath(IndexPath(item: 30, section: 0))
        XCTAssertEqual(presenter.getNumberOfItems(0), 30, "Productlist should contain 30 products")
        presenter.cellDisplayedAtIndexPath(IndexPath(item: 0, section: 1))
        XCTAssertEqual(presenter.getNumberOfItems(0), 60, "Productlist should contain 60 products")
    }
}
