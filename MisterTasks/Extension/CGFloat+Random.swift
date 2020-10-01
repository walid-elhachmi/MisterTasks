//
//  CGFloat+Random.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 10/1/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import UIKit


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
