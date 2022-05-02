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
    
    private lazy var imageForProduct: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
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
        
        contentView.addSubview(imageForProduct)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productPriceLabel)
        contentView.addSubview(productWeightLabels)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
