//
//  ProductDetailViewController.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController, Reusable {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var describtionLabel: UILabel!
    var presenter: ProductDetailViewOutput?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        self.title = "Product Detail"
        // Do any additional setup after loading the view.
    }
}
extension ProductDetailViewController: ProductDetailViewInput {
    func setProductImage(imageUrl: URL) {
        self.productImageView.setImage(url: imageUrl)
    }
    func setProductPrice(priceText: String?) {
        if let priceText = priceText {
            self.priceLabel.text = "Price: \(priceText)"
        }
    }
    func setProductName(nameText: String?) {
        if let nameText = nameText {
            self.nameLabel.text = "Name: \(nameText)"
        }
    }
    func setProductDesc(descText: String?) {
        if let descText = descText {
            self.describtionLabel.text = "Desc: \(descText)"
        }
    }
}

