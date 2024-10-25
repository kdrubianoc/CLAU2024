//
//  ProductCardViewController.swift
//  CLAU2024
//
//  Created by Karla Daniela Rubiano on 24/10/24.
//

import UIKit

class ProductCardViewController: UIViewController {
    override func viewDidLoad() {
      super.viewDidLoad()
      let productCard = ProductCardUIKit()
      view.addSubview(productCard)
        
      NSLayoutConstraint.activate([
        productCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        productCard.centerYAnchor.constraint(equalTo: view.centerYAnchor)
      ])
    }
  }

