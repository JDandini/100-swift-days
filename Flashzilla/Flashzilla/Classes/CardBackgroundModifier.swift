//
//  CardBackgroundModifier.swift
//  Flashzilla
//
//  Created by Javier Castañeda on 31/08/26.
//

import SwiftUI

struct CardBackground: ViewModifier {
    let offset: CGSize
    let differentiateWithoutColor: Bool
    let dragDirection: CGFloat

    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(
                        differentiateWithoutColor
                        ? .white
                        : .white.opacity(1 - Double(abs(offset.width / 50)))
                    )
                    .background(
                        differentiateWithoutColor
                        ? nil
                        : RoundedRectangle(cornerRadius: 25)
                            .fill(dragDirection > 0 ? .green : .red)
                    )
                    .shadow(radius: 10)

            )
    }
}

extension View {
    func cardBackground(offset: CGSize,
                        differentiateWithoutColor: Bool,
                        dragDirection: CGFloat) -> some View {
        modifier(CardBackground(offset: offset,
                                differentiateWithoutColor: differentiateWithoutColor,
                                dragDirection: dragDirection)
        )
    }
}
