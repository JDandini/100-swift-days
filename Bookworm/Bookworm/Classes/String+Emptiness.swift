//
//  String+Emptiness.swift
//  Bookworm
//
//  Created by Javier Castañeda on 09/07/26.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        isEmpty || trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
