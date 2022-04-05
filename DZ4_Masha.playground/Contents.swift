import UIKit

/* MARK: 1. Написать функцию имеющую аргументы с двойными именами
    2. Обработать перечисление значений через for in для словаря и массива
    3. Поработать с опциональными значениями с ??
    4. Создать свою структуру с двумя полями разного типа и двумя методами разного типа и проинициализировать используя модификаторы доступа
    5. Создать массив со своим типом данных и вывести его значения в цикле for in и while
*/

// Часть 1: создаю структуру Cat
struct Cat {
    private var name: String?
    var age: Int
    var nicknames: Set<String>
    
    init(name: String?, age: Int, nicknames: Set<String>) {
        self.name = name
        self.age = age
        self.nicknames = nicknames
    }
    
    mutating func callTheCat(calling number: Int, whatFor: String) {
        self.nicknames.insert(self.name ?? "Котик")
        var numberIterations = 0
        
        for i in self.nicknames {
            numberIterations += 1
            print("\(i) приходи \(whatFor)!")
            
            if numberIterations >= number {
                break
            } 
        }
        
        if number > self.nicknames.count {
            var repeating = number - self.nicknames.count
            
            while repeating > 0 {
                repeating -= 1
                print("Кис кис кис")
            }
        }
    }
    
    mutating func addTheNickname(_ new: Set<String>) -> Set<String> {
        self.nicknames = self.nicknames.union(new)
        return self.nicknames
    }
    
    mutating func happyBirthday() -> Int{
        self.age += 1
        print("С Днем Рожденья, \(self.name ?? "Котик")")
        return self.age
    }
}

//var myCat = Cat(name: "Моника", age: 2, nicknames: ["Моня", "Китя", "Красавица"])
//
//myCat.callTheCat(calling: 7, whatFor: "кушать")
//myCat.addTheNickname(["Буся"])
//myCat.callTheCat(calling: 3, whatFor: "домой")
//
//var anotherCat = Cat(name: nil, age: 4, nicknames: [])
//anotherCat.callTheCat(calling: 2, whatFor: "кушать")



// MARK: Осталось
//Обработать перечисление значений через for in для словаря
// Создать массив со своим типом данных и вывести его значения в цикле for in и while


let library = ["Fantasy": ["Harry Potter", "Alice in Wonderland"], "Science": ["Chemistry", "Biology", "Phisics"]]

for element in library {
    for value in element.value {
        print("\(value) is \(element.key)")
    }
}


let arrayOfNumbers = [1, 4, 23, 14]
var arrayOfEvenNumbers: [Int] = []

for element in arrayOfNumbers {
    if element % 2 == 0 {
        arrayOfEvenNumbers = arrayOfEvenNumbers.append(element)
    }
}
