//
//  HomeTabController.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

enum HomeTabEnum: String{
    case User, Library, Flickr
}

class HomeTabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        customInit()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension HomeTabController: Customize{
    func addListener() {}
    func customInit() {
        
        
        // Add tabs
        let users        =  UsersController.users(#imageLiteral(resourceName: "ImageUser") ,HomeTabEnum.User.rawValue)
        let flickr       =  FlickrController.flickr(#imageLiteral(resourceName: "ImageFlickr") ,HomeTabEnum.Flickr.rawValue)
        let technologies =  TechnologiesController.technologies(#imageLiteral(resourceName: "ImageTechnologies"), HomeTabEnum.Library.rawValue)
        viewControllers  =  [users, flickr, technologies]
    }
}

extension HomeTabController{
    static func home() -> HomeTabController{
        let controller: HomeTabController = HomeTabController.load()
        return controller
    }
}

