import SwiftUI

struct ContentView: View {
    @Environment(\.performanceModel) var performanceModel
    
    var body: some View {        
        VStack {
            Text(displayCPUInfo())
            Button(
                "Quit CatPU"
            ){
                NSApp.terminate(nil)
            }
        }
        .padding(6)
    }
    
    func displayCPUInfo() -> String{
        if(performanceModel.coreUsagePercent.isNaN || performanceModel.coreUsagePercent.isInfinite){
            print("zero or infinite")
            return "CPU Usage:          NaN%"
        }else{
            return "CPU Usage:\t\(Int(performanceModel.coreUsagePercent))%"
        }
    }
}
