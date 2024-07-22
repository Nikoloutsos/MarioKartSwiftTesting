class RollerWheels: AnyWheel {
    var speedTraitValue: SpeedTrait {
        SpeedTrait(value: 0.05)
    }
    
    var AcceleratorTraitValue: AcceleratorTrait {
        AcceleratorTrait(value: 0.05)
    }
    
    var WeightTraitValue: WeightTrait {
        WeightTrait(value: 0.01)
    }
    
    var GripTraitValue: GripTrait {
        GripTrait(value: 0.1)
    }
}

class AzureRollerWheels: AnyWheel {
    var speedTraitValue: SpeedTrait {
        SpeedTrait(value: 0.04)
    }
    
    var AcceleratorTraitValue: AcceleratorTrait {
        AcceleratorTrait(value: -0.1)
    }
    
    var WeightTraitValue: WeightTrait {
        WeightTrait(value: 0.05)
    }
    
    var GripTraitValue: GripTrait {
        GripTrait(value: 0.2)
    }
}

class MonsterWheels: AnyWheel {
    var speedTraitValue: SpeedTrait {
        SpeedTrait(value: 0)
    }
    
    var AcceleratorTraitValue: AcceleratorTrait {
        AcceleratorTrait(value: -0.2)
    }
    
    var WeightTraitValue: WeightTrait {
        WeightTrait(value: 0.15)
    }
    
    var GripTraitValue: GripTrait {
        GripTrait(value: 0.2)
    }
}

