//
//  SelectCurrency.swift
//  LOTRConverter18
//
//  Created by Apple on 13/10/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                IconGrid(currency: $topCurrency)
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                IconGrid(currency: $bottomCurrency)
                Button("Done"){
                    dismiss()
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}


#Preview {
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPenny))
}
