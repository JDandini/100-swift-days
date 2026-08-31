//
//  CardView.swift
//  Flashzilla
//
//  Created by Javier Castañeda on 26/08/26.
//

import SwiftUI

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    @State private var dragDirection: CGFloat = 0
    let card: Card
    var removal: (() -> Void)? = nil

    var body: some View {
        VStack {
            VStack {
                if accessibilityVoiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)

                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding(20)
        .multilineTextAlignment(.center)
        .frame(width: 450, height: 250)
        .cardBackground(offset: offset, differentiateWithoutColor: accessibilityDifferentiateWithoutColor, dragDirection: dragDirection)
        .rotationEffect(.degrees(offset.width / 5.0))
        .offset(x: offset.width * 5)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    dragDirection = gesture.translation.width
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        removal?()
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.bouncy, value: offset)
        .accessibilityAddTraits(.isButton)
    }
}
#Preview {
    CardView(card: .example)
}
