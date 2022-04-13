import UIKit

// 1. Создать enum c get-only проперти и класс/структуру с get/set property
// Сделано в прошлой работе


// 2. Создать протокол для машины и создать три разных структуры и класса

protocol CarsRequirements {
    var releaseYear: UInt {get}
    var volumeOfMotor: Double {get}
    var owner: String {get set}
    var insuranceCost: Int {get set}
    
    
    func insureTheCar() -> Int
}

enum DaysOfInsure: Int {
    case _0 = 0
    case _14 = 14
    case _30 = 30
    case _180 = 180
    case _365 = 365
}

class Citroen: CarsRequirements {
    var releaseYear: UInt
    
    var volumeOfMotor: Double
    
    var owner: String
    
    fileprivate var daysOfInsure: DaysOfInsure = ._0
    
    var insuranceCost: Int {
        get {
            insureTheCar()
        }
        set {
            switch newValue {
            case 0:
                daysOfInsure = ._0
            case 10:
                daysOfInsure = ._14
            case 15:
                daysOfInsure = ._30
            case 40:
                daysOfInsure = ._180
            case 70:
                daysOfInsure = ._365
            default:
                print("Please choose an existing way of Insurance")
            }
        }
    }
    
    init(releaseYear: UInt, volumeOfMotor: Double, owner: String, daysOfInsure: DaysOfInsure) {
        self.releaseYear = releaseYear
        self.volumeOfMotor = volumeOfMotor
        self.owner = owner
        self.daysOfInsure = daysOfInsure
    }
    
    func insureTheCar() -> Int {
        switch daysOfInsure {
        case ._0:
            return 0
        case ._14:
            return 10
        case ._30:
            return 15
        case ._180:
            return 40
        case ._365:
            return 70
        }
    }
    
    
}

var myCar = Citroen(releaseYear: 2000, volumeOfMotor: 1.6, owner: "Lida", daysOfInsure: ._180)
myCar.insuranceCost
myCar.insuranceCost = 15
myCar.insuranceCost


class CitroenXantia: Citroen {
    
    override var insuranceCost: Int {
        get {
            insureTheCar()
        }
        set {
            switch newValue {
            case 0:
                daysOfInsure = ._0
            case 10:
                daysOfInsure = ._14
            case 15:
                daysOfInsure = ._30
            case 40:
                daysOfInsure = ._180
            case 70 where releaseYear > 2000:
                daysOfInsure = ._365
            case 80 where releaseYear <= 2000:
                daysOfInsure = ._365
            default:
                print("Please choose an existing way of Insurance")
    }
        }
    }
            
    override func insureTheCar() -> Int {
        switch daysOfInsure {
        case ._0:
            return 0
        case ._14:
            return 10
        case ._30:
            return 15
        case ._180:
            return 40
        case ._365 where releaseYear <= 2000:
            return 80
        case ._365 where releaseYear > 2000:
            return 70
        default:
            return 0
        }
    }
}

// 3. Создать протокол с инамом
// 4. Пример сущности с соответствием нескольким протоколам
// 5. Пример класса с наследованием и соответствием протоколу, которому суперкласс не соответствует
// 6. Приводить типы через as? и (as! с использованием is)

