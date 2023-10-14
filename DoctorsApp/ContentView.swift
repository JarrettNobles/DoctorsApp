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
            }
            
        }
        .navigationBarHidden(true)
    }
   
   
    
}
//dont delete right now
#Preview {
    ContentView()
}
