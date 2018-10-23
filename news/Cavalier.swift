//
//  Cavalier.swift
//  news
//
//  Created by stlndm on 2018/10/19.
//  Copyright © 2018 stlndm. All rights reserved.
//

import UIKit
import Aspects

typealias Handler = @convention(block) (_ aspectInfo: AspectInfo) -> Void

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
    static func hold(cls: AnyClass, selector: Selector, handler: @escaping Handler) -> Void {
        let usingBlock: AnyObject = unsafeBitCast(handler, to: AnyObject.self)
        do {
            try print(cls.aspect_hook(selector, with: .positionBefore, usingBlock: usingBlock))
        } catch {
            
        }
    }
    
    func hold(cls: AnyObject, selector: Selector, handler: @escaping Handler) -> Void {
        do {
            try _ = cls.aspect_hook(selector, with: .positionBefore, usingBlock: handler)
        } catch {
            
        }
    }
}
