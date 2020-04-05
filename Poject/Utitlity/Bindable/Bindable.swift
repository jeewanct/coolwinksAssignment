//
//  Bindable.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

class Bindable<T> {
    
    typealias Listener = (T) -> Void
    var listener:Listener?
    
    var value: T{
        didSet{
            listener?(value)
        }
    }
    
    init(_ value:T){
        self.value = value
    }
    
    func bind( listener:@escaping Listener){
        self.listener = listener
    }
    
}
