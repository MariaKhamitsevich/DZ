//
//  ViewController.swift
//  DZ_CoreData
//
//  Created by Maria Khamitsevich on 10.07.22.
//

import UIKit


class MainViewController: UIViewController {
    
    let colorStorage: ColorStorage
    let tableDelegate: MainTableDelegate

    
    var mainView: MainView {
        view as! MainView
    }
    
    override func loadView() {
        view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableView.delegate = tableDelegate
        mainView.tableView.dataSource = tableDelegate
        mainView.tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        mainView.tableView.rowHeight = UITableView.automaticDimension
        mainView.addCellButton.addTarget(self, action: #selector(addCell), for: .touchUpInside)
        mainView.deleteAllCellsButton.addTarget(self, action: #selector(deleteAllCells), for: .touchUpInside)
    }
    
    init(colorStorage: ColorStorage) {
        self.colorStorage = colorStorage
        self.tableDelegate = MainTableDelegate(colorStorage: colorStorage)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addCell() {
        colorStorage.saveData(id: UUID(), red: Int64.random(in: 0...255), green: Int64.random(in: 0...255), blue: Int64.random(in: 0...255), completion: tableDelegate.colorsProvider.chekcColors)
        
    }

    @objc func deleteAllCells() {
        colorStorage.deleteAllColors(completion: tableDelegate.colorsProvider.chekcColors)
    }
}

class MainTableDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let colorsProvider: ColorsProvider
    
    init(colorStorage: ColorStorage) {
        self.colorsProvider = ColorsProvider(colorsStorage: colorStorage)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.colorsProvider.callBack = tableView.reloadData
       return colorsProvider.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.colorsProvider.callBack = tableView.reloadData
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        cell.updateCell(color: colorsProvider.getColors(numberOfRow: indexPath))

        return cell
    }
   
}
