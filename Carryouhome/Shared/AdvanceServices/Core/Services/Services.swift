//
//  Services.swift
//  Carryouhome
//
//  Created by fanghe on 2021/9/26.
//

import Foundation
import UIKit

protocol ServiceProtocol {
     func doAction(action: Any, params: Any) -> Any
     func doRegister(action:Any, params: Any) -> Any
}
