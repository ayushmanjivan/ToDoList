//
//  ProfileScreen.swift
//  TodoList
//
//  Created by ayushman.soni on 15/01/25.
//

import SwiftUI

struct ProfileScreen: View {
    @State private var street = ""
    @State private var city = ""
    @State private var state = ""
    @State private var zip = ""
    
    @State private var isRedBorder = false
    @State private var errors: [String: String] = [:]
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                // Street
                VStack(alignment: .leading) {
                    Text("Street")
                        .font(.headline)
                    TextField("", text: $street)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(isRedBorder ? Color.red : Color.black, lineWidth: 1)
                        )
                        .padding(.horizontal, 5)
                    
                    // Error message for street
                    if isRedBorder && street.isEmpty {
                        Text("Please enter your street name")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.horizontal, 5)
                    }
                }
                
                // City
                VStack(alignment: .leading) {
                    Text("City")
                        .font(.headline)
                    TextField("", text: $city)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(isRedBorder ? Color.red : Color.black, lineWidth: 1)
                        )
                        .padding(.horizontal, 5)
                    
                    // Error message for city
                    if isRedBorder && city.isEmpty {
                        Text("Please enter your City")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.horizontal, 5)
                    }
                }
                
                // State
                VStack(alignment: .leading) {
                    Text("State")
                        .font(.headline)
                    TextField("", text: $state)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(isRedBorder ? Color.red : Color.black, lineWidth: 1)
                        )
                        .padding(.horizontal, 5)
                    
                    // Error message for state
                    if isRedBorder && state.isEmpty {
                        Text("Please enter your state")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.horizontal, 5)
                    }
                }
                
                // Zip Code
                VStack(alignment: .leading) {
                    Text("Zip")
                        .font(.headline)
                    TextField("", text: $zip)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(isRedBorder ? Color.red : Color.black, lineWidth: 1)
                        )
                        .padding(.horizontal, 5)
                    
                    // Error message for zip
                    if isRedBorder && zip.isEmpty {
                        Text("Please enter ZIP Code")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.horizontal, 5)
                    }
                }
            }
            .padding()
            
            Spacer()
            
            // Text to toggle border color
            Text("Next")
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 46)
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(25)
                .padding()
                .padding(.vertical, 0)
                .onTapGesture {
                    isRedBorder.toggle()
                    
                    if isRedBorder {
                        if street.isEmpty { errors["street"] = "Please enter your street." }
                        if city.isEmpty { errors["city"] = "Please enter your city." }
                        if state.isEmpty { errors["state"] = "Please enter your state." }
                        if zip.isEmpty { errors["zip"] = "Please enter your zip code." }
                    } else {
                        errors.removeAll()
                    }
                }
                .padding(.bottom, 10)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ProfileScreen()
}
