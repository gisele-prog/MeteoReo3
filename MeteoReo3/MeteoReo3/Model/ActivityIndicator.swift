//
//  ActivityIndicator.swift
//  MeteoReo3
//
//  Created by Joie Gisele Mukamisha on 10/31/23.
//

import SwiftUI

struct ActivityIndicatorView: View {
    @Binding var isAnimating: Bool

    var body: some View {
        Group {
            if isAnimating {
                ProgressView()
                    .onAppear {
                        isAnimating = true
                    }
            }
        }
    }
}
