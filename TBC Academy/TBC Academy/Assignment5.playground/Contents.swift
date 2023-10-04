
// შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს.
// function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს,
// ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120,
// რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.

func factorial(number: Int) -> Int {
    var result = 1
    for n in 1...number {
        result *= n
    }
    return result
}


// შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს.
// არ გამოიყენოთ მზა ფუნქციები.
/// Fibonacci: [0, 1, 1, 2, 3, |5, 8,| 13, 21, 34...]
func makeFibonacciNumbers(count: Int = 20) -> [Int] {
    var nums: [Int] = []
    
    var beforeBefore = 0
    nums.append(beforeBefore)

    var before = 1
    nums.append(before)

    for _ in 3...count {
        let new = beforeBefore + before

        nums.append(new)

        beforeBefore = before
        before = new
    }

    return nums
}

// შექმენით function რომელიც მიიღებს String-ს,
// function-მა უნდა შეამოწმოს პალინდრომია
// (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი.
// მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true.
// არ გამოიყენოთ მზა ფუნქციები.
// შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.
func isPalindrome(_ word: String) -> Bool {
    var word = word
    while word.count > 1 {
        if word.first == word.last {
            word.removeFirst()
            word.removeLast()
        } else {
            return false
        }
    }

    return true
}

func isPalindrome2(_ word: String) -> Bool {
    let reversedWord = String(word.reversed())

    return reversedWord == word
}
/// racercar -
///  acercar - r
///   cercar - racecar

func reversedString(_ word: String) -> String {
    var result = ""
    for character in word {
        result = String(character) + result
    }
    return result
}

func isPalindrome3(_ word: String) -> Bool {
    return word == reversedString(word)
}

// შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს,
// დაპრინტავს და დააბრუნებს მნიშვნელობას.
func solveProblem4() {
    /// ვერ მივხვდი array-ს აკვადრატება რას ნიშნავს
}

// შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში,
// ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში.
// uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]
func solveProblem5() {

}

// შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.
func solveProblem6() {

}

// შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.
func solveProblem7() {

}

// შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.
func solveProblem8() {

}

// გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.
func solveProblem9() {

}

// function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.
func solveProblem10() {

}

