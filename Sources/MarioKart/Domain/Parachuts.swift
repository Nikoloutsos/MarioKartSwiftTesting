class FlowerGliderParachute: AnyParachute {
    var speedTraitValue: SpeedTrait {
        SpeedTrait(value: 0)
    }
    
    var AcceleratorTraitValue: AcceleratorTrait {
        AcceleratorTrait(value: 0.01)
    }
    
    var WeightTraitValue: WeightTrait {
        WeightTrait(value: 0.01)
    }
    
    var GripTraitValue: GripTrait {
        GripTrait(value: 0)
    }
}

class HylianKiteParachute: AnyParachute {
    var speedTraitValue: SpeedTrait {
        SpeedTrait(value: 0.09)
    }
    
    var AcceleratorTraitValue: AcceleratorTrait {
        AcceleratorTrait(value: -0.05)
    }
    
    var WeightTraitValue: WeightTrait {
        WeightTrait(value: 0.01)
    }
    
    var GripTraitValue: GripTrait {
        GripTrait(value: 0)
    }
}

class MKTVParafoilParachute: AnyParachute {
    var speedTraitValue: SpeedTrait {
        SpeedTrait(value: 0.01)
    }
    
    var AcceleratorTraitValue: AcceleratorTrait {
        AcceleratorTrait(value: 0.1)
    }
    
    var WeightTraitValue: WeightTrait {
        WeightTrait(value: 0.01)
    }
    
    var GripTraitValue: GripTrait {
        GripTrait(value: 0.1)
    }
}

