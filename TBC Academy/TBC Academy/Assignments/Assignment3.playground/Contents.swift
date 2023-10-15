//import UIKit
//
//// 1. შექმენით array, შემდეგ პირველ და ბოლო ელემენტს გაუცვალეთ ადგილი, გამზადებული ან უკვე არსებული ფუნქციის გარეშე.  (array-ის ტიპს არაქვს მნიშვნელობა).
////var nums = [1, 2, 3, 4]
////
////let first = nums[0]
////let last = nums[nums.count - 1]
////
////nums[0] = last
////nums[nums.count - 1] = first
//
//// 2. შექმენით array, მასში წაშალეთ ნახევარი ელემენტები, თუ კენტი რაოდენობის იქნა დატოვეთ ნაკლები და წაშალეთ მეტი.  მაგ.: თუ იყო 11 ელემენტი 5 დატოვეთ და 6 წაშალეთ. და დაბეჭდეთ მიღებული შედეგი. (array-ის ტიპს არაქვს მნიშვნელობა).
////var nums = [1, 2, 3, 4, 5, 6]
////// Solution 1
////nums = Array(nums[0 ..< nums.count/2])
////// Solution 2
////var index = 0
////while index < nums.count {
////    nums.remove(at: index)
////    index += 1
////}
//
//// 3. შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.
////var nums: [Int] = []
////for num in 0...10 {
////    nums.append(num)
////}
////
////var oddNums: [Int] = []
////var evenNums: [Int] = []
////
////for num in nums {
////    if num.isMultiple(of: 2) {
////        evenNums.append(num)
////    } else {
////        oddNums.append(num)
////    }
////}
////
////print(oddNums)
////print(evenNums)
//
//// 4. შექმენით Double-ების array, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ array-ში.
////let nums: [Double] = [1.2, 2.3, 1.1, 6.7]
////
////var currentMax = nums[0]
////for num in nums {
////    if num > currentMax {
////        currentMax = num
////    }
////}
////
////print(currentMax)
//
//
//// 5. შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.
//
//// 6. შექმენით String ტიპის ცვლადი და შეამოწმეთ არის თუ არა ყველა ჩარაქტერი ამ სტრინგში უნიკალური. გამოიყენეთ Set-ი ამ თასკის შესასრულებლად.
////let string = "qwertyuiopasdfghjklzxcvbnm"
////let array = Array(string)
////let set = Set(array)
////let areAllCharactersUnique = (array.count == set.count)
//
//// 7. შექმენით ორი Int-ების Set. გამოიყენეთ მათზე Set-ის მეთოდები როგორიცაა: union, intersection და difference. დაბეჭდეთ შედეგები.
//var set1: Set = [1, 2, 3]
//var set2: Set = [2, 4, 6]
//print(set1.union(set2))
//print(set1.intersection(set2))
//print(set1.symmetricDifference(set2))
//
//
//// 8. შექმენით ორი String-ის Set. შეამოწმეთ არის თუ არა პირველი String-ის Set, მეორეს sub-Set-ი. დაბეჭდეთ შედეგი.
////let set1: Set = ["1", "2"]
////let set2: Set = ["3", "2"]
////print(set1.isSubset(of: set2))
//
//// 9. შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)
//let string = "qwertyuiopasdfghjklzxcvbnm"
//let array = Array(string)
//let set = Set(array)
//let areAllCharactersUnique = (array.count == set.count)
//
//if areAllCharactersUnique {
//    print("array-ში ყველა ელემენტი განსხვავებულია")
//} else {
//    print("array შეიცავს მსგავს ელემენტებს")
//}
//
//// 10. შექმენით Dictionary, სადაც იქნება ფილმის სახელები და მათი რეიტინგები, რეიტინგი (0-10). დაამატეთ მინიმუმ 5 ფილმი, ამის შემდეგ გამოთვალეთ ამ Dictionary-ში არსებული ფილმების საშვალო რეიტინგი. დაბეჭდეთ მიღებული შედეგი.
//let d: Dictionary = [
//    "a": 1.1,
//    "b": 1.2,
//    "c": 1.3,
//    "d": 1.4,
//    "e": 1.5,
//]
//
//var sum = 0.0
//for value in d.values {
//    sum += value
//}
//
//let average = sum / Double(d.count)

func gigasName() {
    var g = "giga"
    print (g)
}
print (gigasName)
