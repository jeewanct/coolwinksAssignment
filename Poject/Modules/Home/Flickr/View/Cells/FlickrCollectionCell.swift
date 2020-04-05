//
//  FlickrCollectionCell.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class FlickrCollectionCell: BaseCollectionCell {

    @IBOutlet weak var imageRecent: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func update<T>(data: T) {
        let photo: Photo = data as! Photo
        let url = "\(Constants.Service.imageBaseURL)\(photo.server)/\(photo.id)_\(photo.secret).jpg"
        imageRecent.addImage(url, #imageLiteral(resourceName: "ImagePlaceholder"))
    }

}
