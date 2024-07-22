protocol AnyCharacter: HavingSpeedTrait, HavingAcceleratorTrait, HavingWeightTrait, HavingGripTrait {}
protocol AnyWheel: HavingSpeedTrait, HavingAcceleratorTrait, HavingWeightTrait, HavingGripTrait {}
protocol AnyParachute: HavingSpeedTrait, HavingAcceleratorTrait, HavingWeightTrait, HavingGripTrait {}

class Player: Identifiable, HavingSpeedTrait, HavingAcceleratorTrait, HavingWeightTrait, HavingGripTrait {
    let id: String
    let selectedCharacter: AnyCharacter
    let selectedWheel: AnyWheel
    let selectedParachute: AnyParachute
    
    init(id: String, selectedCharacter: AnyCharacter, selectedWheel: AnyWheel, selectedParachute: AnyParachute) {
        self.id = id
        self.selectedCharacter = selectedCharacter
        self.selectedWheel = selectedWheel
        self.selectedParachute = selectedParachute
    }
    
    var speedTraitValue: SpeedTrait {
        let value = [selectedCharacter, selectedWheel, selectedParachute].reduce(0.0) { partialResult, selectionComponent in
            partialResult + selectionComponent.speedTraitValue.value
        }
        return SpeedTrait(value: value)
    }
    
    var AcceleratorTraitValue: AcceleratorTrait {
        let value = [selectedCharacter, selectedWheel, selectedParachute].reduce(0.0) { partialResult, selectionComponent in
            partialResult + selectionComponent.AcceleratorTraitValue.value
        }
        return AcceleratorTrait(value: value)
    }
    
    var WeightTraitValue: WeightTrait {
        let value = [selectedCharacter, selectedWheel, selectedParachute].reduce(0.0) { partialResult, selectionComponent in
            partialResult + selectionComponent.WeightTraitValue.value
        }
        return WeightTrait(value: value)
    }
    
    var GripTraitValue: GripTrait {
        let value = [selectedCharacter, selectedWheel, selectedParachute].reduce(0.0) { partialResult, selectionComponent in
            partialResult + selectionComponent.GripTraitValue.value
        }
        return GripTrait(value: value)
    }
}

class PlayerProDecorator: Player {
    let player: Player
    
    init(player: Player) {
        self.player = player
        super.init(
            id: player.id,
            selectedCharacter: player.selectedCharacter,
            selectedWheel: player.selectedWheel,
            selectedParachute: player.selectedParachute
        )
    }
    
    override var speedTraitValue: SpeedTrait {
        SpeedTrait(value: super.speedTraitValue.value * 1.05)
    }
    
    override var AcceleratorTraitValue: AcceleratorTrait {
        AcceleratorTrait(value: super.AcceleratorTraitValue.value * 1.05)
    }
    
    override var WeightTraitValue: WeightTrait {
        WeightTrait(value: super.WeightTraitValue.value * 1.05)
    }
    
    override var GripTraitValue: GripTrait {
        GripTrait(value: super.GripTraitValue.value * 1.05)
    }
    
}
