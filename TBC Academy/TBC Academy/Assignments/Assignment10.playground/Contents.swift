// 1-ControlCenter-ი.
// With properties: isLockedDown: Bool და securityCode: String, რომელშიც იქნება რაღაც პაროლი შენახული.

// Method lockdown, რომელიც მიიღებს პაროლს, ჩვენ დავადარებთ ამ პაროლს securityCode-ს და თუ დაემთხვა გავაკეთებთ lockdown-ს.

// Method-ი რომელიც დაგვიბეჭდავს ინფორმაციას lockdown-ის ქვეშ ხომ არაა ჩვენი ControlCenter-ი.

class ControlCenter: StationModule {
    private var isLockedDown = false
    private let securityCode: String
    
    init(securityCode: String) {
        self.securityCode = securityCode
        
        super.init(moduleName: "Control Center")
    }
    
    func lockdown(securityCode: String) {
        if securityCode == self.securityCode {
            isLockedDown = true
        }
    }
    
    func printIsLockDown() {
        if isLockedDown {
            print("aris lockdowns") }
        else {
            print("ar aris lockdown") }
        }
    }


// 2-ResearchLab-ი.
// With properties: String Array - ნიმუშების შესანახად.
// Method რომელიც მოიპოვებს(დაამატებს) ნიმუშებს ჩვენს Array-ში.

class ResearchLab: StationModule {
    private var samples: [String] = []
    
    init() {
        super.init(moduleName: "Research Lab")
    }
    
    func addSample(_ sample: String) {
        samples.append(sample)
    }
}


// 3-LifeSupportSystem-ა.
// With properties: oxygenLevel: Int, რომელიც გააკონტროლებს ჟანგბადის დონეს.
// Method რომელიც გვეტყვის ჟანგბადის სტატუსზე.

class LifeSupportSystem: StationModule {
    private var oxygenLevel: Int
    
    init(oxygenLevel: Int) {
        self.oxygenLevel = oxygenLevel
       
        super.init(moduleName: "Life Support System")
    }
    
    func getOxygenLevel() -> Int {
        return oxygenLevel
    }
}


// 4-StationModule-ი
// With properties: moduleName: String და drone: Drone? (optional).
// Method რომელიც დრონს მისცემს თასქს.

class StationModule {
    var moduleName: String
    var drone: Drone?
    
    init(moduleName: String, drone: Drone? = nil) {
        self.moduleName = moduleName
        self.drone = drone
    }
    
    func giveTaskToDrone(task: String) {
        drone?.task = task
    }
}
    
// 5-ჩვენი ControlCenter-ი ResearchLab-ი და LifeSupportSystem-ა გავხადოთ StationModule-ის subClass.
// +

// 6-Drone.
// With properties: 
// task: String? (optional),
// unowned var assignedModule: StationModule,
// weak var missionControlLink: MissionControl? (optional).
// Method რომელიც შეამოწმებს აქვს თუ არა დრონს თასქი და თუ აქვს დაგვიბჭდავს რა სამუშაოს ასრულებს ის.

class Drone {
    private var task: String?
    private var assignedModule: StationModule
    private var missionControlLink: MissionControl?
    
    init(task: String? = nil, assignedModule: StationModule, missionControlLink: MissionControl? = nil) {
        self.task = task
        self.assignedModule = assignedModule
        self.missionControlLink = missionControlLink
    }
    
    func assignTask(_ task: String) {
        self.task = task
    }
    
    func checkWork() {
        if let task = task { // if let task
            print("I am working on \(task)")
        } else {
            print("I do not have active task")
        }
    }
}

// 7. OrbitronSpaceStation-ი შევქმნათ, შიგნით ავაწყოთ ჩვენი მოდულები ControlCenter-ი, ResearchLab-ი და LifeSupportSystem-ა.
// ასევე ამ მოდულებისთვის გავაკეთოთ თითო დრონი და მივაწოდოთ ამ მოდულებს რათა მათ გამოყენება შეძლონ.
// ასევე ჩვენს OrbitronSpaceStation-ს შევუქმნათ ფუნქციონალი lockdown-ის რომელიც საჭიროების შემთხვევაში controlCenter-ს დალოქავს.

class OrbitronSpaceStation {
    let controlCenter: ControlCenter
    let researchLab: ResearchLab
    let lifeSupportSystem: LifeSupportSystem
    
    let securityCode = "123456789"
    
    init() {
        self.controlCenter = ControlCenter(securityCode: securityCode)
        self.controlCenter.drone = Drone(assignedModule: controlCenter)
        
        self.researchLab = ResearchLab()
        self.researchLab.drone = Drone(assignedModule: researchLab)
        
        self.lifeSupportSystem = LifeSupportSystem(oxygenLevel: 23)
        self.lifeSupportSystem.drone = Drone(assignedModule: lifeSupportSystem)
    }
    
    func lockdown() {
        controlCenter.lockdown(securityCode: securityCode)
    }
}


// 8-MissionControl.
// With properties: spaceStation: OrbitronSpaceStation? (optional).
// Method რომ დაუკავშირდეს OrbitronSpaceStation-ს და დაამყაროს მასთან კავშირი.
// Method requestControlCenterStatus-ი.
// Method requestOxygenStatus-ი.
// Method requestDroneStatus რომელიც გაარკვევს რას აკეთებს კონკრეტული მოდულის დრონი.

class MissionControl {
    var spaceStation: OrbitronSpaceStation?
    
    func linkToSpaceStation(_ spaceStation: OrbitronSpaceStation) {
        self.spaceStation = spaceStation
    }
    
    func requestControlCenterStatus() -> Bool {
        return spaceStation?.controlCenter.isLockedDown
    }
    
    func requestOxygenStatus() -> Int {
        return spaceStation?.lifeSupportSystem.getOxygenLevel()
    }
    
    func requestDroneStatus() {
        // გაარკვევს რას ნიშნავს ვერ მივხვდი, კონკრეტულ მოდულზეც ასევე
        // უნდა დააბრუნოს რამე? უნდა დაბეჭდოს? მასივი?
    }
}
        
        

// 9-და ბოლოს
// შევქმნათ OrbitronSpaceStation,
// შევქმნათ MissionControl-ი,
// missionControl-ი დავაკავშიროთ OrbitronSpaceStation სისტემასთან,
// როცა კავშირი შედგება missionControl-ით მოვითხოვოთ controlCenter-ის status-ი.
// controlCenter-ის, researchLab-ის და lifeSupport-ის მოდულების დრონებს დავურიგოთ თასქები.
// შევამოწმოთ დრონების სტატუსები.
// შევამოწმოთ ჟანგბადის რაოდენობა.
// შევამოწმოთ ლოქდაუნის ფუნქციონალი და შევამოწმოთ დაილოქა თუ არა ხომალდი სწორი პაროლი შევიყვანეთ თუ არა.

let orbitronSpaceStation = OrbitronSpaceStation()
let missionControl = MissionControl()
missionControl.linkToSpaceStation(orbitronSpaceStation)
missionControl.requestControlCenterStatus()

orbitronSpaceStation.controlCenter.giveTaskToDrone(task: "First Task")
orbitronSpaceStation.researchLab.giveTaskToDrone(task: "Second Task")
orbitronSpaceStation.lifeSupportSystem.giveTaskToDrone(task: "Third Task")

missionControl.requestDroneStatus()
missionControl.requestOxygenStatus()
missionControl.requestControlCenterStatus()

// 10- გამოიყენეთ access levels სადაც საჭიროა (ცვლადებთან და მეთოდებთან).
// +
