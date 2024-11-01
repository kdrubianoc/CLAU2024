//
//  ProductView.swift
//  CLAU2024
//
//  Created by Karla Daniela Rubiano on 1/11/24.
//

import SwiftUI

struct ProductView: View {
    
    var body: some View {
        VStack {
            ProductCard(imageName: "tenis", title: "Tenis running", subtitle: "Envío gratis")
            
            AccordionView()
        }
    }
}

#Preview {
    ProductView()
}
