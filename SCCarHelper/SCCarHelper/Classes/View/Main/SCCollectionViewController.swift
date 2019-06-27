//
//  SCCollectionViewController.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

private let reuseIdentifier = "Cell"

class SCCollectionViewController: UICollectionViewController {
    private let viewModel = SCCarViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    override func viewWillLayoutSubviews() {
        var cellsPerRow = 2
        if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight{
            cellsPerRow = 3
        }
        guard let collectionView = collectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        flowLayout.itemSize =  CGSize(width: itemWidth, height: itemWidth)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
}
private extension SCCollectionViewController{
    func setupUI(){
        // set navigation bar title
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.darkGray,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        guard let collectionView = collectionView, let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let margin: CGFloat = 10
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.register(UINib(nibName: "SCCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func loadData(){
        SVProgressHUD.show()
        viewModel.loadCarData { [weak self](isSuccess) in
            self?.collectionView.reloadData()
            SVProgressHUD.dismiss()
        }
    }
}

//Mark: -collection view methods
extension SCCollectionViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.result?.Result?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SCCollectionViewCell
        cell.carData = viewModel.result?.Result?[indexPath.item]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? SCCollectionViewCell
        let vc = SCDetailsViewController()
        vc.viewModel = viewModel
        viewModel.detailsUrlString = cell?.carData?.DetailsUrl
        navigationController?.pushViewController(vc, animated: true)
    }
}
