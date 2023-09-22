//
//  ContentView.swift
//  burst-ui
//
//  Created by Shubham Lahoti on 22/09/23.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
    
                NavigationView {
                    NavigationLink("Work Folder", destination: DetailsView())
                    
                }.foregroundColor(Color.accentColor)
            .background(Color.red)
            
      
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


