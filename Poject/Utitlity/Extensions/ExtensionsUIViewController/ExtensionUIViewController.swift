//
//  ExtensionUIViewController.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

extension UIViewController{
    
    static func load<T: UIViewController>()-> T{
        T(nibName: String(describing: T.self), bundle: nil)
    }
    
    func push(_ controller: UIViewController){
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func present(_ controller: UIViewController, _ animated: Bool = true){
        present(controller, animated: animated, completion: nil)
    }
}
