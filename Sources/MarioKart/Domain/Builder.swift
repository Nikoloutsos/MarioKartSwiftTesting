import Foundation

final class BuilderManager {
    private var selectedCharacter: AnyCharacter?
    private var selectedWheel: AnyWheel?
    private var selectedParachute: AnyParachute?
    
    func selectCharacter(_ character: AnyCharacter) {
        self.selectedCharacter = character
    }
    
    func selectWheel(_ wheel: AnyWheel) {
        self.selectedWheel = wheel
    }
    
    func selectParachute(_ parachute: AnyParachute) {
        self.selectedParachute = parachute
    }
    
    func ready() throws -> Player {
        guard let selectedCharacter else { throw Error.missingSelectedCharacter }
        guard let selectedWheel else { throw Error.missingSelectedWheel }
        guard let selectedParachute else { throw Error.missingSelectedParachute }
    
        return Player(
            id: UUID().uuidString,
            selectedCharacter: selectedCharacter,
            selectedWheel: selectedWheel,
            selectedParachute: selectedParachute
        )
    }
}

extension BuilderManager {
    enum Error: Swift.Error {
        case missingSelectedCharacter
        case missingSelectedWheel
        case missingSelectedParachute
    }
}
