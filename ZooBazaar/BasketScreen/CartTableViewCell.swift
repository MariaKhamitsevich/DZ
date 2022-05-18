//
//  CartTableViewCell.swift
//  ZooBazaar
//
//  Created by Maria Khamitsevich on 18.05.22.
//

import UIKit
import SnapKit

class CartTableViewCell: UITableViewCell {
    
    private lazy var productImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    private lazy var productName: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(productImage)
        contentView.addSubview(productName)
        
        setAllConstraints()
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
 
    private func setAllConstraints() {
        self.productImage.snp.updateConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(4)
            make.leading.equalTo(contentView.snp.leading).offset(4)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide.snp.bottom).offset(-4)
        }
        self.productName.snp.updateConstraints { make in
            make.top.equalTo(productImage.snp.top)
            make.leading.equalTo(productImage.snp.trailing).offset(4)
            make.trailing.equalTo(contentView.snp.trailing).offset(-4)
        }
    }
}
