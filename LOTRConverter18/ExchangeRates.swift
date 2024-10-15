//
//  ExchangeRates.swift
//  LOTRConverter18
//
//  Created by Apple on 13/10/24.
//

import SwiftUI

struct ExchangeRate: View {
    let leftCurrencyImage: ImageResource
    let exchangeText: String
    let rightCurrencyImage: ImageResource
    
    var body: some View {
        HStack{
            Image(leftCurrencyImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(exchangeText)
            Image(rightCurrencyImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftCurrencyImage: .silverpiece, exchangeText: "1 Silver Piece = 4 Silver Pennies", rightCurrencyImage: .silverpenny)
}
