//
//  FickrController.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class FlickrController: BaseViewController {

    
    @IBOutlet weak var collectionView: BaseCollectionView!
    let itemSize = CGSize(width: (UIScreen.main.bounds.width - 48) / 2, height: (UIScreen.main.bounds.width - 48) / 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addListener()
        customInit()
        viewModel.images()
        
    }
    
    lazy var viewModel: FlickrViewModel = {
        FlickrViewModel()
    }()
}

extension FlickrController: Customize{
    func addListener() {
        viewModel.showHUD.bind { [unowned self](show) in
            self.showHUD(show)
        }
        viewModel.reloadTable.bind { [unowned self](reload) in
            self.collectionView.reloadData()
        }
    }
    func customInit() {
        configureNav()
        collectionView.registerCells(FlickrCollectionCell.self)
    }
}

extension FlickrController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.photos?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.collectionView.dequeueCell(indexPath, FlickrCollectionCell.self, viewModel.photos?[indexPath.item])
    }
}

extension FlickrController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let flickrCell = collectionView.cellForItem(at: indexPath) as? FlickrCollectionCell, let imageView = flickrCell.imageRecent, let frame = imageView.superview?.convert(imageView.frame, to: nil){
            let image = flickrCell.imageRecent.image
            let previewImage = ImagePreviewController.imagePreview(image, frame)
            present(previewImage, false)
        }
    }
}

extension FlickrController{
    static func flickr(_ image: UIImage, _ title: String) -> FlickrController{
        let controller: FlickrController = UIViewController.load()
        controller.tabBarItem.image      = image
        controller.tabBarItem.title      = title
        return controller
    }
}
