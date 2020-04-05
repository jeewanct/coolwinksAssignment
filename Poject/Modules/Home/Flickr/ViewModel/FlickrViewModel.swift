//
//  FlickrViewModel.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

class FlickrViewModel: BaseViewModel{
    
    private var repository: FlickrRepository!
    var photos: [Photo]?
    
    
    func images( _ client: URLSessionProtocol = URLSession.shared){
        repository = FlickrRepository(.recentUploads, client)
        showHUD.value = true
        repository.recentUploads({ [weak self](recentPhotos) in
            self?.photos = recentPhotos
            self?.reloadTable.value = true
            self?.showHUD.value = false
        }) { [weak self](errorMessage) in
            self?.showHUD.value = false
        }
    }
    
}
