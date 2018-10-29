//
//  ListViewController.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, Reusable {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var presenter: ListViewOutput?
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Product List"
        presenter?.viewLoaded()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - UpdateLoadingStatus
    func updateLoadingStatus(isHidden: Bool) {
        self.productCollectionView.isHidden = !isHidden
        if(isHidden) {
            self.activityIndicator.stopAnimating()
        }
        else {
            self.activityIndicator.startAnimating()
        }
    }
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getNumberOfItems(section) ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (presenter?.numberOfSections() ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if presenter?.shouldShowLoaderCell(indexPath) ?? false, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoaderCell.reuseIdentifier(), for: indexPath) as? LoaderCell { // show loader cell
            cell.startLoading()
            return cell
        }
        else if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier(), for: indexPath) as? ProductCell {
                cell.configureCell(product: presenter?.getProductAtIndexPath(indexPath))
                return cell
        }
        return UICollectionViewCell() // done to prevent crash and silent compile error
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        presenter?.cellDisplayedAtIndexPath(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        if presenter?.shouldShowLoaderCell(indexPath) ?? false {
            return CGSize(width: screenWidth, height: 50) // height fixed for loader cell
        }
        let items: Int = (presenter?.getItemsInRow() ?? 0)
        let itemWidth: CGFloat = (screenWidth - CGFloat(items+1) * 10.0)/CGFloat(items) //sectionInset.left*3
        return CGSize(width: itemWidth, height: itemWidth + (27.0*2)) // 27 px space remaining after image
    }
    
    // MARK: - UICollectionViewDelegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductCell {
            cell.highlightCell(shouldHighlight: false)
            presenter?.cellDidClick(indexPath)
        }

    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductCell {
            UIView.animate(withDuration: 0.3) {
                cell.highlightCell(shouldHighlight: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductCell {
            UIView.animate(withDuration: 0.3) {
                cell.highlightCell(shouldHighlight: true)
            }
        }
    }
}

extension ListViewController: ListViewInput {
    func showLoader() {
        self.updateLoadingStatus(isHidden: false)
    }
    func hideLoader() {
        self.updateLoadingStatus(isHidden: true)
    }
    func reloadView() {
        self.productCollectionView.reloadData()
    }
    func showErroMessage(_ message: String?) {
        CommonUtility.showErrorMessage(title: nil, message: message)
    }
}
