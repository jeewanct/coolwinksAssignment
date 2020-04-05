//
//  ViewController.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var navTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func configureNav(){
        navigationItem.title = navTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func showNavigation(_ hidden: Bool = false){
        navigationController?.setNavigationBarHidden(hidden, animated: true)
    }
    
}

