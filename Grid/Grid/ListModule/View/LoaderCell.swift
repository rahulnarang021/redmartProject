//
//  LoaderCell.swift
//  Grid
//
//  Created by Rahul Narang on 29/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

class LoaderCell: UICollectionViewCell, Reusable {
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    func startLoading() {
        activityView.startAnimating()
    }
}
