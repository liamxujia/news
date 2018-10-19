//
//  Cavalier.swift
//  news
//
//  Created by stlndm on 2018/10/19.
//  Copyright © 2018 stlndm. All rights reserved.
//

import UIKit
import Aspects

typealias Handler = () -> ()

@objcMembers class Cavalier: NSObject {
    func allPropertiyNames(cls: AnyClass) -> [String] {
        var count: UInt32 = 0
        let properties = class_copyPropertyList(cls, &count)
        var propertiyNames: [String] = []
        for i in 0..<Int(count) {
            let proprety = properties![i]
            let strName = String(cString: property_getName(proprety))
            propertiyNames.append(strName)
        }
        free(properties)
        return propertiyNames
    }
    
    func allMethods(cls: AnyClass) -> [String] {
        var count : UInt32 = 0
        var results: [String] = []
        let methods = class_copyMethodList(cls, &count)
        for i in 0..<Int(count) {
            let method = methods![i]
            let sel = method_getName(method).description
            results.append(sel)
        }
        return results
    }
    
    func hold(cls: AnyClass, selector: Selector, handler: Handler) -> Void {
        
    }
}
