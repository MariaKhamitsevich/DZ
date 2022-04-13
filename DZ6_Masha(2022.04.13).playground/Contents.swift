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


struct Lada: CarsRequirements {
    var releaseYear: UInt
    
    var volumeOfMotor: Double
    
    var owner: String
    
    var insuranceCost: Int {
        get {
            insureTheCar()
        }
        set {
            print("You could't chanhe the insurence cost")
        }
    }
    
    init(releaseYear: UInt, volumeOfMotor: Double, owner: String) {
        self.releaseYear = releaseYear
        self.volumeOfMotor = volumeOfMotor
        self.owner = owner
    }
    
    func insureTheCar() -> Int {
        switch volumeOfMotor {
        case ...1.6 where releaseYear <= 2000:
            return 40
        case ...1.6 where releaseYear > 2000:
            return 35
        case ...1.8:
            return 45
        default:
            return 50
        }
    }
    
    
}
var carOfMisha: CarsRequirements = CitroenXantia(releaseYear: 1998, volumeOfMotor: 1.8, owner: "Misha", daysOfInsure: ._0)
carOfMisha = Lada(releaseYear: 2005, volumeOfMotor: 1.7, owner: "Misha")
carOfMisha.insuranceCost


// 3. Создать протокол с инамом
// 4. Пример сущности с соответствием нескольким протоколам

protocol AtomicMass {
    var numberOfProtones: Int {get}
    var calculatedMass: Int {get}
    
    func calculateMass() -> Int
}

protocol ElementDescription {
    var elementDescription: String {get}
}

enum Halogens: AtomicMass, ElementDescription {
    
    case fluorine(neutrons: Int)
    case chlorine(neutrons: Int)
    case bromine(neutrons: Int)
    case iodine(neutrons: Int)
    case astatine(neutrons: Int)
    
    var numberOfProtones: Int {
        switch self {
        case .fluorine:
            return 9
        case .chlorine:
            return 17
        case .bromine:
            return 35
        case .iodine:
            return 53
        case .astatine:
            return 85
        }
    }
    var calculatedMass: Int {
        calculateMass()
    }
    
    func calculateMass() -> Int {
        switch self {
        case let .fluorine(neutrons: neutrons):
            return self.numberOfProtones + neutrons
        case let .chlorine(neutrons: neutrons):
            return self.numberOfProtones + neutrons
        case let .bromine(neutrons: neutrons):
            return self.numberOfProtones + neutrons
        case let .iodine(neutrons: neutrons):
            return self.numberOfProtones + neutrons
        case let .astatine(neutrons: neutrons):
            return self.numberOfProtones + neutrons
        }
    }
    
    var elementDescription: String {
        "Isotop of \(self) has \(numberOfProtones) protones and \(calculateMass()) atomic mass"
    }
}

let isotopOfChlorine: Halogens = .chlorine(neutrons: 18)
print(isotopOfChlorine.elementDescription)

// 5. Пример класса с наследованием и соответствием протоколу, которому суперкласс не соответствует

protocol RussianCars {
    static var mainOffice: String {get}
}

class Zhiguli: CarsRequirements {
    var releaseYear: UInt
    
    var volumeOfMotor: Double
    
    var owner: String
    
    var insuranceCost: Int {
        get {insureTheCar()
        }
        set {
            print("Sorry, you have fixed value for your car and could't change it")
        }
    }
    
    init(releaseYear: UInt, volumeOfMotor: Double, owner: String) {
        self.releaseYear = releaseYear
        self.volumeOfMotor = volumeOfMotor
        self.owner = owner
    }
    
    func insureTheCar() -> Int {
        return 60
    }
    
}

extension Zhiguli: RussianCars {
    static var mainOffice: String = "Moscow"
}

// 6. Приводить типы через as? и (as! с использованием is)

var arrayOfCars: [CarsRequirements] = []
arrayOfCars.append(myCar)
arrayOfCars.append(carOfMisha)

for i in arrayOfCars {
    if let car = i as? Lada {
        print("\(car.owner) is owner of Lada")
    } else if i is CitroenXantia {
        i as! CitroenXantia
        print("\(i.volumeOfMotor) is volume of motor of Citroen Xantia")
    } else if let car = i as? Citroen {
        print("You should pay \(car.insuranceCost) for insurance of Citroen")
    }
}
