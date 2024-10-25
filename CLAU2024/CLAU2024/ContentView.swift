//
//  ContentView.swift
//  CLAU2024
//
//  Created by Karla Daniela Rubiano on 24/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ProductCard()) {
                    Text("SwiftUI")
                }
                
                NavigationLink(destination: UIKitViewControllerRepresentable()) {
                    Text("UIKit")
                }
            }
            .navigationBarTitle("Custom Actions")
        }
    }
}

#Preview {
    ContentView()
}
