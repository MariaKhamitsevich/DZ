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
    
    mutating func callTheCat(calling number: Int, whatFor: String) -> Void {
        if number <= 0 {
         return
        }
        self.nicknames.insert(self.name ?? "Котик")
        var numberIterations = 0
        
        for i in self.nicknames {
            numberIterations += 1
            print("\(i) приходи \(whatFor)!")
            
            if numberIterations >= number {
                break
            }
            return
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


// Класс Библиотека
class Library {
    var libraryByGentre: [String : [String]] = ["": ["No books"]]
    
    init(libraryByGentre: [String: [String]]) {
        self.libraryByGentre = libraryByGentre
    }
        
        func inventory() {
            for element in libraryByGentre {
                for value in element.value {
                    print("\(value) is \(element.key)")
                }
        }
    }
    
}

let library = Library(libraryByGentre: ["Fantasy": ["Harry Potter", "Alice in Wonderland"], "Science": ["Chemistry", "Biology", "Phisics"]])
library.inventory()


// Структура массива, которая позволяет отсортировать элементы по четности
struct ArrayOfInteger {
    var arrayOfNumbers: [Int]
    var arrayOfEvenNumbers: [Int] = []
    var arrayOfUnevenNumbers: [Int] = []
    
    init(arrayOfNumbers: [Int]) {
        self.arrayOfNumbers = arrayOfNumbers
    }
    
    mutating func chooseEven() {
        for element in arrayOfNumbers {
            if element % 2 == 0 {
                arrayOfEvenNumbers.append(element)
            }
        }
        print(arrayOfEvenNumbers)
        // Обнуляем массив, чтобы при повторном вызове функции у нас не повторялись значения (но можно было создать сет вместо массива)
        arrayOfEvenNumbers = []
    }
    
    mutating func chooseUneven() {
        var counter = 0
        
        while counter < arrayOfNumbers.count {
            if arrayOfNumbers[counter] % 2 != 0 {
                arrayOfUnevenNumbers.append(arrayOfNumbers[counter])
            }
            counter += 1
        }
        
        print(arrayOfUnevenNumbers)
        arrayOfUnevenNumbers = []
    }
    
    mutating func addTheElement(_ add: Int) {
        self.arrayOfNumbers.append(add)
    }
}

var arr1 = ArrayOfInteger(arrayOfNumbers: [1, 4, 7])
arr1.chooseEven()
arr1.chooseUneven()
arr1.addTheElement(12)
arr1.chooseEven()
