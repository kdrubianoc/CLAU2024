//
//  UIKitViewControllerRepresentable.swift
//  CLAU2024
//
//  Created by Karla Daniela Rubiano on 24/10/24.
//

import SwiftUI
import UIKit

struct UIKitViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ProductCardViewController {
        return ProductCardViewController()
    }

    func updateUIViewController(_ uiViewController: ProductCardViewController, context: Context) {
        // Actualización de la vista, si es necesario
    }
}
