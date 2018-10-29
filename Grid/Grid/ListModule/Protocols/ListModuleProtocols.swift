//
//  ListModuleProtocols.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import Foundation

protocol ListViewOutput {
    func viewLoaded() //notify viewDidLoad
    func getNumberOfItems(_ section: Int) -> Int // get cell count
    func shouldShowLoaderCell(_ indexPath: IndexPath) -> Bool // to show loader
    func getItemsInRow() -> Int // 3 as of now bt it's configurable
    func cellDisplayedAtIndexPath(_ indexPath: IndexPath)// cell displayed for pagenation
    func getProductAtIndexPath(_ indexPath: IndexPath) -> Product? // get product to be displayed on cell
    func cellDidClick(_ indexPath: IndexPath) // handle cell click
    func numberOfSections() -> Int // handle ssection count for collectionview
}

@objc protocol ListViewInput {
    func showLoader()
    func hideLoader()
    func reloadView()
    func showErroMessage(_ message: String?)
}
@objc protocol ListInteractorOutput {
    func productListDidFetch(products: [Product]?)
    func productListDidFail(error: Error?)
}
protocol ListInteractorInput {
    func fetchListOfAllProducts(page: Int)
}

protocol ListRouterInput {
    func navigateToProductDetailScreen(product: Product?)
}
