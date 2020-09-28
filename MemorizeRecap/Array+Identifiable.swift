//
//  Array+Identifiable.swift
//  MemorizeRecap
//
//  Created by Apostol, Alexandru on 25/09/2020.
//  Copyright © 2020 Apostol, Alexandru. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching item: Element) -> Optional<Int> {
        for index in 0..<self.count {
            if self[index].id == item.id {
                return index
            }
        }
        return nil
    }
}


