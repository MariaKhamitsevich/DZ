//
//  ProductsTableHeaderView.swift
//  ZooBazaar
//
//  Created by Maria Khamitsevich on 3.05.22.
//

import UIKit

class ProductsTableHeaderView: UIView {

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = ColorsManager.zbzbTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    var title: String? {
        get {
            headerLabel.text
        }
        set{
            headerLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: headerLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .topMargin,
            multiplier: 1,
            constant: 8)
        
        let centerConstraint = NSLayoutConstraint(
            item: headerLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)
        
        let botomConstraint = NSLayoutConstraint(
            item: headerLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1,
            constant: .zero)
        
        [topConstraint,
         botomConstraint,
         centerConstraint].forEach({ $0.isActive = true })
    }
}
