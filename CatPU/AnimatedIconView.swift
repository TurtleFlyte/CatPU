import SwiftUI
import Combine

struct AnimatedIconView: View {
    @Environment(\.performanceModel) var performanceModel
    
    let icons: [String] = ["caticon_anim1", "caticon_anim2", "caticon_anim3", "caticon_anim4", "caticon_anim5", "caticon_anim6", "caticon_anim7", ]
    
    @State private var frameIndex: Int = 0
    
    @State private var timerInterval: Double = 0.3
    var timer: Publishers.Autoconnect<Timer.TimerPublisher> {
        Timer.publish(every: timerInterval, on: .main, in: .common).autoconnect()
    }
    
    let hiSpeed = 0.03
    let loSpeed = 0.25
    
    var body: some View {
        Image(icons[frameIndex])
            .renderingMode(.template)
            .onReceive(timer) {_ in
                frameIndex = (frameIndex + 1) % icons.count
                if(performanceModel.totalCoreUsage != 0){
                    timerInterval = hiSpeed+((loSpeed-hiSpeed)/100) * Double((100-(performanceModel.totalCoreUsage)))
                }
            }
    }
}
