import UIKit

// 1. შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით.
// დაწერეთ function რომელიც იღებს ამ ენამის ტიპს.
// function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების.

enum DayOfWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func printWeekendOrNot(_ day: DayOfWeek) {
    if isWeekend(day) {
        print("This is weekend")
    } else {
        print("This is weekday")
    }
}

func isWeekend(_ day: DayOfWeek) -> Bool {
    switch day {
    case .saturday, .sunday:
        return true
    default:
        return false
    }
}


// 2. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy.
// ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით.
// დაწერეთ function რომელიც მიიღებს ამ enum-ს,
// და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

typealias Celsius = Double

enum Weather {
    case sunny(Celsius)
    case cloudy(Celsius)
    case rainy(Celsius)
    case snowy(Celsius)
}

func whatShouldIWear(in weather: Weather) -> String {
    switch weather {
    case .sunny(let celsius):
        if celsius < 30 {
            return "მაისური"
        } else {
            return "ტოპი"
        }
    case .cloudy(let celsius):
        if celsius < 20 {
            return "დიდი ჰუდი"
        } else {
            return "ჰუდი"
        }
    case .rainy(let celsius):
        if celsius < 15 {
            return "თბილი საწვიმარი"
        } else {
            return "საწვიმარი"
        }

    case .snowy(let celsius):
        if celsius < 10 {
            return "თბილი ქურთუკი"
        } else {
            return "ქურთუკი"
        }
    }
}

// 3. შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear.
// ამის შემდეგ შექმენით array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით.
// დაწერეთ function რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც გამოშვებულია ამ წლის შემდეგ.
// დავ-print-ოთ ეს წიგნები.

struct Book {
    let title: String
    let author: String
    let publicationYear: Int
}

let frankenstein = Book.init(title: "Frankenstein", author: "Mary Shelley", publicationYear: 1818)
let beloved = Book(title: "Beloved", author: "Toni Morrison", publicationYear: 1987)
let greatGatsby = Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", publicationYear: 1925)

let books = [frankenstein, beloved, greatGatsby]

func getPublishedBooksAfter(year: Int, books: [Book]) -> [Book] {
    return books.filter({ $0.publicationYear > year })
}

print(getPublishedBooksAfter(year: 1924, books: books))


// 4. შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance.
// ამ ობიექტში დაამატეთ methods, დეპოზიტისა და გატანის (withdraw)
// დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა ეჯ-ქეისები (edge case).
// მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ.
// print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები.
// ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.

struct BankAccount {
    let holderName: String
    let accountNumber: Int
    var balance: Double

    mutating func deposit(_ amount: Double) {
        balance += amount
        print("Deposit was successful. \(amount) is added to balance, which is \(balance) now")
    }

    mutating func withdraw(_ amount: Double) {
        if amount > balance {
            print("withdraw amount is larger then the current balance")
        } else {
            balance -= amount
            print("Withdraw was successful. \(amount) is withdrawn from balance, which is \(balance) now")
        }
    }
}

var bankAccount = BankAccount(holderName: "Natia", accountNumber: 1235632, balance: 123.4)
bankAccount.deposit(5)
bankAccount.withdraw(10)
bankAccount.withdraw(200)
bankAccount.deposit(100)
bankAccount.withdraw(200)

print(bankAccount.balance)

// 5. შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით.
// ამის შემდეგ შექმენით struct Song, with properties: title, artist, duration, genre, description (computied propertie უნდა იყოს description) და publisher (lazy propertie-ად შექმენით publisher).
// შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ (ზოგ song-ს ჰქონდეს publisher, ზოგს არა).
// შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს, function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.

enum Genre {
    case pop
    case house
    case rock
}

struct Song {
    let title: String
    let artist: String
    let duration: Double
    let genre: Genre
    
    var description: String {
        "Title: \(title), artist: \(artist), genre: \(genre)"
    }

    lazy var publisher: String? = nil
}

let playlist = [
    Song(title: "Finally", artist: "Kings of Tomorrow", duration: 2.89, genre: .house),
    Song(title: "Dance the night", artist: "Dua Lipa", duration: 3.16, genre: .pop),
    Song(title: "French Kiss", artist: "Lil Louis", duration: 2.23, genre: .house),
    Song(title: "Sympathy for the devil", artist: "The Rolling Stones", duration: 4.76, genre: .rock),
    Song(title: "Karma", artist: "Taylor Swift", duration: 4.11, genre: .pop),
]

func filterPlaylistByGenre(playlist songs: [Song], genre: Genre) -> [Song] {
    songs.filter({ $0.genre == genre })
}

print(filterPlaylistByGenre(playlist: playlist, genre: .pop))
