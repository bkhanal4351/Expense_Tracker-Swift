//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Bishal Khanal on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Expenses()
                .tabItem {
                    Label("Expenses", systemImage: "tray.and.arrow.up.fill")
                }
            Reports()
                .tabItem {
                    Label("Reports", systemImage: "chart.bar.fill")
                }
            Text("")
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
            
        }
    }
}

#Preview {
    ContentView()
}
