import SwiftUI

struct ContentView: View {
    @Environment(\.performanceModel) var performanceModel
    
    var body: some View {        
        VStack (
            alignment: .leading
        ){
            Text(displayCPUInfo())
                .fixedSize()
            Button(
                "Quit CatPU"
            ){
                NSApp.terminate(nil)
            }
        }
        .padding(21)
    }
    
    func displayCPUInfo() -> String{
        if(performanceModel.totalCoreUsage.isNaN || performanceModel.totalCoreUsage.isInfinite){
            return "CPU Usage:          NaN%"
        }else{
            return "CPU Usage:   \(Int(performanceModel.totalCoreUsage))%"
        }
    }
}
