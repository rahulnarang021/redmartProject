//
//  ListConfigurator.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

class ListConfigurator: NSObject {

    class func getListModule() -> UIViewController {
        let presenter: ListPresenter = ListPresenter()
        let router: ListRouter = ListRouter()
        let apiWrapper: ProductListAPIInput = ProductListAPIWrapper()
        let interactor: ListInteractor = ListInteractor(apiWrapper: apiWrapper)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: ListViewController = storyboard.instantiateViewController(withIdentifier: ListViewController.reuseIdentifier()) as! ListViewController

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        viewController.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
