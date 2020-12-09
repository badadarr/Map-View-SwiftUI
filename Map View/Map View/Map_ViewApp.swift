//
//  Map_ViewApp.swift
//  Map View
//
//  Created by badar on 10/11/20.
//

import SwiftUI

@main
struct Map_ViewApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                ContentView()
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .padding()
            .cornerRadius(3.0)
        }
    }
}
