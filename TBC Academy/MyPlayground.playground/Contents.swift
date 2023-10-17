//სადაც კოსმოსია იქ პირატებიო👀, ხოდა მოდით დავბრუნდეთ დროში და პირატების კაპიტნის როლში საგანძურის პოვნის თავაგადასავალში გადავეშვათ 👑🏴‍☠️⛴️. ჩვენ მოგვიწევს ვიმოგზაუროთ Swift-ის ღრმა წყლებში🌊, სადაც ბევრი სირთულე გადაგხვდება თავს და მხოლოდ უძლიერესები💪🏻 გადარჩებიან მზად ხართ? მაშინ დავიწყეთ🎬.
//
//
//
//1. მოდით ჩვენს ხომალდს მივხედოთ SOLID Principle-ბის დაცვით.
//შევქმნათ Class-ი PirateShip⛴️🏴‍☠️, with properties: როგორციაა name, cannonsCount, crew👫 და cargo🍗🍖🥃🍺.
//Methods: firingCannons, adding/removing crew, adding/removing cargo.
//დავიცვათ Single Responsibility ამისათვის - cargo management და adding/removing crew ფუნქციონალი უნდა განვაცალკევოთ.
//შესაბამისად მოდი შევქმნათ 2 Manager class-ი (CargoManager, CrewManager), სადაც გავიტანთ crew-ს და cargo-ს და შესაბამის methods გავიტანთ ამ კლასებში.

//ამის შემდეგ ჩვენს PirateShip-ში გვრჩება properties: name, cannonsCount და 2 მენეჯერი რომელიც ცალ-ცალკე გააკონტროლებს ჩვენი გემის ფუნქციონალს. Methods გვექნება addCargo, removeCargo, listCargo, addCrew, removeCrew, listCrew, cannonCount, fireCannon(count:) და ამ Method-ებში ჩვენი მენეჯერების შესაბამისი მეთოდები გამოვიყენოთ.
//დავიცვათ Open/Closed პრინციპი. ჩვენი მენეჯერები არ უნდა იყოს წვდომადი გარედან და მათი ფუნქციონალის გამოყენება მხოლოდ გემის წევრებს უნდა შეეძლოთ.
//დავიცვათ Liskov Substituion, შევქმნათ PirateShip-ის შვილობილი კლასები Frigate და Galleon. დაამატეთ ფუნქციონალი და ცვლადები თქვენი სურვილის მიხედვით, მაგრამ როცა PirateShip-ს Frigate-ით ან Galleon-ით ამოვცვლით ქცევა არ უნდა შეგვეცვალოს.
//დავიცვათ Interface Segregation. ყველა გემს არ აქვს საშუალება რომ იქონიონ cannon-ები და აწარმოონ ბრძოლა. ამიტომ შევქმნათ protocol Cannons შესაბამისი მეთოდები და დავაიმპლემენტიროთ PirateShip-ში.
//დავიცვათ Dependency Inversion პრინციპი, ამიტომ ჩვენს manager კლასებს გავუკეთოთ პროტოკოლები CargoManaging და CrewManaging სადაც მეთოდებს ავღწერთ რომლებიც აქამდე კლასებში გვქონდა, ხოლო PirateShip-ში CargoManager-ს და CrewManager-ს ჩავანაცვლებთ ამ Protocol-ის ტიპის ცვლადებით, ამითი ჩვენს PirateShips აღარ ეცოდინება სპეციფიური დეტალები თუ როგორ ხდება cargo-ს და crew-ის მენეჯმენტი  მას მხოლოდ აბსტრაქტულად ეცოდინება ის რომ ეს შესაძლებელია. ასევე ამ პრინციპის დაცვით ჩვენ საშუალება გვექნება ნებისმიერ დროს შევცვალოთ Crew და Cargo Management-ის მართვის სისტემა, უბრალოდ ჩავაწვდით ახალ კლასს სხვა იმპლემენტაციით რომელიც ამ პროტოკოლს აიმპლემენტირებს, ამის საშვალებით ჩვენ ნებისმიერ დროს შეგვეძლება PirateShip-ში მარტივი ცვლილებების შეტანა, ისე რომ თვითონ კლასში ცვლილებების გაკეთება არ მოგვიწევს.
// MARK: - -
class PirateShip {
    private let name: String
    private var cannonsCoun: Int
    private let cargoManager = CargoManager(cargo: String)
    private let crewManager = CrewManager(crew: 100)
    
    init(name: String, cannonsCoun: Int) {
        self.name = name
        self.cannonsCoun = cannonsCoun
        
    }
    func firingCannons() {
        
    }
    
    func cannonCount() {
        
    }
    
    func fireCannon(count: Int) {
        
    }
}
    
class CargoManager {
    private let cargo: String
    
    func addCargo() {
        
    }
    
    func removeCargo() {
    }
    
