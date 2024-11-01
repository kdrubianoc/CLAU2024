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
    
    var imageName: String?
    var title: String?
    var subtitle: String?
    
    private var imageWidth: CGFloat = 90
    private var imageHeight: CGFloat = 90
    private var iconWidth: CGFloat = 24
    private var iconHeight: CGFloat = 24
    private var cardWidth: CGFloat = 130
    private var cornerRadius: CGFloat = 8.0
    private var lineWidth: CGFloat = 2.0
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public init(imageName: String, title: String, subtitle: String) {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
        super.init(frame: .zero)
        setupView()
        setupAccessibility()
    }
    
    private func setupView() {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        productImageView.image = UIImage(named: imageName ?? "")
        
        // Configuramos las propiedades de la vista principal
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = lineWidth
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.cornerRadius = cornerRadius
        
        // Agregamos las subviews
        addSubview(productImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        let buttonStackView = UIStackView(arrangedSubviews: [favoriteButton, cartButton, infoButton])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 8.0
        addSubview(buttonStackView)
        
        // Definimos las constraints
        NSLayoutConstraint.activate([
            // Constraints de la imagen del producto
            productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            productImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: imageHeight),
            productImageView.widthAnchor.constraint(equalToConstant: imageWidth),
            
            // Constraints del título
            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
            
            // Constraints del subtítulo
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
            
            // Constraints del stack de botones
            buttonStackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 6),
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            self.widthAnchor.constraint(equalToConstant: cardWidth),
            
            // Constraints para el tamaño de los íconos (24x24)
            favoriteButton.widthAnchor.constraint(equalToConstant: iconWidth),
            favoriteButton.heightAnchor.constraint(equalToConstant: iconHeight),
            cartButton.widthAnchor.constraint(equalToConstant: iconWidth),
            cartButton.heightAnchor.constraint(equalToConstant: iconHeight),
            infoButton.widthAnchor.constraint(equalToConstant: iconWidth),
            infoButton.heightAnchor.constraint(equalToConstant: iconHeight)
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
        // Comportamiento de vista semántica
        self.isAccessibilityElement = true
        self.accessibilityElements = [titleLabel, subtitleLabel, favoriteButton, cartButton, infoButton]
        self.accessibilityLabel = "\(titleLabel.text ?? ""), \(subtitleLabel.text ?? "")"
        
        // Custom actions
        let favoriteAction = UIAccessibilityCustomAction(
            name: "Agregar a favoritos",
            actionHandler: { (action: UIAccessibilityCustomAction) -> Bool in
                self.toggleFavorite()
                return true
            })
        
        let addToCartAction = UIAccessibilityCustomAction(
            name: "Agregar al carrito",
            actionHandler: { (action: UIAccessibilityCustomAction) -> Bool in
                self.toggleCart()
                return true
            })
        
        let showInfoAction = UIAccessibilityCustomAction(
            name: "Más información",
            actionHandler: { (action: UIAccessibilityCustomAction) -> Bool in
                self.toggleInfo()
                return true
            })
        
        self.accessibilityCustomActions = [favoriteAction, addToCartAction, showInfoAction]
    }
}


#Preview {
    ProductCardUIKit(imageName: "tenis", title: "Tenis Running", subtitle: "Envío gratis")
}

