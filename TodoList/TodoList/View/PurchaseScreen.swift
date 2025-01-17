//
//  PurchaseScreen.swift
//  TodoList
//
//  Created by ayushman.soni on 15/01/25.
//

import SwiftUI

struct PurchaseScreen: View {
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        Button("click me") {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented) {
            ContentView()
                .presentationDetents([.fraction(0.62)])
        }
    }
}

//MARK: - Content View

struct ContentView: View {
    @State private var isMaximumAmountChecked: Bool = false
    @State private var textFieldText: String = ""
    @Environment(\.dismiss) var presentationMode
    @State private var pointsToConvert: Int = 0
    private let totalPoints = 1000
    private let increment = 1000
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Convert My Points")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                Spacer()
                Image(systemName: "xmark")
                    .font(.system(size: 25))
                    .fontWeight(.regular)
                    .padding(.top, 15)
                    .onTapGesture {
                        // close the screen
                        presentationMode.callAsFunction()
                    }
            }
            .padding([.leading, .trailing], 10)
            .padding(.bottom, 25)
            
            HStack(spacing: 24) {
                VStack {
                    Text("\(totalPoints)")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                    Text("My Points")
                        .font(.footnote)
                        .fontWeight(.light)
                }
                .foregroundColor(.black.opacity(0.8))
                .padding(.leading, 20)
                
                Text("-")
                    .font(.title)
                
                VStack {
                    Text("\(pointsToConvert)")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                    Text("Convert")
                        .font(.footnote)
                        .fontWeight(.light)
                }
                .foregroundColor(.black.opacity(0.8))
                
                Text("=")
                    .font(.title2)
                
                VStack {
                    Text("\(totalPoints - pointsToConvert)")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                    Text("Remaining")
                        .font(.footnote)
                        .fontWeight(.light)
                }
                .foregroundColor(.black.opacity(0.8))
                .padding(.trailing, 15)
            }
            .padding(.all, 20)
            .frame(height: 63)
            .background(.gray.opacity(0.2))
            
            HStack {
                Rectangle()
                    .fill(isMaximumAmountChecked ? Color.blue : Color.white)
                    .frame(width: 25, height: 25)
                    .fontWeight(.regular)
                    .border(Color.black.opacity(0.8), width: 2)
                    .cornerRadius(5)
                    .overlay(
                        Group {
                            if isMaximumAmountChecked {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                            }
                        }
                    )
                    .onTapGesture {
                        isMaximumAmountChecked.toggle()
                    }
                Text("Select maximum amount")
                    .fontWeight(.regular)
                    .foregroundColor(.black.opacity(0.8))
            }
            .font(.system(size: 16))
            .padding(.top, 10)
            .padding(.bottom, 20)
            
            HStack(spacing: 10) {
                Button {
                    if pointsToConvert >= 0 {
                        pointsToConvert -= increment
                    }
                } label: {
                    Circle()
                        .fill(Color.pink.opacity(0.5))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "minus")
                                .font(.title)
                                .foregroundColor(.white)
                        )
                }
                
                TextField("", value: $pointsToConvert, formatter: NumberFormatter())
                    .frame(width: 200, height: 50)
                    .multilineTextAlignment(.center)
                    .border(Color.black.opacity(0.5), width: 1)
                    .background(Color(UIColor.white))
                    .cornerRadius(3)
                
                Button {
                    if pointsToConvert >= 0 {
                        pointsToConvert += increment
                    }
                } label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.white)
                        )
                }
            }
            
            Text("My Points to Convert \n (increments of 1,000 only)")
                .padding(.bottom, 20)
                .multilineTextAlignment(.center)
                .font(.footnote)
                .foregroundColor(.black.opacity(0.8))
            
            Text("Equates to $\(String(format: "%.2f", Double(pointsToConvert) / 100)) BonusCash")
                .font(.system(size: 16))
                .fontWeight(.regular)
                .foregroundColor(.black.opacity(0.8))
                .padding(.bottom, -10)
            
            Button {
                // convert points
            } label: {
                Text("Convert Points to BonusCash")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: 46)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple.opacity(0.5))
                    .cornerRadius(25)
                    .padding([.top, .leading, .trailing], 20)
            }
            .disabled(pointsToConvert == 0)
            
            Text("BonusCash expires 30 days after issue.")
                .font(.system(size: 14))
                .fontWeight(.regular)
                .foregroundColor(.black.opacity(0.8))
        }
        .padding(10)
    }
}
#Preview {
    PurchaseScreen()
}
