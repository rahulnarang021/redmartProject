//
//  ProductDetailPresenter.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

class ProductDetailPresenter: NSObject {
    weak var view: ProductDetailViewInput?
    var product: Product?
}

extension ProductDetailPresenter: ProductDetailViewOutput {
    func viewLoaded() {
        if let imageUrl = product?.getImageUrl() {
            view?.setProductImage(imageUrl: imageUrl)
        }
        view?.setProductDesc(descText: product?.desc)
        view?.setProductName(nameText: product?.title)
        view?.setProductPrice(priceText: product?.getDisplayedPrice())
    }
}
