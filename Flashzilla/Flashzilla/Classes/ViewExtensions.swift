//
//  ViewExtensions.swift
//  Flashzilla
//
//  Created by Javier Castañeda on 26/08/26.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}
