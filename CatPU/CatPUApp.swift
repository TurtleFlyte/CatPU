import SwiftUI

@main
struct CatPUApp: App {
    @State private var performanceModel = PerformanceInfoFetcher()
    
    var body: some Scene {
        MenuBarExtra{
            ContentView()
                .frame(width: 175, height: 75)
        } label: {
            AnimatedIconView()
        }
        .environment(\.performanceModel, performanceModel)
        .menuBarExtraStyle(.window)
    }
}

private struct PerformanceInfoFetcherKey: EnvironmentKey {
    static let defaultValue: PerformanceInfoFetcher = PerformanceInfoFetcher()
}

extension EnvironmentValues{
    var performanceModel: PerformanceInfoFetcher{
        get {self[PerformanceInfoFetcherKey.self]}
        set {self[PerformanceInfoFetcherKey.self] = newValue }
    }
}
