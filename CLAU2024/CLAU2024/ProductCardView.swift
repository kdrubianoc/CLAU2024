//
//  ProductCardView.swift
//  CLAU2024
//
//  Created by Karla Daniela Rubiano on 24/10/24.
//

import SwiftUI

struct ProductCard: View {
    @State private var isFavorite = false
    @State private var isInCart = false
    @State private var showInfo = false
    
    var imageName: String
    var title: String
    var subtitle: String
    
    struct Constants {
        static let imageWidth: CGFloat = 90
        static let imageHeight: CGFloat = 90
        static let iconWidth: CGFloat = 24
        static let iconHeight: CGFloat = 24
        static let cardWidth: CGFloat = 130
        static let verticalPadding: CGFloat = 6.0
        static let horizontalPadding: CGFloat = 8.0
        static let cornerRadius: CGFloat = 8.0
        static let lineWidth: CGFloat = 2.0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.verticalPadding) {
            // Imagen del producto
            HStack {
                Spacer()
                
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                    .padding(.top)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: Constants.verticalPadding) {
                // Nombre del producto
                Text(title)
                    .font(.body)
                // Disponibilidad
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            .padding(.horizontal, Constants.horizontalPadding)
            
            // Íconos de acciones
            HStack {
                Button(action: {
                    isFavorite.toggle()
                }) {
                    createImage(isSelected: isFavorite, active: "heart.fill", inactive: "heart")
                }
                .accessibilityAction(named: "Agregar a favoritos") {
                    isFavorite.toggle()
                }
                Spacer()
                
                Button(action: {
                    isInCart.toggle()
                }) {
                    createImage(isSelected: isInCart, active: "cart.fill", inactive: "cart")
                }
                .accessibilityAction(named: "Agregar al carrito") {
                    isInCart.toggle()
                }
                Spacer()
                
                Button(action: {
                    showInfo.toggle()
                }) {
                    createImage(isSelected: showInfo, active: "info.circle.fill", inactive: "info.circle")
                }
                .accessibilityAction(named: "Más información") {
                    showInfo.toggle()
                }
            }
            .padding(.horizontal, Constants.horizontalPadding)
            .padding(.bottom, Constants.verticalPadding)
        }
        .frame(width: Constants.cardWidth)
        .background(
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .stroke(Color.blue, lineWidth: Constants.lineWidth)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(title), \(subtitle)")
    }
    
    private func createImage(isSelected: Bool, active: String, inactive: String) -> some View {
        return Image(systemName: isSelected ? active : inactive)
            .resizable()
            .scaledToFit()
            .frame(width: Constants.iconWidth, height: Constants.iconHeight)
            .foregroundColor(.blue)
            .accessibilityHidden(true)
    }
}

#Preview {
    ProductCard(imageName: "tenis", title: "Tenis Running", subtitle: "Envío gratis")
}
