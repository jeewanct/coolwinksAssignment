//
//  ImagePreview.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class ImagePreviewController: UIViewController {

    @IBOutlet weak var imagePreview: UIImageView!
    
    var imageFrame:   CGRect  = .zero
    var previewImage: UIImage? = #imageLiteral(resourceName: "ImagePlaceholder")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customInit()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let width      = self.view.frame.width
        let finalFrame = CGRect(x: 0, y: 0, width: width, height: width * 9 / 16)
        animateView(finalFrame, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7435252568))
    }
    
    @objc func handleDismiss(){
        animateView(imageFrame, .clear, true)
    }
    
    func animateView(_ frame: CGRect,_ color: UIColor , _ isClose: Bool = false){
        UIView.transition(with: imagePreview, duration: 0.4, options: .curveEaseOut, animations: {
            self.imagePreview.frame = frame
            self.view.backgroundColor = color
            if !isClose{
                self.imagePreview.center = self.view.center
            }
        }) { (value) in
            if isClose{
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
}

extension ImagePreviewController: Customize{
    func addListener() {}
    
    func customInit() {
        imagePreview.image = previewImage
        imagePreview.frame = imageFrame
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDismiss))
        imagePreview.addGestureRecognizer(tapGesture)
    }
    
    
    
}

extension ImagePreviewController{
    static func imagePreview(_ image: UIImage?,_ frame: CGRect) -> ImagePreviewController{
        let controller: ImagePreviewController = UIViewController.load()
        controller.modalPresentationStyle = .overFullScreen
        controller.previewImage = image
        controller.imageFrame = frame
        return controller
    }
}
