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
    
    private var imageWidth: CGFloat = 90
    private var imageHeight: CGFloat = 90
    private var iconWidth: CGFloat = 24
    private var iconHeight: CGFloat = 24
    private var cardWidth: CGFloat = 130
    private var verticalPadding: CGFloat = 6.0
    private var horizontalPadding: CGFloat = 8.0
    private var cornerRadius: CGFloat = 8.0
    private var lineWidth: CGFloat = 2.0
    
    var body: some View {
        VStack(spacing: verticalPadding) {
            // Imagen del producto
            Image("tenis")
                .resizable()
                .scaledToFill()
                .frame(width: imageWidth, height: imageHeight)
                .padding(.top)
            VStack(alignment: .leading, spacing: verticalPadding) {
                // Nombre del producto
                Text("Tennis Running")
                    .font(.body)
                // Disponibilidad
                Text("Envío gratis")
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
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
            .padding(.horizontal, horizontalPadding)
            .padding(.bottom, verticalPadding)
        }
        .frame(width: cardWidth)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.blue, lineWidth: lineWidth)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Producto: Tennis Running, Envío gratis")
    }
    
    private func createImage(isSelected: Bool, active: String, inactive: String) -> some View {
        return Image(systemName: isSelected ? active : inactive)
            .resizable()
            .scaledToFit()
            .frame(width: iconWidth, height: iconHeight)
            .foregroundColor(.blue)
            .accessibilityHidden(true)
    }
}
#Preview {
    ProductCard()
}
