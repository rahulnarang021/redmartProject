//
//  CommonProtocols.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import Foundation
protocol Reusable { // for reusable identifier
    static func reuseIdentifier() -> String
}

extension Reusable {
    static func reuseIdentifier() -> String {
        return String(describing: Self.self)
    }
}
