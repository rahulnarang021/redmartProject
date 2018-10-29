//
//  ProductCell.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell, Reusable {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = CGFloat(defaultCornerRadius)
    }
    
    // MARK: - Configure Cell
    func configureCell(product: Product?) {
        highlightCell(shouldHighlight: false)
        productNameLabel.text = product?.title
        priceLabel.text = product?.getDisplayedPrice()
        if let imageURL = product?.getImageUrl() {
            productImageView.setImage(url: imageURL)
        }
        else {
            productImageView.image = nil
        }
    }
    
    // MARK: - Highlight/UnHighlight Cell
    func highlightCell(shouldHighlight: Bool) {
        if(shouldHighlight) {
            productImageView.transform = .init(scaleX: 0.9, y: 0.9)
            self.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        }
        else {
            productImageView.transform = .identity
            self.backgroundColor = UIColor.white
        }
    }
    
    // MARK: - ReuseMethod
    override func prepareForReuse() {
        productImageView.image = nil
        productNameLabel.text = nil
    }
}
