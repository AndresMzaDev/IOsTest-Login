//
//  StartApp.swift
//  IOsTest
//
//  Created by andres meza on 26/11/23.
//

import SwiftUI

struct StartApp: View {
    @StateObject private var screenChange = ScreenManagementStart()
  
    
    var body: some View {

        if screenChange.screenManagement {
            StartingScreen(screen: screenChange)
        } else {
            HomeView().transition(.slide)
               
        }
        
    }
}



#Preview {
    StartApp()
}
