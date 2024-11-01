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
                NavigationLink(destination: ProductCard(imageName: "tenis", title: "Tenis Running", subtitle: "Envío gratis")) {
                    Text("SwiftUI")
                }
                
                NavigationLink(destination: UIKitViewControllerRepresentable()) {
                    Text("UIKit")
                }
                
                NavigationLink(destination: ProductView()) {
                    Text("With Accordion")
                }
            }
            .navigationBarTitle("Custom Actions")
        }
    }
}

#Preview {
    ContentView()
}
