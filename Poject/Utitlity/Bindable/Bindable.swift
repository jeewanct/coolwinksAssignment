//
//  Listner.swift
//  FantasyLeague
//
//  Created by Shubhu on 02/01/20.
//  Copyright © 2020 Vaibhav Sharma. All rights reserved.
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
