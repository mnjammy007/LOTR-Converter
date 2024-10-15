//
//  ExchangeInfo.swift
//  LOTRConverter18
//
//  Created by Apple on 12/10/24.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                ExchangeRate(leftCurrencyImage: .goldpiece, exchangeText: "1 Golg Piece = 4 Gold Pennies", rightCurrencyImage: .goldpenny)
                ExchangeRate(leftCurrencyImage: .goldpiece, exchangeText: " 1 Gold Piece = 4 Silver Pieces", rightCurrencyImage: .silverpenny)
                ExchangeRate(leftCurrencyImage: .silverpiece, exchangeText: "1 Silver Piece = 4 Silver Pennies", rightCurrencyImage: .silverpenny)
                ExchangeRate(leftCurrencyImage: .silverpenny, exchangeText: "1 Silver Pennies = 100 Copper Pennies", rightCurrencyImage: .copperpenny)
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}
