struct SpeedTrait {
    let value: Double
}

struct AcceleratorTrait {
    let value: Double
}

struct GripTrait {
    let value: Double
}

struct WeightTrait {
    let value: Double
}

protocol HavingSpeedTrait {
    var speedTraitValue: SpeedTrait { get }
}

protocol HavingAcceleratorTrait {
    var AcceleratorTraitValue: AcceleratorTrait { get }
}

protocol HavingGripTrait {
    var GripTraitValue: GripTrait { get }
}

protocol HavingWeightTrait {
    var WeightTraitValue: WeightTrait { get }
}
