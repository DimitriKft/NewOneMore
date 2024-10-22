//
//  RatingAlertView.swift
//  NewOneMore
//
//  Created by dimitri on 22/10/2024.
//

import StoreKit
import SwiftUI

struct RatingAlertView: View {
   
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        
        Button("Leave a review") {
            requestReview()
        }
   
    }
}
#Preview {
    RatingAlertView()
}
