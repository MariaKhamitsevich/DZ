//
//  CatsProductsTableViewCell.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 1.05.22.
//

import UIKit
import SnapKit

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

class ProductsTableViewCell: UITableViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        productDescription.numberOfLines = 4
    }
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
                
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorsManager.zbzbTextColor
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
        label.numberOfLines = 4
        label.textAlignment = .left
        label.font = UIFont.italicSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        
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
    
    private lazy var fakeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true

        
        return button
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
        contentView.addSubview(fakeButton)
        contentView.isUserInteractionEnabled = true
        
        setAllConstraints()
        fakeButton.addTarget(self, action: #selector(watchTheDescription(_:)), for: .touchUpInside)
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
        self.productImageView.snp.updateConstraints { make in
            make.top.equalTo(contentView.snp.topMargin).offset(4)
            make.trailing.equalTo(contentView.snp.trailingMargin).offset(-4)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-12)
            make.height.equalTo(170)
            make.width.equalTo(90)
        }
        self.productNameLabel.snp.updateConstraints { make in
            make.top.equalTo(contentView.snp.topMargin).offset(4)
            make.leadingMargin.equalTo(contentView.snp.leadingMargin).offset(8)
            make.trailing.equalTo(productImageView.snp.leading).offset(-8)
        }
        self.productDescription.snp.updateConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(4)
            make.leadingMargin.equalTo(contentView.snp.leadingMargin).offset(8)
            make.trailingMargin.equalTo(productImageView.snp.leading).offset(-8)
        }
        self.fakeButton.snp.updateConstraints { make in
            make.top.equalTo(productDescription.snp.top)
            make.leading.equalTo(productDescription.snp.leading)
            make.trailing.equalTo(productDescription.snp.trailing)
            make.bottom.equalTo(productDescription.snp.bottom)
        }
        self.productPriceLabel.snp.updateConstraints { make in
            make.top.greaterThanOrEqualTo(productDescription.snp.bottom).offset(4)
            make.leadingMargin.equalTo(contentView.snp.leadingMargin).offset(8)
        }
        self.productWeightLabels.snp.updateConstraints { make in
            make.top.equalTo(productPriceLabel.snp.bottom).offset(4)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.leading.equalTo(contentView.snp.leadingMargin).offset(8)
            make.trailing.lessThanOrEqualTo(productImageView.snp.leading).offset(-8)
        }
    }
    private var isActive: Bool = false
    
    @objc func watchTheDescription(_ gesture: UITapGestureRecognizer) {
        
        isActive.toggle()
        if isActive {
            self.productImageView.snp.updateConstraints { make in
                make.top.equalTo(contentView.snp.topMargin).offset(4)
                make.trailing.equalTo(contentView.snp.trailingMargin).offset(-4)
                make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-12)
                make.height.equalTo(34)
                make.width.equalTo(18)
            }
            productDescription.numberOfLines = 0
            productNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
            
        } else {
            self.productImageView.snp.updateConstraints { make in
                make.top.equalTo(contentView.snp.topMargin).offset(4)
                make.trailing.equalTo(contentView.snp.trailingMargin).offset(-4)
                make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-12)
                make.height.equalTo(170)
                make.width.equalTo(90)
            }
            
            productDescription.numberOfLines = 4
            productNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        }
    }
}
