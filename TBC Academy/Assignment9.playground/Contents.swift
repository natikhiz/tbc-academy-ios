



// სუპერ გმირების შერკინება😏💪🏻😱
//
// 1. შევქმნათ Class-ი SuperEnemy with properties: String name, Int hitPoints (ანუ სიცოცხლის რაოდენობა).
//    სურვილისამებრ დაამატებ properties რომელიც მას აღწერს.

class SuperEnemy {
    let name: String
    var hitPoints: Int

    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
}

// 2. შევქმნათ Superhero Protocol-ი.
//    შემდეგი get only properties: String name, String alias, Bool isEvil
//    და დიქშენარი (dictionary) superPowers [String: Int], სადაც String-ი არის სახელი და Int არის დაზიანება (damage).
protocol Superhero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    /// სახელი: დაზიანება
    var superPowers: [String: Int] { get }

    // Method attack, რომელიც მიიღებს target SuperEnemy-ის და დააბრუნებს (return) Int-ს ანუ დარჩენილ სიცოცხლე.
    func attack(to target: SuperEnemy) -> Int
    // Method performSuperPower, რომელიც მიიღებს SuperEnemy-ის და დააბრუნებს (return) Int-ს, აქაც დარჩენილ სიცოცხლე.
    mutating func performSuperPower(to target: SuperEnemy) -> Int
}

// 3. Superhero-ს extension-ი გავაკეთოთ სადაც შევქმნით method-ს
//    რომელიც დაგვი-print-ავს ინფორმაციას სუპერ გმირზე და მის დარჩენილ superPower-ებზე.
extension Superhero {
    func printInfo() {
        print(
        """
        SuperHero Details:
            name: \(name)
            alias: \(alias)
            isEvil: \(isEvil)
            superPowers: \(superPowers)

        """
        )
    }
}

// 4. შევქმნათ რამოდენიმე სუპერგმირი Struct-ი რომელიც ჩვენს Superhero protocol-ს დააიმპლემენტირებს
struct Batman: Superhero {
    var name: String
    
    var alias: String
    
    var isEvil: Bool
    
    var superPowers: [String: Int]

    // attack მეთოდში -> 20-იდან 40-ამდე დავაგენერიროთ Int-ის რიცხვი და ეს დაგენერებული
    // damage დავაკლოთ SuperEnemy-ს სიცოცხლეს და დარჩენილი სიცოცხლე დავაბრუნოთ(return).
    func attack(to target: SuperEnemy) -> Int {
        let damage = Int.random(in: 20..<40)
        target.hitPoints -= damage
        print("\(name) attacked \(target.name) by damage of \(damage)")
        return target.hitPoints
    }
 
    // performSuperPower-ს შემთხვევაში -> დიქშენერიდან ერთ superPower-ს ვიღებთ და ვაკლებთ enemy-ს (სიცოცხლეს ვაკლებთ).
    // ვშლით ამ დიქშენერიდან გამოყენებულ superPower-ს.
    // გამოყენებული superPower-ი უნდა იყოს დარანდომებული.
    // დარჩენილ enemy-ს სიცოცხლეს ვაბრუნებთ (return).
    mutating func performSuperPower(to target: SuperEnemy) -> Int {
        let superPower = superPowers.randomElement()!

        let damage = superPower.value

        target.hitPoints -= damage

        superPowers.removeValue(forKey: superPower.key)

        print("\(name) performed SuperPower \(superPower.key) to \(target.name) by damage of \(damage)")

        return target.hitPoints
    }
}
// 5. შევქმნათ class SuperheroSquad, რომელიც ჯენერიკ Superhero-s მიიღებს. მაგ: class SuperheroSquad<T: Superhero>.
//    შევქმნათ array სუპერგმირების var superheroes: [T].
//    შევქმნათ init-ი.
//    შევქმნათ method რომელიც ჩამოგვითვლის სქვადში არსებულ სუპერგმირებს.
class SuperheroSquad {
    var superheroes: [Superhero]

    init(superheroes: [Superhero]) {
        self.superheroes = superheroes
    }

    func printMembersInfo() {
        for superhero in superheroes {
            superhero.printInfo()
        }
    }
}
// 6.ამ ყველაფრის მერე მოვაწყოთ ერთი ბრძოლა. 🤺🤜🏻🤛🏻
// შევქმნათ method simulateShowdown. ეს method იღებს სუპერგმირების სქვადს და იღებს SuperEnemy-ს.
// სანამ ჩვენი super enemy არ მოკვდება, ან კიდევ სანამ ჩვენ სუპერგმირებს არ დაუმთავრდებათ სუპერ შესაძლებლობები გავმართოთ ბრძოლა.
// ჩვენმა სუპერ გმირებმა რანდომად შეასრულონ superPowers, ყოველი შესრულებული superPowers-ი იშლება ამ გმირის ლისტიდან. თუ გმირს დაუმთავრდა superPowers, მას აქვს ბოლო 1 ჩვეულებრივი attack-ის განხორციელება (ამ attack განხორიციელება მხოლოდ ერთხელ შეუძლია როცა superPowers უმთავრდება).
// ბოლოს შედეგი დავბეჭდოთ, მოიგეს სუპერ გმირება თუ enemy-მ,
// ასევე კარგი იქნება თუ ორთაბრძოლის მიმდინარეობასაც დავბეჭდავთ და გამოვიყენებთ extension-ის მეთოდს.

func simulateShowdown(superheroSquad: SuperheroSquad, superEnemy: SuperEnemy) {
    while superEnemy.hitPoints > 0, !superheroSquad.superheroes.isEmpty {
        print("\nNext Round: SuperEnemy has remaining hitPoints \(superEnemy.hitPoints)")
        let superheroIndex = superheroSquad.superheroes.indices.randomElement()!

        superheroSquad.superheroes[superheroIndex].performSuperPower(to: superEnemy)
        if superheroSquad.superheroes[superheroIndex].superPowers.isEmpty {
            print("\(superheroSquad.superheroes[superheroIndex].name) has no more superpowers")
            superheroSquad.superheroes[superheroIndex].attack(to: superEnemy)
            superheroSquad.superheroes.remove(at: superheroIndex)
        }
    }

    print()

    if superEnemy.hitPoints > 0 {
        print("Super enemy has survived with remaining hitPoints of \(superEnemy.hitPoints).")
    } else {
        print("SuperEnemy is dead! SuperheroSquad Won the battle!")
    }
}

let youngBatman = Batman(
    name: "Young Batman",
    alias: "Batman",
    isEvil: false,
    superPowers: [
        "ქვის სროლა": 23,
        "მანქანის დაჯახება": 49,
    ]
)

let batman = Batman(
    name: "Just Batman",
    alias: "Young Batman",
    isEvil: false,
    superPowers: [
        "მუშტის დარტყმა": 24,
        "ფეხის ამორტყმა": 19,
        "ჯეფი-ქროსი": 41,
        "აბერკოტი": 42,
    ]
)

let oldBatman = Batman(
    name: "Old Batman",
    alias: "Just Batman",
    isEvil: false,
    superPowers: [
        "ხელის ჯოხის ჩარტყმა": 57,
        "პროტეზის სროლა": 99,
    ]
)

let superEnemy = SuperEnemy(name: "Gudiani Kaci", hitPoints: 189)
let superheroSquad = SuperheroSquad(superheroes: [youngBatman, batman, oldBatman])

simulateShowdown(superheroSquad: superheroSquad, superEnemy: superEnemy)

