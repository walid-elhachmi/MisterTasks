//
//  UIColor+Random.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 10/1/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
