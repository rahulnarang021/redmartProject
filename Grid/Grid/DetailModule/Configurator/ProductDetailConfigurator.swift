
//
//  ProductDetailConfigurator.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

class ProductDetailConfigurator: NSObject {
    class func getProductDetailModule(product: Product) -> UIViewController {
        let presenter: ProductDetailPresenter = ProductDetailPresenter()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: ProductDetailViewController = storyboard.instantiateViewController(withIdentifier: ProductDetailViewController.reuseIdentifier()) as! ProductDetailViewController
        presenter.view = viewController
        presenter.product = product
        viewController.presenter = presenter
        return viewController
    }
}
