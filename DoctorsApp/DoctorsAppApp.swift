//main app
import SwiftUI
@main
struct DoctorsAppApp: App {
    @StateObject var userState = UserState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userState)
        }
    }
}


