//
//  Categories.swift
//  ExpenseTracker
//
//  Created by Bishal Khanal on 2/1/24.
//

import SwiftUI

struct Categories: View {
    @State private var invalidDataAlertShowing = false
    @State private var newCategoryName: String = ""
    @State private var newCategoryColor = Color(.sRGB, red: 0.98, green:0.9, blue:0.2)
    @State private var categories: [Category] = [
        Category(id: 0, name: "Groceries", color: .blue),
        Category(id: 1, name: "Subscriptions", color: .purple),
        Category(id: 2, name: "Utility", color: .red),
    ]
    @FocusState var inputFocused: Bool
    
    func handleSubmit() {
        if newCategoryName.count > 0 {
            categories.append(Category(id: categories.count, name: newCategoryName, color: newCategoryColor))
            newCategoryName = ""
        } else {
            invalidDataAlertShowing = true
        }
    }
    
    func handleDelete(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
    }
    var body: some View {
        VStack {
            List {
                ForEach(categories) {
                    category in
                    HStack {
                        Circle()
                            .frame(width: 12)
                            .foregroundColor(category.color)
                            .border(.gray, width: 1)
                            .cornerRadius(6)
                        Text(category.name)
                    }
                }
                .onDelete(perform: handleDelete)
                
            }
            
            
            Spacer()
            
            HStack(spacing: 16){
                ColorPicker("", selection: $newCategoryColor, supportsOpacity: false)
                    .labelsHidden()
                    .accessibilityLabel("")
                
                ZStack (alignment: .trailing){
                    
                    TextField("Add new category", text: $newCategoryName)
                        
                        
                        .textFieldStyle(.roundedBorder)
                        
                    
                        .focused($inputFocused)
                        
                        
                        
                        .submitLabel(.done)
                        .onSubmit {
                            handleSubmit()
                        }
                        .padding(10)
                                            
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
                        handleSubmit()
                } label: {
                    Label("Submit", systemImage: "paperplane")
                        .labelStyle(.iconOnly)
                }
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(6)
                .alert("Must provide a category name!", isPresented: $invalidDataAlertShowing) {
                    Button("OK", role: .cancel) {
                        invalidDataAlertShowing = false
                    }
                }
            }
        
                .padding(.horizontal, 16)
                .navigationTitle("Categories")
                
                
                
                
            }
            
        }
            
    }
       
        

    
#Preview {
    Categories()
}
