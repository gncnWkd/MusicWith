//
//  ContentView.swift
//  MusicWith_test
//
//  Created by 2020014975 on 10/16/24.
//

import SwiftUI


struct StartView: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            Button(action: {
                isActive = true
            }) {
                Text("Sign in")
                    .font(.title)
                    .padding()
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            MainTabView()
        }
    }
}


struct MainTabView: View {
    @State private var isExpanded = false
    
    var body: some View {
        ZStack {
            TabView {
                Text("Home")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                Text("Playlist")
                    .tabItem {
                        Image(systemName: "music.note.list")
                        Text("Playlist")
                    }
                Text("Setting")
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Setting")
                    }
            }
            .padding(.bottom)
            .edgesIgnoringSafeArea(.bottom)
            .frame(height: 870)
            
            MiniPlayerView (isExpanded: $isExpanded)
                .padding(.bottom)
                .animation(.easeInOut)
                .offset(x:0, y:290)
            
            .sheet(isPresented: $isExpanded) {
                MusicPlayerView(isExpanded: $isExpanded)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.fraction(0.8)])
            }
        }
    }
}

struct MiniPlayerView: View {
    @Binding var isExpanded: Bool

    var body: some View {
        HStack {
            Text("Music name")
                .font(.headline)
            Spacer()
            Button(action: {
                isExpanded.toggle()
            }) {
            }
        }
        
        .padding()
        .frame(height:70)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 2)
        .onTapGesture {
            isExpanded.toggle()
        }
        
    }
}

struct MusicPlayerView: View {
    @Binding var isExpanded: Bool

    var body: some View {
        VStack {
            Text("Music Player")
                .font(.largeTitle)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
        .transition(.move(edge: .bottom))
    }
}



#Preview {
    StartView()
}
