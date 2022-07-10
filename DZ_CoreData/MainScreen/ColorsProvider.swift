//
//  ColorsProvider.swift
//  DZ_CoreData
//
//  Created by Maria Khamitsevich on 10.07.22.
//

import Foundation


class ColorsProvider {
    let colorsStorage: ColorStorage
    var colors: [Colors] = []
    
    var callBack: (() -> Void)?
    
    
    init(colorsStorage: ColorStorage) {
        self.colorsStorage = colorsStorage
        colorsStorage.fetchAllColors { [weak self] colors in
            self?.colors = colors
            self?.callBack?()
        }
    }
    
    func numberOfRows() -> Int {
        colors.count
    }
    
    func getColors(numberOfRow: IndexPath) -> Colors {
        colors[numberOfRow.row]
    }
    
    func chekcColors() {
        self.colorsStorage.fetchAllColors { [weak self] colors in
            self?.colors = colors
            self?.callBack?()
        }
    }
}
