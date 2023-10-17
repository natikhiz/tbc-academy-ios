protocol Cannons {
    func cannonCount() -> Int
    func fireCannon(count: Int)
}

protocol CargoManaging {
    func addCargo(_ newCargo: String)
    func removeCargo(_ cargo: String)
    func listCargo()
}

protocol CrewManaging {
    func addPirate(_ pirate: Pirate)
    func removePirate(_ pirate: Pirate)
    func listCrew()
}

struct Pirate {
    let name: String
}

class PirateShip: Cannons {
    var name: String
    private var cannonsCount: Int
    private let cargoManager: CargoManaging
    private let crewManager: CrewManaging
    
    init(
        name: String,
        cannonsCount: Int,
        cargoManager: CargoManaging,
        crewManaging: CrewManaging
    ) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.cargoManager = CargoManager(cargo: [])
        self.crewManager = CrewManager(crew: 0)
    }
    
    private func addCargo(_ newCargo: String) {
        cargoManager.addCargo(newCargo)
    }
    
    private func removeCargo(_ cargo: String) {
        cargoManager.removeCargo(cargo)
    }
    
    private func listCargo() {
        cargoManager.listCargo()
    }
    
    private func addPirate(_ pirate: Pirate) {
        crewManager.addPirate(pirate)
    }
    
    private func removeCrew(_ pirate: Pirate) {
        crewManager.removePirate(pirate)
    }
    
    private func listCrew() {
        crewManager.listCrew()
    }
    
    func cannonCount() -> Int {
        return cannonsCount
    }
    
    func fireCannon(count: Int) {
        if cannonsCount >= count {
            cannonsCount -= count
            print("PirateShip did fire \(count) cannons")            
        }
    }
    
    func displayShipDetails() {
        print("Ship Name: \(name)")
        print("Cannons Count: \(cannonsCount)")
        crewManager.listCrew()
        cargoManager.listCargo()
    }
}

class CargoManager: CargoManaging {
    private var cargo: [String]
    
    init(cargo: [String]) {
        self.cargo = cargo
    }
    
    func addCargo(_ newCargo: String) {
        cargo.append(newCargo)
    }

    func removeCargo(_ cargo: String) {
        self.cargo.removeAll(where: { $0 == cargo })
    }
    
    func listCargo() {
        print("Cargo: ")
        for c in cargo {
            print(c, terminator: "")
        }
    }
}

class CrewManager: CrewManaging {
    private var crew: [Pirate]
    
    init(crew: [Pirate]) {
        self.crew = crew
    }
    
    func addPirate(_ pirate: Pirate) {
        crew.append(pirate)
    }

    func removePirate(_ pirate: Pirate) {
        crew.removeAll(where: { $0.name == pirate.name })
    }
    
    func listCrew() {
        print("Crew")
        for c in crew {
            print(c.name)
        }
    }
}

class Frigate: PirateShip {
    func performSuperMove() {
        print("Pirate ship \(name) did perform super move")
    }
}

class Galleon: PirateShip {
    
}



