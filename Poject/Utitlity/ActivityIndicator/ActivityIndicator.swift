//
//  CustomActivityIndicator.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class CustomActivityIndicator: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating(){
        activityIndicator.startAnimating()
        animate(property: .identity)
    }
    
    func animate(property: CGAffineTransform){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .beginFromCurrentState, animations: {
            self.visualEffectView.transform = property
        }, completion: nil)
    }
    
    func addViews(){
        
        addSubview(visualEffectView)
        addSubview(activityIndicator)
        
        visualEffectView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        visualEffectView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        visualEffectView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        visualEffectView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        activityIndicator.centerXAnchor.constraint(equalTo: visualEffectView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: visualEffectView.centerYAnchor).isActive = true
        
        visualEffectView.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        activityIndicator.color = #colorLiteral(red: 0, green: 0.6784313725, blue: 0.9333333333, alpha: 1)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    lazy var visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let visualEffect = UIVisualEffectView(effect: blurEffect)
        visualEffect.translatesAutoresizingMaskIntoConstraints = false
        visualEffect.layer.cornerRadius = 4
        visualEffect.clipsToBounds = true
        return visualEffect
    }()
    
    
}


extension UIViewController{
    
    func showHUD(_ show: Bool){
        
        if !show{
            hideHUD()
            return
        }
        
        var window: UIWindow?
        
        if #available(iOS 13.0, *){
            window = SceneDelegate.shared.window
        }else{
            window = appDelegate?.window
        }
        
        guard let unwrappedWindow = window else { return }
        
        let activityIndicator = CustomActivityIndicator()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        unwrappedWindow.addSubview(activityIndicator)
        activityIndicator.anchorToTop(top: unwrappedWindow.topAnchor, left: unwrappedWindow.leftAnchor, bottom: unwrappedWindow.bottomAnchor, right: unwrappedWindow.rightAnchor)
        activityIndicator.startAnimating()
        
    }
    
    func hideHUD(){
        var window: UIWindow?
        
        if #available(iOS 13.0, *){
            window = SceneDelegate.shared.window
        }else{
            window = appDelegate?.window
        }
        guard let unwrappedWindow = window else { return }
        for view in unwrappedWindow.subviews{
            if view is CustomActivityIndicator{
                view.removeFromSuperview()
            }
        }
    }
    
}

