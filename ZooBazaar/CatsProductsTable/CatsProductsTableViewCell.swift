//
//  CatsProductsTableViewCell.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 1.05.22.
//

import UIKit

struct CategoryOfProducts {
    let nameOfCategory: String
    let imageForCategory: UIImage
    let price: String
    let weight: String?
}

class CatsProductsTableViewCell: UITableViewCell {
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var productDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: Weight Labels
    private lazy var productWeightLabels: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(firstWeight)
        stack.addArrangedSubview(secondWeight)
        stack.addArrangedSubview(thirdWeight)
        stack.addArrangedSubview(fourthWeight)
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isHidden = true
        
        return stack
    }()
    private lazy var firstWeight: UILabel = {
        let label = UILabel()
        label.text = "300 g"
        label.textColor = .purple
        label.isHidden = true
        
        return label
    }()
    private lazy var secondWeight: UILabel = {
        let label = UILabel()
        label.text = "500 g"
        label.textColor = .purple
        label.isHidden = true
        
        return label
    }()
    private lazy var thirdWeight: UILabel = {
        let label = UILabel()
        label.text = "1000 g"
        label.textColor = .purple
        label.isHidden = true
        
        return label
    }()
    private lazy var fourthWeight: UILabel = {
        let label = UILabel()
        label.text = "2000 g"
        label.textColor = .purple
        label.isHidden = true
        
        return label
    }()
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        contentView.addSubview(productImageView)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productDescription)
        contentView.addSubview(productPriceLabel)
        contentView.addSubview(productWeightLabels)
        
        setAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAllConstraints() {
        productImageConstraints()
        productNameConstraints()
        productDescriptionConstraints()
        productPriceConstraints()
        productWeightConstraints()
    }
    
    private func productImageConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: productImageView,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .topMargin,
            multiplier: 1,
            constant: 4)
        
        let traillingConstraint = NSLayoutConstraint(
            item: productImageView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -4)
        
        let bottomConstraint = NSLayoutConstraint(
            item: productImageView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: -4)
        
        let heighConstraint = NSLayoutConstraint(
            item: productImageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: .none,
            attribute: .height,
            multiplier: 1,
            constant: 56)
        
        let widthConstraint = NSLayoutConstraint(
            item: productImageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: .none,
            attribute: .width,
            multiplier: 1,
            constant: 56)
        
        [topConstraint,
         bottomConstraint,
         traillingConstraint,
         heighConstraint,
         widthConstraint].forEach({ $0.isActive = true })
    }
    
    private func productNameConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: productNameLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .topMargin,
            multiplier: 1,
            constant: 4)
        
        let leadingConstraint = NSLayoutConstraint(
            item: productNameLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leadingMargin,
            multiplier: 1,
            constant: 8)
        
        let traillingConstraint = NSLayoutConstraint(
            item: productNameLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: productImageView,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -8)
        
        [topConstraint,
         traillingConstraint,
         leadingConstraint].forEach({ $0.isActive = true })
    }
    
    private func productDescriptionConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: productDescription,
            attribute: .top,
            relatedBy: .equal,
            toItem: productNameLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 4)
        
        let leadingConstraint = NSLayoutConstraint(
            item: productDescription,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leadingMargin,
            multiplier: 1,
            constant: 8)
        
        let traillingConstraint = NSLayoutConstraint(
            item: productDescription,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: productImageView,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -8)
        
        
        [topConstraint,
         traillingConstraint,
         leadingConstraint].forEach({ $0.isActive = true })
    }
    
    private func productPriceConstraints() {
        let bottomConstraint = NSLayoutConstraint(
            item: productPriceLabel,
            attribute: .bottomMargin,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: -4)
        
        let leadingConstraint = NSLayoutConstraint(
            item: productPriceLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leadingMargin,
            multiplier: 1,
            constant: 8)
        
        [bottomConstraint,
         leadingConstraint].forEach({ $0.isActive = true })
    }
    
    private func productWeightConstraints() {
        let bottomConstraint = NSLayoutConstraint(
            item: productWeightLabels,
            attribute: .bottomMargin,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: -4)
        
        let leadingConstraint = NSLayoutConstraint(
            item: productWeightLabels,
            attribute: .leading,
            relatedBy: .equal,
            toItem: productPriceLabel,
            attribute: .trailing,
            multiplier: 1,
            constant: 8)
        
        let traillingConstraint = NSLayoutConstraint(
            item: productWeightLabels,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: productImageView,
            attribute: .leading,
            multiplier: 1,
            constant: -8)
        
        
        [bottomConstraint,
         traillingConstraint,
         leadingConstraint].forEach({ $0.isActive = true })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
