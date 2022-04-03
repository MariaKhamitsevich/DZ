import UIKit

/*Задания 1, 2, 3, 4, 5.
 1.Посравнивать разные типы данных
 2.Int, Double: >, <, >=, <=
 3.Реализовать if/else
 4.&&, ||, !
 5. !
 */

//Создадим переменные типа String и сравним их между собой
let numberInString1 = "1"
let numberInString2 = "12"

//Это выражение true
numberInString1 < numberInString2


let onlyCharactersInString1 = "ab"
let onlyCharactersInString2 = "abc"
let onlyCharactersInString3 = "def"

//Все эти выражения тоже работают, т.е. сравнивается количество символов, а не их "качество"
onlyCharactersInString2 > onlyCharactersInString1
onlyCharactersInString1 < onlyCharactersInString3
numberInString1 < onlyCharactersInString1
onlyCharactersInString1 == onlyCharactersInString2

/*Cоздадим переменные типа Int
 Они сравниваются со String только после приведения типов, если есть такая возможность */

let number1 = 12
let number2 = 20
let castNumberInString2: Int? = Int(numberInString2)

//Var1
if castNumberInString2 != nil {
    let expression1: Bool = (number2) >= (castNumberInString2)!
    print("Expression exist and expression is \(expression1)")
} else {
    print("Expression is not exist")
}

//Var2
if castNumberInString2 != nil && ((number1) > (castNumberInString2)!) {
    print("Expretion is bigger")
} else if castNumberInString2 != nil && ((number1) < (castNumberInString2)!) {
    print("Expretion is smaller")
} else if castNumberInString2 != nil && ((number1) == (castNumberInString2)!) {
    print("Expretions are equal")
} else {
    print("Expretions can't be compare")
}

//Тип Int можно привести к типу Double без потреи точности, тип Double приводится к Int с отбрасыванием знаков, поэтому лучше привести Int  к Double

let numberInDouble = 20.1

Double(number2) > numberInDouble
Double(number1) < numberInDouble
number2 == Int(numberInDouble)  //Знаки отбросились и выражение стало true, хотя изначально 20 не равно 20.1


//Выражение для проверки работоспособности
let age = 17
let ageOfMajority = 18
let ageRetirementForMen = 63
let ageRetirementForWomen = 61
let isMan = true

if age < 0 {
    print("It's look like you are trying to fool someone")
} else if age >= ageOfMajority && ((isMan && age <= ageRetirementForMen) || (!isMan && age <= ageRetirementForWomen)) {
    print("You must work!")
} else if age <= ageOfMajority {
    print("You should grow up")
} else {
    print("You can get some rest")
}


//Задание 6. Switch

//String
var arrayOfMetalsForCheck: Array = ["Sodium", "Iron", "Cupper"]
let metal = arrayOfMetalsForCheck[0]

switch metal {
case "Sodium":
    print("Metal can react with water")
    fallthrough
case "Iron":
    print("Metal can react with acids")
case "Cupper":
    print("This metal is inactive")
default:
    print("You should choose some metal from list, check your input")
}


//Int
let points = 2

switch points {
case 0:
    print("You can start game")
case 0...10:
    print("You can take more cards")
case 11...20:
    print("You should be careful")
case 21:
    print("You won!")
default:
    print("Something is wrong. Please check your points")
}


//Bool. Для буливых значений можно не использовать default, так как все варианты исчерпываются двумя кейсами
let isWeekend = true

switch isWeekend {
case false:
    print("Go to work")
case true:
    print("You may stay home")
}

//Задание 7. Функции

func printingGreetings() {
    print("Hello!")
}

func printingGreetingsForPerson(myNameIs name: String) {
    print("Hello \(name)!")
}

printingGreetingsForPerson(myNameIs: "Masha")

func calculationOfNumbers(_ numberInFunc1: Double, _ numberInFunc2: Double, do operation: String) -> Double {
    var result = 0.0
    switch operation {
    case "addition", "Addition", "+":
        result = numberInFunc1 + numberInFunc2
    case "subtraction", "Subtraction" , "-":
        result = numberInFunc1 - numberInFunc2
    case "division" where (numberInFunc2 != 0), "Division" where (numberInFunc2 != 0), "/" where (numberInFunc2 != 0):
        result = numberInFunc1 / numberInFunc2
    case "division" where (numberInFunc2 == 0), "Division" where (numberInFunc2 == 0), "/" where (numberInFunc2 == 0):
        print("Can't devide by zero. Please fix your second argument.")
    case "multiplication", "Multiplication", "*":
        result = numberInFunc1 * numberInFunc2
    default:
        print("Check what you want to do. Your result remains zero.")
        break
    }
    return result
}

let sum1 = calculationOfNumbers(2, 3, do: "addition")
let division1 = calculationOfNumbers(2, 3, do: "Division")
let division2 = calculationOfNumbers(2, 0, do: "/")
let error = calculationOfNumbers(1, 1, do: "Something")


