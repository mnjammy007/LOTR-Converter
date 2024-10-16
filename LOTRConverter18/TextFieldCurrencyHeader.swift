////
////  TextFieldCurrencyHeader.swift
////  LOTRConverter18
////
////  Created by Apple on 16/10/24.
////
//
//
//import SwiftUI
//
//struct TextFieldCurrencyHeader : View {
//    @Binding var showSelectCurrency: Bool
//    @Binding var currencyAmount: String
//    @Binding var isTyping: Bool
//    
//    @Binding var currency: Currency
//    
//    var body: some View {
//        VStack{
//            HStack{
//                Image(currency.image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 33)
//                Text(currency.name)
//                    .font(.headline)
//                    .foregroundStyle(.white)
//            }
//            .padding(.bottom, -5)
//            .onTapGesture {
//                showSelectCurrency.toggle()
//            }
//            .popoverTip(CurrencyTip(), arrowEdge: .bottom)
//            TextField("Amount", text: $currencyAmount)
//                .textFieldStyle(.roundedBorder)
//                .focused($isTyping)
//                .keyboardType(.decimalPad)
//                .onSubmit { isTyping = false }
//        }
//    }
//}
//
//#Preview {
//    TextFieldCurrencyHeader(showSelectCurrency: .constant(false), currencyAmount: .constant(""),isTyping: .constant(false), currency: .constant(.silverPenny))
//}
