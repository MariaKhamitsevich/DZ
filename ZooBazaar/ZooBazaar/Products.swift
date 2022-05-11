//
//  Products.swift
//  ZooBazaar
//
//  Created by Maria Khamitsevich on 11.05.22.
//

import UIKit

protocol ProductsForPets {
    var title: String {get}
    var products: [Product] {get}
}

enum Pets {
    case cats
    case dogs
    case rodents
    
    enum CatsProducts: String, ProductsForPets {
        case royalCanin = "Royal Canin"
        case whiskas = "Whiskas"
        
        var title: String {
            self.rawValue
        }
        
        var products: [Product] {
            var array: [Product] = []
            switch self {
            case .royalCanin:
                array = [
                    Product(name: "Roayl Canin Sterilized", description: "Royal Canin Sterilized 37 food for sterilized cats from 1 to 7 years old.", image: UIImage(named: "roal canin"), price: "17", isFirstweight: true, isSecondweight: true, isThirdweight: true, isFourthweight: true),
                    Product(name: "Royal Canin Maine Coon", description: "Royal Canin Maine Coon is designed specifically for Maine Coon cats over the age of 15 months.", image: UIImage(named: "Royal Canin Maine Coon"), price: "30.5", isFirstweight: true, isSecondweight: false, isThirdweight: false, isFourthweight: true),
                    Product(name: "Royal Canin Exigent Savour Sensation", description: "Savor sensation is designed for finicky cats. These are two different types of croquette that differ in shape, texture and composition.", image: UIImage(named: "Royal Canin Exigent Savour Sensation"), price: "25.5", isFirstweight: true, isSecondweight: false, isThirdweight: true, isFourthweight: true)
                ]
            case .whiskas:
                array = [
                    Product(name: "Whiskas for adult cats (Beef)", description: "Whiskas for sterilized cats (Beef) is a complete dry food for adult cats and cats. Whiskas contains all the necessary vitamins and minerals, proteins, fats and carbohydrates in the right proportions to keep your pet healthy from whiskers to tail.", image: UIImage(named: "Whiskas for adult cats (Beef)"), price: "7.25", isFirstweight: false, isSecondweight: false, isThirdweight: true, isFourthweight: true)
                ]
            }
            return array
        }
        
        
    }
    
    enum DogsProducts: String, ProductsForPets {
        case chappi = "Chappi"
        case grandorf = "Grandorf"
        case happyDog = "Happy Dog"
        
        var title: String {
            self.rawValue
        }
        
        var products: [Product] {
            var array: [Product] = []
            switch self {
            case .chappi:
                array = [
                    Product(name: "Chappi корм для собак Мясное изобилие", description: "Полноценный сухой корм для взрослых собак всех пород. Не содержит искусственных ароматизаторов и усилителей вкуса.Мясо для силы и энергии в течение дня.Овощи, травы, злаки для отличного пищеварения. Масла и жиры для блестящей шерсти и здоровой кожи.", image: UIImage(named: "Chappi Мясное изобилие"), price: "6", isFirstweight: true, isSecondweight: true, isThirdweight: true, isFourthweight: true),
                    Product(name: "Chappi корм для собак с говядиной", description: "Полноценный сухой корм для взрослых собак всех пород. Не содержит искусственных ароматизаторов и усилителей вкуса.Мясо для силы и энергии в течение дня.Овощи, травы, злаки для отличного пищеварения. Масла и жиры для блестящей шерсти и здоровой кожи.Кальций для крепких зубов и костей.", image: UIImage(named: "Chappi корм для собак с говядиной"), price: "6", isFirstweight: true, isSecondweight: false, isThirdweight: false, isFourthweight: true),
                ]
            case .grandorf:
                array = [
                    Product(name: "Grandorf Adult All Breeds (Белая рыба и рис)", description: "Grandorf Sensitive Care Holistic White Fish & Rice All Breeds (Белая рыба, рис) - это гипоаллергенный корм для взрослых собак всех пород старше 1 года. ", image: UIImage(named: "Grandorf Adult All Breeds (Белая рыба и рис)"), price: "30", isFirstweight: false, isSecondweight: false, isThirdweight: true, isFourthweight: true)
                ]
            case .happyDog:
                array = []
            }
            return array
        }
    }
    
    enum RodentsProducts: String, ProductsForPets {
        case littleKing = "Little King"
        case littleOne = "Little One"
        
        var title: String {
            self.rawValue
        }
        
        var products: [Product] {
            var array: [Product] = []
            switch self {
            case .littleKing:
                array = [
                    Product(name: "Little King лакомство для грызунов (корзинка зерновая)", description: "Подходит для всех видов грызунов, т.к не содержит сладких ингридиентов.Благодаря твердой структуре позволяет удовлетворить естественные потребности зверьков что-то грызть, при этом стачивать острые зубы.", image: UIImage(named: "Little King лакомство для грызунов (корзинка зерновая)"), price: "38", isFirstweight: true, isSecondweight: true, isThirdweight: false, isFourthweight: false),
                ]
            case .littleOne:
                array = [
                    Product(name: "Little One Корм для морских свинок", description: "Суточная доза корма Little One для морских свинок составляет 35-50 г на зверька в зависимости от его размера.Кормите свинку два раза в день в одно и то же время.Следите, чтобы у морской свинки всегда была свежая вода.", image: UIImage(named: "Little One Корм для морских свинок 900гр"), price: "42", isFirstweight: true, isSecondweight: true, isThirdweight: false, isFourthweight: false)
                ]
            }
            return array
        }
    }
    
    var items: [[Product]] {
        switch self {
        case .cats:
            return [CatsProducts.royalCanin.products, CatsProducts.whiskas.products]
        case .dogs:
            return [DogsProducts.chappi.products, DogsProducts.grandorf.products, DogsProducts.happyDog.products]
        case .rodents:
            return  [RodentsProducts.littleKing.products, RodentsProducts.littleOne.products]
        }
    }
    
    var titles: [String] {
        switch self {
        case .cats:
            return [CatsProducts.royalCanin.title, CatsProducts.whiskas.title]
        case .dogs:
            return [DogsProducts.chappi.title, DogsProducts.grandorf.title, DogsProducts.happyDog.title]
        case .rodents:
            return  [RodentsProducts.littleKing.title, RodentsProducts.littleOne.title]
        }
    }
}
