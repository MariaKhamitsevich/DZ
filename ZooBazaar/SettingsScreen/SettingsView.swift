//
//  SettingsView.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 27.04.22.
//

import UIKit

class SettingsView: UIView {
   
    //MARK: Properties
    // InformationStackViews
    private lazy var informationStackView: UIStackView = {
        
            let stackView = UIStackView()
            stackView.addArrangedSubview(telephoneLabel)
            stackView.addArrangedSubview(emailLabel)
            stackView.addArrangedSubview(addressLabel)
            stackView.axis = .vertical
            stackView.spacing = 16
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
    }()
    
    private var telephoneLabel: UILabel {
        get {
            let label = UILabel()
            label.text = "Telephone: +375251234567"
            label.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
            label.textAlignment = .left
            label.font = UIFont.italicSystemFont(ofSize: 16)
            
            return label
        }
    }
    
    private var emailLabel: UILabel {
        get {
            let label = UILabel()
            label.text = "Email: zoobazaar@zoobazaar.by"
            label.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
            label.textAlignment = .left
            label.font = UIFont.italicSystemFont(ofSize: 16)
            
            return label
        }
    }
    
    private var addressLabel: UILabel {
        get {
            let label = UILabel()
            label.text = "Address: Pershaya str., 1"
            label.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
            label.textAlignment = .left
            label.font = UIFont.italicSystemFont(ofSize: 16)

            return label
        }
    }
    
    //ColorLabelsStack
    private lazy var colorsLabelsStack: UIStackView = {
            let stackView = UIStackView()
            stackView.addArrangedSubview(redTitleLabel)
            stackView.addArrangedSubview(greenTitleLabel)
            stackView.addArrangedSubview(blueTitleLabel)
            stackView.axis = .vertical
            stackView.spacing = 16
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
    }()
    
    private var redTitleLabel: UILabel {
        get {
            let label = UILabel()
            label.text = "Red"
            label.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
            label.textAlignment = .left
            label.font = UIFont.italicSystemFont(ofSize: 16)

            return label
        }
    }
    
    private var greenTitleLabel: UILabel {
        get {
            let label = UILabel()
            label.text = "Green"
            label.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
            label.textAlignment = .left
            label.font = UIFont.italicSystemFont(ofSize: 16)
            
            return label
        }
    }

    private var blueTitleLabel: UILabel {
        get {
            let label = UILabel()
            label.text = "Blue"
            label.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
            label.textAlignment = .left
            label.font = UIFont.italicSystemFont(ofSize: 16)

            return label
        }
    }
    
    // colorValueStack
    lazy var colorsValueStack: UIStackView = {
            let stackView = UIStackView()
            stackView.addArrangedSubview(redValueLabel)
            stackView.addArrangedSubview(greenValueLabel)
            stackView.addArrangedSubview(blueValueLabel)
            stackView.axis = .vertical
            stackView.spacing = 16
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
    }()
    
    lazy var redValueLabel: UILabel = {
            let label = UILabel()
            label.text = "0"
            label.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 16)

