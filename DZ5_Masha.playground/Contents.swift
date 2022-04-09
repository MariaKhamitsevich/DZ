import UIKit


// 2. Создать инам из любимых продуктов/машин/марок одежды
// 3. Создать сущность магазин с полем продавец внутри которого заюзать инам
// 4. Создать три класса с иерархией наследования:
//    4.1 первый класс - работник с двумя полями и двумя методами, один из них приватный
//    4.2 второй класс - менеджер с оверрайдом финальным функции работа
//    4.3 третий класс - директор с финал классом и доп полем
// и у каждого приватный метод
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
