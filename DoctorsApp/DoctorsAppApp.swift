//main app
import SwiftUI
import Firebase // Import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


@main
struct DoctorsAppApp: App {
    // Create a user state object to be shared across the app
    @StateObject var userState = UserState()

    // Initialize Firebase in the init block
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userState)
        }
    }
}

