// ================== Testing ==================

func takeValuesInSecondaryFile(working: WorkingStruct, nonWorking: NonWorkingStruct) {
    // In this file, only these two lines compile:
    _ = working.property
    _ = (nonWorking as any NonWorkingProtocol).property
    
    // But this does not:
    // _ = nonWorking.property
}
