import ProtocolMembers

// =============== Working stuff ===============

protocol WorkingProtocol {
    var property: Int { get }
}

extension WorkingProtocol {
    var property: Int { 42 }
}

struct WorkingStruct: WorkingProtocol {
    
}

// ============= Non-working stuff =============

@ImplementProtocolMembers
protocol NonWorkingProtocol {
    var property: Int { get }
}

struct NonWorkingStruct: NonWorkingProtocol {

}

// ================== Testing ==================

func takeValuesInSameFile(working: WorkingStruct, nonWorking: NonWorkingStruct) {
    // In this file, all three of these lines compile:
    _ = working.property
    _ = (nonWorking as any NonWorkingProtocol).property
    _ = nonWorking.property
}
