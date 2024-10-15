//
//  ContentView.swift
//  LOTRConverter18
//
//  Created by Apple on 10/10/24.

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo: Bool = false
    @State var showSelectCurrency: Bool = false
    
    @State var leftCurrencyAmount: String = ""
    @State var rightCurrencyAmount: String = ""
    
    @FocusState var isLeftTyping
    @FocusState var isRightTyping
    
    @State var leftCurrency: Currency = .silverPenny
    @State var rightCurrency: Currency = .goldPenny
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                HStack{
                    VStack{
                        HStack{
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(),arrowEdge: .bottom)
                        TextField("Amount", text: $leftCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($isLeftTyping)
                            .keyboardType(.decimalPad)
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    VStack{
                        HStack{
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        TextField("Amount", text: $rightCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($isRightTyping)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()
                HStack {
                    Spacer()
                    Button{
                        showExchangeInfo.toggle()
                    }label:{
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftCurrencyAmount) {
            if isLeftTyping {
                rightCurrencyAmount = leftCurrency.connvert(
                    leftCurrencyAmount,
                    to: rightCurrency
                )
            }
        }
        .onChange(of: rightCurrencyAmount) {
            if isRightTyping {
                leftCurrencyAmount = rightCurrency.connvert(
                    rightCurrencyAmount,
                    to: leftCurrency
                )
            }
        }
        .onChange(of: leftCurrency) {
            leftCurrencyAmount = rightCurrency.connvert(
                rightCurrencyAmount,
                to: leftCurrency
            )
        }
        .onChange(of: rightCurrency) {
            rightCurrencyAmount = leftCurrency.connvert(
                leftCurrencyAmount,
                to: rightCurrency
            )
        }
        .sheet(isPresented: $showExchangeInfo){
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency){
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
