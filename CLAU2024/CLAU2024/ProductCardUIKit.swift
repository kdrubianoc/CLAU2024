//
//  ProductCardUIKit.swift
//  CLAU2024
//
//  Created by Karla Daniela Rubiano on 24/10/24.
//

import UIKit

class ProductCardUIKit: UIView {
    
    var isFavorite = false
    var isInCart = false
    var showInfo = false
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "tenis")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tennis Running"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        //label.textColor = UIColor.prim
        label.textAlignment = .left
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Llegan hoy"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .green
        label.textAlignment = .left
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
        return button
    }()
    
    private let cartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "cart"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(toggleCart), for: .touchUpInside)
        return button
    }()
    
    private let infoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(toggleInfo), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupAccessibility()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupAccessibility()
    }
    
    private func setupView() {
        // Configuramos las propiedades de la vista principal
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.cornerRadius = 8
       // self.backgroundColor = .clear
        
        // Agregamos las subviews
        addSubview(productImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        let buttonStackView = UIStackView(arrangedSubviews: [favoriteButton, cartButton, infoButton])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 6
        addSubview(buttonStackView)
        
        // Definimos las constraints
        NSLayoutConstraint.activate([
            // Constraints de la imagen del producto
            productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            productImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 90),
            productImageView.widthAnchor.constraint(equalToConstant: 90),
            // Constraints del título
            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
            // Constraints del subtítulo
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
            // Constraints del stack de botones
            buttonStackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 12),
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
            buttonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            self.widthAnchor.constraint(equalToConstant: 130),
            self.heightAnchor.constraint(equalToConstant: 200),
            
            // Constraints para el tamaño de los íconos (24x24)
            favoriteButton.widthAnchor.constraint(equalToConstant: 24),
            favoriteButton.heightAnchor.constraint(equalToConstant: 24),
            cartButton.widthAnchor.constraint(equalToConstant: 24),
            cartButton.heightAnchor.constraint(equalToConstant: 24),
            infoButton.widthAnchor.constraint(equalToConstant: 24),
            infoButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    @objc func toggleFavorite() {
        isFavorite.toggle()
        let newImage = isFavorite ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: newImage), for: .normal)
        favoriteButton.tintColor = .systemBlue
    }
    @objc func toggleCart() {
        isInCart.toggle()
        let newImage = isInCart ? "cart.fill" : "cart"
        cartButton.setImage(UIImage(systemName: newImage), for: .normal)
        cartButton.tintColor = .systemBlue
    }
    @objc func toggleInfo() {
        showInfo.toggle()
        let newImage = showInfo ? "info.circle.fill" : "info.circle"
        infoButton.setImage(UIImage(systemName: newImage), for: .normal)
        infoButton.tintColor = .systemBlue
    }
    func setupAccessibility() {
        self.isAccessibilityElement = true
        self.accessibilityElements = [titleLabel, subtitleLabel, favoriteButton, cartButton, infoButton]
        self.accessibilityLabel = "\(titleLabel.text ?? ""), \(subtitleLabel.text ?? "")"
        
        let favoriteAction = UIAccessibilityCustomAction(
            name: "Agregar a favoritos",
            target: self,
            selector: #selector(toggleFavorite))
        
        let actionAdd = UIAccessibilityCustomAction(
            name: "Agregar al carrito",
            target: self,
            selector: #selector(toggleCart))
        
        let actionShowInfo = UIAccessibilityCustomAction(
            name: "Más información",
            target: self,
            selector: #selector(toggleInfo))
        
        self.accessibilityCustomActions = [favoriteAction, actionAdd, actionShowInfo]
    }
}
