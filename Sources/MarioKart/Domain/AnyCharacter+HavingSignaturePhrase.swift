protocol HavingSignaturePhrase {
    func say() -> String
}

extension MarioCharacter: HavingSignaturePhrase {
    func say() -> String {
        "It's-a-me, Mario"
    }
}

extension LuigiCharacter: HavingSignaturePhrase {
    func say() -> String {
        "Mama mia!"
    }
}

extension PeachCharacter: HavingSignaturePhrase {
    func say() -> String {
        "Take that!"
    }
}
