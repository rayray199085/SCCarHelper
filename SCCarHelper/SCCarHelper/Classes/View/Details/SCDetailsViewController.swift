//
//  SCDetailsViewController.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

private let reuseIdentifier = "collection_cell_id"
class SCDetailsViewController: UIViewController {
    var viewModel: SCCarViewModel?
    
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        setupUI()
        loadData()
    }
    deinit {
        viewModel?.detailsResult = nil
    }
}
private extension SCDetailsViewController{
    func setupUI(){
        navigationController?.navigationBar.tintColor = UIColor.darkGray
        navigationItem.title = "Details"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SCImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    func loadData(){
        SVProgressHUD.show()
        viewModel?.loadCarDetailsData(completion: { [weak self](isSuccess) in
            SVProgressHUD.dismiss()
            self?.locationLabel.text = self?.viewModel?.detailsResult?.Result?.first?.Overview?.Location
            self?.priceLabel.text = self?.viewModel?.detailsResult?.Result?.first?.Overview?.Price
            self?.statusLabel.text = self?.viewModel?.detailsResult?.Result?.first?.SaleStatus
            self?.textView.text = self?.viewModel?.detailsResult?.Result?.first?.Comments
            self?.separatorView.isHidden = false
            self?.collectionView.reloadData()
        })
    }
}
extension SCDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.detailsResult?.Result?.first?.Overview?.carImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SCImageCollectionViewCell
        
        cell.carImage = viewModel?.detailsResult?.Result?.first?.Overview?.carImages?[indexPath.item]
        return cell
    }
}
