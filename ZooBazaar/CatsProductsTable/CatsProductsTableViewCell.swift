//
//  CatsProductsTableViewCell.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 1.05.22.
//

import UIKit

struct Product {
    let name: String
    let description: String
    let image: UIImage!
    let price: String
    var priceForKg: String {
        get {
            "\(price) rouble per kg"
        }
    }
    let isFirstweight: Bool
    let isSecondweight: Bool
    let isThirdweight: Bool
    let isFourthweight: Bool
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
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var productDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.textAlignment = .left
        label.font = UIFont.italicSystemFont(ofSize: 13)
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
        stack.axis = .horizontal
        stack.spacing = 16
        for label in stack.arrangedSubviews {
            if let label = label as? UILabel {
                label.font = UIFont.systemFont(ofSize: 12)
            }
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    private lazy var firstWeight: UILabel = {
        let label = UILabel()
        label.text = "300 g"
        label.textColor = .purple
        label.tag = 0
        label.isHidden = true
        
        return label
    }()
    private lazy var secondWeight: UILabel = {
        let label = UILabel()
        label.text = "500 g"
        label.textColor = .purple
        label.tag = 1
        label.isHidden = true
        
        return label
    }()
    private lazy var thirdWeight: UILabel = {
        let label = UILabel()
        label.text = "1000 g"
        label.textColor = .purple
        label.tag = 2
        label.isHidden = true
        
        return label
    }()
    private lazy var fourthWeight: UILabel = {
        let label = UILabel()
        label.text = "2000 g"
        label.textColor = .purple
        label.tag = 3
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
    
    func updateValues(product: Product) {
        productNameLabel.text = product.name
        productDescription.text = product.description
        productImageView.image = product.image
        productPriceLabel.text = product.priceForKg
        
        for weight in productWeightLabels.arrangedSubviews {
            switch weight.tag {
            case 0:
                weight.isHidden = !product.isFirstweight
            case 1:
                weight.isHidden = !product.isSecondweight
            case 2:
                weight.isHidden = !product.isThirdweight
            default:
                weight.isHidden = !product.isFourthweight
            }
        }
        
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
            constant: 170)
        
        let widthConstraint = NSLayoutConstraint(
            item: productImageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: .none,
            attribute: .width,
            multiplier: 1,
            constant: 100)
        
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
            attribute: .leading,
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
            attribute: .leading,
            multiplier: 1,
            constant: -8)
        
        
        [topConstraint,
         traillingConstraint,
         leadingConstraint].forEach({ $0.isActive = true })
    }
    
    private func productPriceConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: productPriceLabel,
            attribute: .top,
            relatedBy: .greaterThanOrEqual,
            toItem: productDescription,
            attribute: .bottom,
            multiplier: 1,
            constant: 4)
        
        let leadingConstraint = NSLayoutConstraint(
            item: productPriceLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leadingMargin,
            multiplier: 1,
            constant: 8)
        
        [topConstraint,
         leadingConstraint].forEach({ $0.isActive = true })
    }
    
    private func productWeightConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: productWeightLabels,
            attribute: .top,
            relatedBy: .equal,
            toItem: productPriceLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 4)
        
        let bottomConstraint = NSLayoutConstraint(
            item: productWeightLabels,
            attribute: .bottomMargin,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: -8)
        
        let leadingConstraint = NSLayoutConstraint(
            item: productWeightLabels,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leadingMargin,
            multiplier: 1,
            constant: 8)
        
        let traillingConstraint = NSLayoutConstraint(
            item: productWeightLabels,
            attribute: .trailing,
            relatedBy: .lessThanOrEqual,
            toItem: productImageView,
            attribute: .leading,
            multiplier: 1,
            constant: -8)
        
        
        [topConstraint,
         bottomConstraint,
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
