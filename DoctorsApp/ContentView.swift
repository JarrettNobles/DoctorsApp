//
//  ContentView.swift
//  DoctorsApp
//
//  Created by jarrett nobles on 10/14/23.
//

import SwiftUI

struct ContentView: View {
    //username variable
    @State private var username = ""
    //password variable
    @State private var password = ""
    //wrong
    @State private var wrongUsername = 0
    //wrong password
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack{
                    //login text
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    //TextField for username
                    TextField("Username",text:$username)
                        .padding()
                        .frame(width:300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red,width:CGFloat(wrongUsername))
                    //Password securefield
                    SecureField("Password",text:$password)
                        .padding()
                        .frame(width:300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red,width:CGFloat(wrongPassword))
                    //login button
                    Button("Login"){
                        //logic to authenticate
                        authenticateUser(username: username, password: password)
                        
                    }
                    .foregroundColor(.white)
                    .frame(width:300, height:50)
                    .background(Color.blue).cornerRadius(10)
                    
                    //navigation link
                    //change to home page eventually
                   // NavigationLink(destination: Text("this is the logged in view @\(username)"),isActive:$showingLoginScreen){
                                            EmptyView()
                        
                    //}
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
    //fill in with database info
    func authenticateUser(username: String, password: String){
        if username.lowercased() == "Test"{
            wrongUsername = 0
            if password.lowercased() == "test"{
                wrongPassword = 0
                showingLoginScreen = true
            }
            
            else{
                wrongPassword = 2
            }
            
        }
        
        else{
            wrongUsername = 2
        }
    }


}

//dont delete right now
#Preview {
    ContentView()
}
