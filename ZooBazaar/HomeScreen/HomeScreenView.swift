//
//  HomeScreenView.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 26.04.22.
//

import UIKit
protocol PushToTable:AnyObject {
    func pushToTable(controller: UITableViewController)
    
    
}

class HomeScreenView: UIView {
    
    private lazy var wellcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to ZooBazaar!"
        label.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 1
        
        return label
    }()
    
    lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.imageView?.tintColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
        
        return button
    }()
    
    lazy var basketImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "basket"), highlightedImage: UIImage(named: "basket"))
        image.tintColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
        
        return image
    }()
    
    private lazy var productsImagesStack: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(catsProductsImage)
        stack.addArrangedSubview(dogsProductsImage)
        stack.addArrangedSubview(rodentsProductsImage)
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy var catsProductsImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cats products"), highlightedImage: UIImage(named: "cats products"))
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
        return image
    }()
    private lazy var dogsProductsImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "dogs"), highlightedImage: UIImage(named: "dogs"))
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    private lazy var rodentsProductsImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Mouse"), highlightedImage: UIImage(named: "Mouse"))
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    weak var pushingDelegate: PushToTable?
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 255/255, green: 190/255, blue: 189/255, alpha: 1)
        
        addSubview(wellcomeLabel)
        addSubview(settingsButton)
        addSubview(basketImage)
        addSubview(productsImagesStack)
        
        setAllConstrains()
        setupImageGesture()
        [wellcomeLabel, settingsButton, basketImage].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAllConstrains() {
        wellcomeLabelConstrains()
        settingsButtonConstraints()
        basketImageConstraints()
        productsImagesStackConstraints()
    }
    
    private func wellcomeLabelConstrains() {
        let topConstraint = NSLayoutConstraint(
            item: wellcomeLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .topMargin,
            multiplier: 1,
            constant: 56)
        
        let leadingConstraint = NSLayoutConstraint(item: wellcomeLabel,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leadingMargin,
                                                   multiplier: 1,
                                                   constant: 24)
        
        let traillingConstraint = NSLayoutConstraint(
            item: wellcomeLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -24)
        
        let heighConstraint = NSLayoutConstraint(item: wellcomeLabel,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: wellcomeLabel,
                                                 attribute: .height,
                                                 multiplier: 1,
                                                 constant: 24)
        
        [topConstraint,
         leadingConstraint,
         traillingConstraint,
         heighConstraint].forEach({ $0.isActive = true })
    }
    
    
    private func settingsButtonConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: settingsButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .topMargin,
            multiplier: 1,
            constant: 16)
        
        let traillingConstraint = NSLayoutConstraint(
            item: settingsButton,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -16)
        
        let heighConstraint = NSLayoutConstraint(
            item: settingsButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: settingsButton,
            attribute: .height,
            multiplier: 1,
            constant: 16)
        
        let widthConstraint = NSLayoutConstraint(
            item: settingsButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: settingsButton,
            attribute: .width,
            multiplier: 1,
            constant: 16)
        
        [topConstraint,
         traillingConstraint,
         heighConstraint,
         widthConstraint].forEach({ $0.isActive = true })
    }
    
    private func basketImageConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: basketImage,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .topMargin,
            multiplier: 1,
            constant: 16)
        
        let traillingConstraint = NSLayoutConstraint(
            item: basketImage,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: settingsButton,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -24)
        
        let heighConstraint = NSLayoutConstraint(
            item: basketImage,
            attribute: .height,
            relatedBy: .equal,
            toItem: .none,
            attribute: .height,
            multiplier: 1,
            constant: 16)
        
        let widthConstraint = NSLayoutConstraint(
            item: basketImage,
            attribute: .width,
            relatedBy: .equal,
            toItem: .none,
            attribute: .width,
            multiplier: 1,
            constant: 16)
        
        [topConstraint,
         traillingConstraint,
         heighConstraint,
         widthConstraint].forEach({ $0.isActive = true })
    }
    
    private func productsImagesStackConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: productsImagesStack,
            attribute: .top,
            relatedBy: .equal,
            toItem: wellcomeLabel,
            attribute: .topMargin,
            multiplier: 1,
            constant: 32)
        
        let traillingConstraint = NSLayoutConstraint(
            item: productsImagesStack,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -24)
        
        let leadingConstraint = NSLayoutConstraint(
            item: productsImagesStack,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leadingMargin,
            multiplier: 1,
            constant: 24)
        
        for image in productsImagesStack.arrangedSubviews {
            let heighConstraint = NSLayoutConstraint(
                item: image,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 180)
            
            heighConstraint.isActive = true
        }
        
        for image in productsImagesStack.arrangedSubviews {
            let widthConstraint = NSLayoutConstraint(
                item: image,
                attribute: .width,
                relatedBy: .equal,
                toItem: .none,
                attribute: .width,
                multiplier: 1,
                constant: 220)
            widthConstraint.isActive = true
        }
        
        [topConstraint,
         traillingConstraint,
         leadingConstraint].forEach({ $0.isActive = true })
    }
    
    private func setupImageGesture() {
        catsProductsImage.isUserInteractionEnabled = true
        dogsProductsImage.isUserInteractionEnabled = true
        rodentsProductsImage.isUserInteractionEnabled = true
        
        let tapCatsImageGesture = UITapGestureRecognizer(target: self, action: #selector(pushToCatsTable))
        catsProductsImage.addGestureRecognizer(tapCatsImageGesture)
    }
    
    @objc private func pushToCatsTable(_ gesture: UITapGestureRecognizer) {
        pushingDelegate?.pushToTable(controller: CatsProductsTableViewController())
    }
}
