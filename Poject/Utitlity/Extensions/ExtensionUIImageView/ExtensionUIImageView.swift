//
//  ExtensionUIImageView.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView{

    func addImage(_ url: String?, _ placeholder: UIImage){
        if let unwrappedURL = url{
            self.sd_setImage(with: URL(string: unwrappedURL), placeholderImage: placeholder)
        }else{
            self.image = placeholder
        }
    }
}
