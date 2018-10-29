//
//  ListRouter.swift
//  Grid
//
//  Created by Rahul Narang on 29/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

class ListRouter: NSObject, ListRouterInput {

    weak var viewController: UIViewController?
    
    // MARK: - Navigate to product detail screen
    func navigateToProductDetailScreen(product: Product?) {
        guard let product = product else {
            return
        }
        let productDetail: UIViewController = ProductDetailConfigurator.getProductDetailModule(product: product)
        viewController?.navigationController?.pushViewController(productDetail, animated: true)
    }
}
