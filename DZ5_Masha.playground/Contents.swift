import UIKit


// 2. Создать инам из любимых продуктов/машин/марок одежды
// 3. Создать сущность магазин с полем продавец внутри которого заюзать инам
// 5*. Создать enum c get-only проперти и класс/структуру с get/set property

enum Clothes {
    enum Brand {
        case prada
        case louisVuitton
        case gucci
    }
    
    enum Color: String {
        case red = "красного"
        case green = "зеленого"
        case black = "черного"
        case yellow = "желтого"
    }
    
    case blouse(brand: Brand, color: Color)
    case skirt(brand: Brand, color: Color)
    case dress(brand: Brand, color: Color)
    
    var messageAboutChoice: String {
        switch self {
        case .blouse:
            return "Вы выбрали блузку"
        case  .dress:
            return "Вы выбрали платье"
        case .skirt:
            return "Вы выбрали юбку"
        }
    }
               
    func description() -> String {
        switch self {
        case let .blouse(brand, color):
            return "Блузка бренда \(brand) \(color.rawValue) цвета"
        case let .dress(brand, color):
            return "Платье бренда \(brand) \(color.rawValue) цвета"
        case let .skirt(brand, color):
            return "Юбка бренда \(brand) \(color.rawValue) цвета"
        }
    }
}

var myClothers: Clothes = .dress(brand: .gucci, color: .black)
print(myClothers.description())
myClothers.messageAboutChoice


struct ShopOfClothes {
    var purchases: [Clothes] = []
    static var nameOfSalesman = "Джон"
    var discountInPercent: Int {
        get {
            switch purchases.count {
            case 0:
                return 0
            case 1, 2:
                return 5
            case 3, 4:
                return 10
            default:
                return 15
            }
        }
        set {
            print("Извините, Вы не можете сами установить скидку. Скидка зависит от количества Ваших покупок")
        }
    }
    
    init(purchases: [Clothes]) {
        self.purchases = purchases
    }
    
    func welcomeMassage() {
        print("Добрый день! Меня зовут \(ShopOfClothes.nameOfSalesman), могу ли я чем-нибудь Вам помочь?")
    }
    
    //Функция добавляет один или несколько элементов в покупки
    
    mutating func addPurchases(_ purchase: [Clothes]){
        
        if purchase.count == 1 {
            self.purchases.append(purchase[0])
            print(purchase[0].messageAboutChoice)
            } else if purchase.count > 1 {
                self.purchases += purchase
                let elements = purchase[0...purchase.count - 1]
                let arrayElements = Array<Clothes>(elements)
                
                arrayElements.forEach({ print($0.messageAboutChoice) })
                } else {
                   print("Пожалуйста, выберите что-нибудь из нашего каталога \"Clothes\"")
                }
            
        }
}

var shop1 = ShopOfClothes(purchases: [])
shop1.welcomeMassage()
shop1.addPurchases([.dress(brand: .gucci, color: .red)])
shop1.discountInPercent
shop1.addPurchases([.dress(brand: .louisVuitton, color: .red), .blouse(brand: .prada, color: .green)])
shop1.discountInPercent



//4. Создать три класса с иерархией наследования:
//    4.1 первый класс - работник с двумя полями и двумя методами, один из них приватный
//    4.2 второй класс - менеджер с оверрайдом финальным функции работа
//    4.3 третий класс - директор с финал классом и доп полем
// и у каждого приватный метод


class Employee {
    enum DaysOfTheWeek: Int {
        case monday = 1
        case wuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
    }
    let name: String
    let surname: String
    var fullName: String {
        "\(name) \(surname)"
    }
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    
    private func doWork() -> String {
        "Employee \(fullName) do something"
    }
    func setWeekend(day1: DaysOfTheWeek, day2: DaysOfTheWeek) {
        print("Your weekend set at \(day1) and \(day2)")
    }
}
