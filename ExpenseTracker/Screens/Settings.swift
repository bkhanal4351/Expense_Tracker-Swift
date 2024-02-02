//
//  Settings.swift
//  ExpenseTracker
//
//  Created by Bishal Khanal on 2/1/24.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView{
            List {
                NavigationLink {
                    Categories()
                    
                } label: {
                    HStack {
                        
                        Text("Categories")
                    }
                }
                
                Button(role: .destructive){
                    
                } label: {
                    Text("Erase Data")
                }
            }
            .navigationTitle("Settings")
            .padding(.top, 16)
        }
        
    }
}

#Preview {
    Settings()
}

