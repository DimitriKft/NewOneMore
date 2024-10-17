//
//  SwiftUIView.swift
//  NewOneMore
//
//  Created by dimitri on 17/10/2024.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Image("Graph")
            .resizable()
              .scaledToFit()
              .foregroundColor(.red) 
              .frame(width: 40, height: 40)
    }
}

#Preview {
    SwiftUIView()
}
