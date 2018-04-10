//
//  ObjectClickable.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-04-05.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import Foundation

protocol ObjectClickable {
    var boxCol : BoxCollider? {get set}
    func ifClicked()
}
