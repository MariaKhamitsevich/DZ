//
//  HomeScreenView.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 26.04.22.
//

import UIKit

class HomeScreenView: UIView {

    let wellcomeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(wellcomeLabel)
        
        setAllConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAllConstrains() {
        wellcomeLabelConstrains()
    }
    
    private func wellcomeLabelConstrains() {
        let topConstraint = NSLayoutConstraint(
            item: wellcomeLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .topMargin,
            multiplier: 1,
            constant: 48)
        
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
            constant: 24)
        
        let heighConstraint = NSLayoutConstraint(item: wellcomeLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: self,
            attribute: .height,
            multiplier: 1,
            constant: 16)
        
        [topConstraint,
         leadingConstraint,
         traillingConstraint,
         heighConstraint].forEach({ $0.isActive = true })
    }
    
    private func wellcomeLabelSettings() {
        wellcomeLabel.text = "Welcome to ZooBazaar!"
        wellcomeLabel.textAlignment = .center
//        wellcomeLabel.font = 
        
    }
}