            return label
    }()
    
    lazy var greenValueLabel: UILabel = {
            let label = UILabel()
            label.text = "0"
            label.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 16)
            
            return label
    }()

    lazy var blueValueLabel: UILabel = {
            let label = UILabel()
            label.text = "0"
            label.textColor = UIColor(red: 188/255, green: 22/255, blue: 72/255, alpha: 1)
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 16)

            return label
    }()
    
    lazy var colorSlidersStack: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(redSlider)
        stackView.addArrangedSubview(greenSlider)
        stackView.addArrangedSubview(blueSlider)
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var redSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 255
        slider.value = 0
        slider.tag = 0
        slider.isContinuous = true
        slider.isEnabled = true
        slider.isUserInteractionEnabled = true
        
        return slider
    }()
    
    lazy var greenSlider: UISlider = {
            let slider = UISlider()
            slider.minimumValue = 0
            slider.maximumValue = 255
            slider.value = 0
            slider.tag = 1
            slider.isContinuous = true
            slider.isEnabled = true
            
            slider.isUserInteractionEnabled = true

            return slider
    }()
    
    lazy var blueSlider: UISlider = {
            let slider = UISlider()
            slider.minimumValue = 0
            slider.maximumValue = 255
            slider.value = 0
            slider.tag = 2
            slider.isContinuous = true
            slider.isEnabled = true
            slider.isUserInteractionEnabled = true
            
            return slider
    }()
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 255/255, green: 190/255, blue: 189/255, alpha: 1)
        addSubview(informationStackView)
        addSubview(colorsLabelsStack)
        addSubview(colorsValueStack)
        addSubview(colorSlidersStack)
        setAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAllConstraints() {
        informationStackViewConstraints()
        colorStackViewConstraints()
        colorValueStackViewConstraints()
        colorSliderStackViewConstraints()
    }
    
    private func informationStackViewConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: informationStackView,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .topMargin,
            multiplier: 1,
            constant: 54)
        let leadingConstraint = NSLayoutConstraint(
            item: informationStackView,
           attribute: .leading,
           relatedBy: .equal,
           toItem: self,
           attribute: .leadingMargin,
           multiplier: 1,
           constant: 24)
        
        for label in informationStackView.arrangedSubviews {
            let heighConstraint = NSLayoutConstraint(
                item: label,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 16)
            heighConstraint.isActive = true
        }
        
        [topConstraint,
         leadingConstraint].forEach({ $0.isActive = true })
    }
    
    private func colorStackViewConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: colorsLabelsStack,
            attribute: .top,
            relatedBy: .equal,
            toItem: informationStackView,
            attribute: .bottom,
            multiplier: 1,
            constant: 32)
        let leadingConstraint = NSLayoutConstraint(
            item: colorsLabelsStack,
           attribute: .leading,
           relatedBy: .equal,
           toItem: self,
           attribute: .leadingMargin,
           multiplier: 1,
           constant: 24)
        
        for label in colorsLabelsStack.arrangedSubviews {
            let heighConstraint = NSLayoutConstraint(
                item: label,
               attribute: .height,
               relatedBy: .equal,
                toItem: .none,
               attribute: .height,
               multiplier: 1,
               constant: 16)
            heighConstraint.isActive = true
        }
        
        [topConstraint,
         leadingConstraint].forEach({ $0.isActive = true })
    }
    
    private func colorValueStackViewConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: colorsValueStack,
            attribute: .top,
            relatedBy: .equal,
            toItem: informationStackView,
            attribute: .bottom,
            multiplier: 1,
            constant: 32)
        let leadingConstraint = NSLayoutConstraint(
            item: colorsValueStack,
           attribute: .leading,
           relatedBy: .equal,
           toItem: colorsLabelsStack,
           attribute: .trailingMargin,
           multiplier: 1,
           constant: 24)
        
        for label in colorsValueStack.arrangedSubviews {
            let heighConstraint = NSLayoutConstraint(
                item: label,
               attribute: .height,
               relatedBy: .equal,
                toItem: .none,
               attribute: .height,
               multiplier: 1,
               constant: 16)
            
            let widthConstraint = NSLayoutConstraint(
                item: label,
               attribute: .width,
               relatedBy: .equal,
                toItem: .none,
               attribute: .width,
               multiplier: 1,
               constant: 40)
            heighConstraint.isActive = true
            widthConstraint.isActive = true
        }
        
        [topConstraint,
         leadingConstraint].forEach({ $0.isActive = true })
    }
    
    private func colorSliderStackViewConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: colorSlidersStack,
            attribute: .top,
            relatedBy: .equal,
            toItem: informationStackView,
            attribute: .bottom,
            multiplier: 1,
            constant: 32)
        let leadingConstraint = NSLayoutConstraint(
            item: colorSlidersStack,
           attribute: .leading,
           relatedBy: .equal,
           toItem: colorsValueStack,
           attribute: .trailingMargin,
           multiplier: 1,
           constant: 24)
        let treallingConstraint = NSLayoutConstraint(
            item: colorSlidersStack,
           attribute: .trailing,
           relatedBy: .equal,
           toItem: self,
           attribute: .trailingMargin,
           multiplier: 1,
           constant: -24)
        
        for label in colorSlidersStack.arrangedSubviews {
            let heighConstraint = NSLayoutConstraint(
                item: label,
               attribute: .height,
               relatedBy: .equal,
                toItem: .none,
               attribute: .height,
               multiplier: 1,
               constant: 16)
         
            heighConstraint.isActive = true
            
        }
        
        [topConstraint,
         leadingConstraint, treallingConstraint].forEach({ $0.isActive = true })
    }
    
}
