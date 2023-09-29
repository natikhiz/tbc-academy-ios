import Foundation

// 1. შექმენით ორი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ჯამი.
//let number1 = 2
//let number2 = 3
//
// sum = (number1 + number2)
//print(sum)



// 2. შექმენით Int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა, და შეამოწმეთ არის თუ არა ეს რიცხვი 10-ზე მეტი და 20-ზე ნაკლები ან ტოლი, 20-ზე მეტი და 50-ზე ნაკლები ან ტოლი, 50-ზე მეტი და 100-ზე ნაკლები ან ტოლი, 100-ზე მეტი და შედეგი დაბეჭდეთ.

//let number = 1
//if number > 10 && number <= 20 {
//    print("ეს რიცხვი 10-ზე მეტია და 20-ზე ნაკლები ან ტოლი")
//}
//if number > 20 && number <= 50 {
//    print("20-ზე მეტი და 50-ზე ნაკლები ან ტოლი")
//}
//if number > 50 && number <= 100 {
//    print("50-ზე მეტი და 100-ზე ნაკლები ან ტოლი")
//}
//if number > 100 {
//    print("100-ზე მეტი")
//}
// 3. for-in ციკლის გამოყენებით, დაბეჭდეთ რიცხვები 1-იდან 20-ამდე. რიცხვები ეწეროს ერთ ხაზზე, გამოყოფილი იყოს სფეისებით. შედეგი: 1 2 3 4...
//for range in 1..<20 {
//    print(range, terminator: " ")
//}


// 4. while ციკლის გამოყენებით, 1-იდან 100-ამდე დაბეჭდეთ ყველა კენტი რიცხვის ჯამი.
//var currentOddNumber = 1 // 1 is first odd number
//var sum = currentOddNumber
//
//while currentOddNumber < 100 {
//    sum += currentOddNumber
//    currentOddNumber += 2
//}
//
//print(sum)

// 5. შექმენით String ტიპის ცვლადი, და ციკლის გამოყენებით დაარევერსეთ ეს ცვლადი, მაგ: თუ გვაქვს TBC Academy უნდა მივიღოთ ymedacA CBT.
//let string = "TBC Academy"
//var reversedString = ""
//
//for character in string {
//    reversedString = "\(character)\(reversedString)"
//}
//
//print(reversedString)

// 6. დაბეჭდეთ ყველა ორნიშნა რიცხვი რომელიც ერთნაირი ციფრებით არის შედგენილი.

//// Solution #1
//for number in 10...99 {
//    let firstDigit = number / 10
//    let secondDigit = number % 10
//
//    if firstDigit == secondDigit {
//        print(number)
//    }
//}

//// Solution #2
//for number in 1...9 {
//    print("\(number)\(number)")
//}

//// Solution #3
//for number in 1...9 {
//    // 11 = 1 * 11
//    // 22 = 2 * 11
//    // 33 = 3 * 11
//    // 44 = 40 + 4 = 4*10 + 4 = 4 * (10 + 1) = 4 * 11
//    // 88 = 80 + 8 = 8*10 + 8 = 8 * (10 + 1) = 8 * 11
//    let twoDigitNumber = number * 11
//    print(twoDigitNumber)
//}


// 7. გაქვს 9 ნიშნა რიცხვი და დაბეჭდე შებრუნებული რიცხვი.
//// Solution #1
//let number = 123456789
//let stringNumber = String(number)
//
//var reversedString = ""
//
//for character in stringNumber {
//    reversedString = "\(character)\(reversedString)"
//}
//
//let reversedNumber = Int(reversedString)!
//print(reversedNumber)

// 123 -> 321      [21]

// 123 -> 0
// 12 -> 3
// 1 -> 3*10 + 2
// 1 -> 32
// -> 32 * 10 + 1
// -> 321

// reverse
// print(reversedNumber) // -> 987654321
// 685 -> 6859
// 685 * 10 = 6850 + 9 = 6859

//// Solution #2
//var number = 123456789
//var reversedNumber = 0
//
//while number > 0 {
//    let lastDigit = number % 10
//    reversedNumber = reversedNumber * 10 + lastDigit
//    number = number / 10
//}
//
//print(reversedNumber)

// 8. შექმენით bool-ეან ცვლადი, მაგალითად: isNumberFound და while loop-ის გამოყენებით იპოვეთ პირველი რიცხვი რომელიც იყოფა 5-ზეც და 9-ზეც ერთდროულად. 1-იდან დაიწყეთ ათვლა.
//var isNumberFound = false
//var number = 0
//
//while !isNumberFound {
//    number += 1
//
//    if number.isMultiple(of: 5), number.isMultiple(of: 9) {
//        isNumberFound = true
//    }
//}
//
//print(number)

// 9. შექმენი String ცვლადი მაგალითად month, რომელსაც მიანიჭებ თვის მნიშვნელობას, მაგალითად: "march" და switch statement-ის გამოყენებით დაბეჭდეთ წელიწადის რა დროა.
//let month = "August"

//// Solution by if/else
//if month == "December" || month == "January" || month == "February" {
//    print("Winter")
//} else if month == "March" || month == "April" || month == "May" {
//    print("Spring")
//} else if month == "June" || month == "July" || month == "August" {
//    print("Summer")
//} else if month == "September" || month == "October" || month == "November"{
//    print("Autumn")
//}

// Solution by switch
//switch month {
//case "December", "January", "February":
//    print("Winter")
//case "March", "April", "May":
//    print("Spring")
//case "June", "July", "August":
//    print("Summer")
//case "September", "October", "November":
//    print("Autumn")
//default:
//    print("Error")
//}

// 10. while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."
//

//var step = 0
//
//while true {
//
//    switch step % 3 {
//    case 0:
//        print("🔴")
//    case 1:
//        print("🌕")
//    case 2:
//        print("🟢")
//    default:
//        print("Error")
//    }
//
//    step += 1
//}

//


