//
//  Sequence.swift
//  Zammad-app
//
//  Created by Станислав Буйновский on 02.11.2021.
//

import Foundation

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
