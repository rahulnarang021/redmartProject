//
//  ListPresenter.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

class ListPresenter: NSObject {
    var interactor: ListInteractorInput?
    weak var view: ListViewInput?
    var router: ListRouterInput?
    
    var isAPIInProgress: Bool = false // to stop calling api everytime user scroll when api is being in progress
    lazy var productArray: [Product] = { // fetched products
        return []
    }()
    
    // MARK: - Interactor Methods
    func callAPIToFetchProducts() {
        if !isAPIInProgress {
            isAPIInProgress = true
            interactor?.fetchListOfAllProducts(page: (productArray.count)/itemsPerPage)
        }
    }
}
extension ListPresenter: ListViewOutput {
    func viewLoaded() { // viewDidLoad
        view?.showLoader()
        callAPIToFetchProducts()
    }
    
    func getNumberOfItems(_ section: Int) -> Int {
        if productArray.count > 0 {
            return section == 0 ? productArray.count : 1
        }
        return 0
    }
    func numberOfSections() -> Int {
        return 2
    }
    func shouldShowLoaderCell(_ indexPath: IndexPath) -> Bool {
        return (indexPath.section == 1)
    }
    func getProductAtIndexPath(_ indexPath: IndexPath) -> Product? {
        if(productArray.count > indexPath.item) {
            return productArray[indexPath.item]
        }
        return nil
    }
    func getItemsInRow() -> Int {
        return 3
    }
    func cellDisplayedAtIndexPath(_ indexPath: IndexPath) {
        if indexPath.section == 1 {
            self.callAPIToFetchProducts()
        }
    }
    func cellDidClick(_ indexPath: IndexPath) {
        if(indexPath.section == 0 && productArray.count > indexPath.item) {
            router?.navigateToProductDetailScreen(product: productArray[indexPath.item])
        }
    }
}

extension ListPresenter: ListInteractorOutput {
    func productListDidFetch(products: [Product]?) {
        defer {
            view?.hideLoader()
            isAPIInProgress = false
        }
        guard let products = products else {
            return
        }
        productArray.append(contentsOf: products)
        view?.reloadView()
    }
    
    func productListDidFail(error: Error?) {
        view?.hideLoader()
        view?.showErroMessage(error?.localizedDescription)
        isAPIInProgress = false
    }
}