    func listCargo() {
    }
    
    
    init(cargo: String) {
        self.cargo = cargo
    }
}
        

    class CrewManager {
            private var crew: Int
            init(crew: Int) {
                self.crew = crew
            }
            
            
            func addCrew() {
                
            }
            
            func removeCrew() {
                
            }
            
            func listCrew() {
                
            }
        }
        

class Frigate: PirateShip {
    var color: String
    
    init(color: String) {
        self.color = color
        }
    func colorType() {
        
}
            
class Galleon: PirateShip  {
        var GalleonName: String
        
        init(GalleonName: String) {
            self.GalleonName = GalleonName
        }
        
}
            
        
        
        //2.TreasureMap KISS პრინციპის დაცვით.
        //
        //TreasureMap კლასი გვექნება ძალიან მარტივი ორი ფროფერთით: x და y ექნება. ერთი მეთოდი hintToTreasure, რომელიც მიიღებს x და y-ს და თუ ვიპოვეთ ჩვენი საგანძური დაგვიწერს ამას, თუ არასწორად მივუთითებთ კოორდინატებს მაშინ უნდა მოგვცეს hint-ი თუ საით უნდა წავიდეთ რომ მივაგნოთ საგანძურს.
        //
        //
        //
        //3.SeaAdventure YAGNI პრინციპის დაცვით, პირატების მოგზაურობა თავგადასავლის გარეშე ვის გაუგია
        //
        //შევქმნათ მარტივი SeaAdventure class-ი, ერთი String adventureType ფროფერთით და ერთი მეთოდით encounter რომელიც დაგვიბეჭდავს თუ რა adventure-ს წააწყდა ჩვენი ხომალდი. დავიცვათ YAGNI და არ დავამატოთ გავრცობილი ფუნქციონალი რომელიც სხვადასხვა adventure-ს შეიძლება მოიცავდეს, რომელიც ჯერ ჯერობით არ გვჭირდება.
        //
        //
        //
        //4. PirateCode DRY პრინციპის დაცვით.
        //
        //შევქმნათ მარტივი კლასი PirateCode, რომელსაც ექნება ორი მეთოდი parley და mutiny, ამ მეთოდებში უნდა დავიწყოთ განხილვა მოლაპარაკებებზე წავალთ თუ ვიბრძოლებთ ეს კოდი რომ ორივე მეთოდში არ გაგვიმეორდეს დავიცვათ DRY პრინციპი და შევქმნათ ერთი private ფუნქცია discussTerms(term: String), რომელიც შეგვატყობინებს იმას რომ მოლაპარაკებები დაწყებულია, ხოლო parley და mutiny მოლაპარაკების შედეგს დაგვიბეჭდავენ.
        //
        //
        //
        //5. დროა საგანძურის საძებნელად გავეშვათ. (Treasure hunting😄💰)
        //
        //შევქმნათ ჩვენი ხომალდი დავარქვათ სახელი, ეკიპაჟი დავამატოთ, საომრად გავამზადოთ, ავტვირთოთ cargo.
        //
        //შევქმნათ ჩვენი საგანძულის კარტა და გადავაწდოთ კოორდინატები.
        //
        //შევქმნათ პირატის კოდექსი რომელიც მოგზაურობისას დაგვეხმარება.
        //
        //შევქმნათ SeaAdventure რომელსაც ჩვენი ეკიპაჟი შეიძლება გადააწყდეს, ამ შემთხვევაში ეს იქნება FlyingDutchman-თან გადაყრა.
        //
        //
        //
        //პირველ რიგში დავიწყოთ ჩვენი საგანძურის ძებნით შევქმნათ ორი ცვლადი საწყისი კოორდინატები საიდანაც ჩვენი გემი აიღებს გეზს, და treasureMap-ის hintToTreasure მეთოდის გამოყენებით ვეცადოთ ვიპოვოთ ჩვენი საგანძური.
        //
        //
        //
        //საგანძურის პოვნის შემდეგ გადააწყდება adventure-ს, დავბეჭდოთ რა adventure-ა, PirateCode-ს გამოყენებით გადავწყვიტოთ რას იზამს ჩვენი კაპიტანი, ეცდება აარიდოს თავი თავგადასავალს თუ მიხვდება რომ აზრი არ აქვს მოლაპარაკებებს და შეუტევს? არჩევის შემდეგ რის განხილვას მოახდენს თავის ეკიპაჟთან ერთად? როგორ გაიქცეს თუ როგორ შეუტიოს ეფექტურად? გამოიყენებს ის ყველა არსებულ cannon-ს ხომალდზე თუ არა?
        //
        //
        //
        //ამ რთულ გადაწყვეტილების მიღების შემდეგ ჩვენ უკვე ვეღარასდროს ვერ გავიგებთ თუ როგორ დამთავრდა ჩვენი კაპიტნის და მისი ეკიპაჟის ამბავი.😄
        //
        //
        //
        //წარმატებები დეველოპერებო💪🏻🥰
    }
    
