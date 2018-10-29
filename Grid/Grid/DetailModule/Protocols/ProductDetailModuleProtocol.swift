//
//  ProductDetailModuleProtocol.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import Foundation
@objc protocol ProductDetailViewInput {
    func setProductImage(imageUrl: URL)
    func setProductPrice(priceText: String?)
    func setProductName(nameText: String?)
    func setProductDesc(descText: String?)
}
protocol ProductDetailViewOutput {
    func viewLoaded()
}
