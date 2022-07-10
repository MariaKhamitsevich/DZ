//
//  MainView.swift
//  DZ_CoreData
//
//  Created by Maria Khamitsevich on 10.07.22.
//

import UIKit

class MainView: UIView {

    private(set) lazy var tableView: UITableView = {
        let table = UITableView()
        
        return table
    }()
    
    private(set) lazy var addCellButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan.withAlphaComponent(0.9)
        button.setTitle("Add cell", for: .normal)
        button.setTitleColor(UIColor.darkGray.withAlphaComponent(0.8), for: .highlighted)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    private(set) lazy var deleteAllCellsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan.withAlphaComponent(0.95)
        button.setTitle("Delete Cells", for: .normal)
        button.setTitleColor(UIColor.darkGray.withAlphaComponent(0.8), for: .highlighted)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addAllSubviews()
        setAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addAllSubviews() {
        self.addSubview(tableView)
        self.addSubview(addCellButton)
        self.addSubview(deleteAllCellsButton)
        
        self.subviews.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setAllConstraints() {
        let tableConstraints = [
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            tableView.bottomAnchor.constraint(equalTo: addCellButton.topAnchor, constant: -12)
        ]
        
        let addButtonConstraints = [
            addCellButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            addCellButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            addCellButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.15)
        ]
        
        let deleteButtonConstraints = [
            deleteAllCellsButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            deleteAllCellsButton.leadingAnchor.constraint(equalTo: addCellButton.trailingAnchor, constant: 8),
            deleteAllCellsButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -4),
            deleteAllCellsButton.widthAnchor.constraint(equalTo: addCellButton.widthAnchor),
            deleteAllCellsButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.15)
        ]
        
        tableConstraints.forEach{ $0.isActive = true }
        addButtonConstraints.forEach{ $0.isActive = true }
        deleteButtonConstraints.forEach{ $0.isActive = true }
    }
}
