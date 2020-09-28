//
//  Array+Only.swift
//  MemorizeRecap
//
//  Created by Apostol, Alexandru on 28/09/2020.
//  Copyright © 2020 Apostol, Alexandru. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
