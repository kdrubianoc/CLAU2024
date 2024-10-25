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
    var body: some View {
        VStack(spacing: 6) {
            // Imagen del producto
            Image("tenis")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .padding(.top)
            VStack(alignment: .leading, spacing: 6.0) {
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
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.blue)
                        .accessibilityHidden(true)
                }
                .accessibilityAction(named: "Agregar a favoritos") {
                    isFavorite.toggle()
                }
                Spacer()
                Button(action: {
                    isInCart.toggle()
                }) {
                    Image(systemName: isInCart ? "cart.fill" : "cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.blue)
                        .accessibilityHidden(true)
                }
                .accessibilityAction(named: "Agregar al carrito") {
                    isInCart.toggle()
                }
                Spacer()
                Button(action: {
                    showInfo.toggle()
                }) {
                    Image(systemName: showInfo ? "info.circle.fill" : "info.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.blue)
                        .accessibilityHidden(true)
                }
                .accessibilityAction(named: "Más información") {
                    showInfo.toggle()
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom)
        }
        .frame(width: 130, height: 200)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.blue, lineWidth: 2)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Producto: Tennis Running, Envío gratis")
    }
}
#Preview {
    ProductCard()
}
