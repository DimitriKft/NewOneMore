//
//  BtnPrimaryView.swift
//  NewOneMore
//
//  Created by dimitri on 24/09/2024.
//

import SwiftUI


struct PrimaryBtnView: View {
    var label: String
    var action: () -> Void
    var color: Color
    var colorSecondary: Color
    var icon: String
    var body: some View {
        Button {
           action()
        } label: {
            ZStack{
                Rectangle()
                    .frame(width: 300, height: 50)
                    .cornerRadius(12)
                    .foregroundColor(color)
                HStack(alignment: .firstTextBaseline, spacing: 20){
                    Image(systemName: icon)
                        .foregroundColor(colorSecondary)
                    Text(label.count > 40 ? "\(label.prefix(40)).." : label)
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(colorSecondary)
                  
                    
                }
            }
        }
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }
}

#Preview {
    PrimaryBtnView(label: "Ajouter Kiping muscle up", action: {
        print("Test btn primary")
    }, color: .yellow, colorSecondary: .black, icon: "ant.fill")
}
