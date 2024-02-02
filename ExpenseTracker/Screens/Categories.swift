//
//  Categories.swift
//  ExpenseTracker
//
//  Created by Bishal Khanal on 2/1/24.
//

import SwiftUI

struct Categories: View {
    @State private var newCategoryName: String = ""
    @FocusState var inputFocused: Bool
    var body: some View {
        VStack {
            List {
                Text("Groceries")
                Text("Subscriptions")
                Text("Utility")
            }
            
            Spacer()
            
            HStack {
                ZStack (alignment: .trailing){
                    TextField("Add new category", text: $newCategoryName)
                        .focused($inputFocused)
                        .textFieldStyle(.roundedBorder)
                    if inputFocused && newCategoryName.count > 0 {
                        Button {
                            newCategoryName = ""
                            
                        } label: {
                            Label("Clear input", systemImage: "xmark.circle.fill")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.gray)
                                .padding(.trailing, 6)
                        }
                    }
                }
                
                Button {
                    
                } label: {
                    Label("Submit", systemImage: "paperplane")
                        .labelStyle(.iconOnly)
                }
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(6)
            }
                .padding(.horizontal, 16)
                .navigationTitle("Categories")
                
                
                
            }
            
        }
            
    }
       
        

    
#Preview {
    Categories()
}
