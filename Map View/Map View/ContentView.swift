//
//  ContentView.swift
//  Map View
//
//  Created by badar on 10/11/20.
//

import MapKit
import SwiftUI
import SpriteKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -6.200000, longitude: 106.816666), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        
        NavigationView {
            
            Home()
                .preferredColorScheme(.dark)
                .navigationTitle("")
                .navigationBarHidden(true)
        }
        
        Map(coordinateRegion: $region)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    
    @State var tab = "USA"
    @Namespace var animation
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    
                    Image("menu")
                        .renderingMode(.template)
                        .foregroundColor(.blue)
                }
                
                Spacer(minLength: 0)
                Button(action: {}) {
                    
                    Image("bell")
                        .renderingMode(.template)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            
            HStack {
                
                Text("Dashboard")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
            
            HStack(spacing: 0) {
                
                TabButton(selected: $tab, title: "USA", animation: animation)
                
                TabButton(selected: $tab, title: "Global", animation: animation)
            }
            .background(Color.white.opacity(0.08))
            .clipShape(Capsule())
            .padding()
            
            
            Spacer(minLength: 0)
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
    }
}

struct TabButton : View {
    
    @Binding var selected : String
    var title : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button(action : {
            withAnimation(.spring()) {
                
                selected = title
            }
        }) {
            
            ZStack {
                
                // Capsule and sliding Effects...
                Capsule()
                    .fill(Color.clear)
                    .frame(height: 45)
                
                if selected == title {
                    
                    Capsule()
                        .fill(Color.white)
                        .frame(height: 45)
                    
                    // Matched Geometry Effects...
                    matchedGeometryEffect(id: title, in: animation)
                }
                
                Text(title)
                    .foregroundColor(selected ==  title ? .black : .white)
                    .fontWeight(.bold)
            }
        }
    }
}
