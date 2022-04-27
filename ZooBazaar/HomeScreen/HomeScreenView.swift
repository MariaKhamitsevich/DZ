//
//  HomeScreenView.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 26.04.22.
//

import UIKit

class HomeScreenView: UIView {

    let wellcomeLabel = UILabel()
    let settingsButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 255/255, green: 190/255, blue: 189/255, alpha: 1)
        
        addSubview(wellcomeLabel)
        addSubview(settingsButton)
        
        
        setAllConstrains()
        setAllProperties()
        [wellcomeLabel, settingsButton].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAllConstrains() {
        wellcomeLabelConstrains()
        settingsButtonConstraints()
    }
    
    private func setAllProperties() {
        wellcomeLabelProperties()
        settingsButtonProperties()
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
    
    private func wellcomeLabelProperties() {
        wellcomeLabel.text = "Welcome to ZooBazaar!"
        wellcomeLabel.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
        wellcomeLabel.textAlignment = .center
        wellcomeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        wellcomeLabel.numberOfLines = 1
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
    
    private func settingsButtonProperties() {

        settingsButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        settingsButton.imageView?.tintColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
       
    }
}
