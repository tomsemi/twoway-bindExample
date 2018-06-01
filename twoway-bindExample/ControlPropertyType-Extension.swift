//
//  ControlPropertyType-Extension.swift
//  twoway-bindExample
//
//  Created by Ge on 29/03/2018.
//  Copyright © 2018 Ge. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension ControlPropertyType {
    
    public func get(_ selector: @escaping (Self) -> Observable<E>) -> ControlProperty<Self.E> {
        return ControlProperty(values: selector(self), valueSink: self)
    }
    
}
