//
//  ServiceCenter.swift
//  Carryouhome
//
//  Created by fanghe on 2021/9/26.
//

import Foundation
 
func Service(_ service: String)-> ServiceProtocol? {
    return ServiceCenter.shared.service(service);
}

class ServiceCenter {
    static let shared = ServiceCenter()
    func service(_ service: String)-> ServiceProtocol? {
        return NSClassFromString(service) as? ServiceProtocol
    }
}
