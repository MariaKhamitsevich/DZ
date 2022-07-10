//
//  MainTableViewCell.swift
//  DZ_CoreData
//
//  Created by Maria Khamitsevich on 10.07.22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    private lazy var colorsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [redLabel, greenLabel, blueLabel])
        stack.axis = .vertical
        stack.spacing = 8
        
        return stack
    }()

    private lazy var redLabel: UILabel = {
        let label = UILabel()
        label.text = "Red: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    private lazy var greenLabel: UILabel = {
        let label = UILabel()
        label.text = "Green: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()

    private lazy var blueLabel: UILabel = {
        let label = UILabel()
        label.text = "Blue: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addAllSubviews()
        setAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(color: Colors) {
        let red = color.red
        let green = color.green
        let blue = color.blue
        
        contentView.backgroundColor = UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
        redLabel.text = "Red: \(red)/255"
        greenLabel.text = "Green: \(green)/255"
        blueLabel.text = "Blue: \(blue)/255"
    }
    
    private func addAllSubviews() {
        contentView.addSubview(colorsStack)
        
        contentView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setAllConstraints() {
        colorsStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        colorsStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        colorsStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
    }
}
