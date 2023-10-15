//
//  CreateAccountView.swift
//  DoctorsApp
//
//  Created by jarrett nobles on 10/15/23.
//
import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

struct CreateAccountView: View {
    @State private var newUsername = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""

    @State private var wrongNewUsername = false
    @State private var wrongNewPassword = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)

                VStack {
                    Spacer()

                    Text("Create an Account")
                        .font(.largeTitle)
                        .bold()
                        .padding()

                    TextField("Username", text: $newUsername)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongNewUsername ? Color.red : Color.clear, lineWidth: 2)
                        )

                    SecureField("Password", text: $newPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongNewPassword ? Color.red : Color.clear, lineWidth: 2)
                        )

                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    NavigationLink(destination: ContentView()) {
                        Text("Create Account")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                    }

                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
        .padding(0)
    }
}
func createAccount(username: String, password: String) {
       // Add logic to create the new account
       // You can use Firebase Authentication methods here
       // (e.g., Auth.auth().createUser(withEmail:password:completion:))
   }



struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
