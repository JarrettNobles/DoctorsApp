import SwiftUI

struct ContentView: View {
    // User input variables
    @State private var username = ""
    @State private var password = ""

    // Error flags for indicating wrong username or password
    @State private var wrongUsername = false
    @State private var wrongPassword = false

    // Flag to control navigation to the logged-in view
    @State private var showingLoginScreen = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background circles
                Color.blue.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)

                VStack {
                    // Login title
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()

                    // Username input field
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongUsername ? Color.red : Color.clear, lineWidth: 2)
                        )

                    // Password input field
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongPassword ? Color.red : Color.clear, lineWidth: 2)
                        )

                    // Login button
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)

                    // Navigation link to the logged-in view
                    NavigationLink(
                        destination: Text("This is the logged-in view @\(username)"),
                        isActive: $showingLoginScreen,
                        label: { EmptyView() }
                    )
                }
            }
            .navigationBarHidden(true)
        }
    }

    // Function to authenticate the user
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "test" {
            wrongUsername = false
            if password.lowercased() == "test" {
                wrongPassword = false
                showingLoginScreen = true
            } else {
                wrongPassword = true
            }
        } else {
            wrongUsername = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
