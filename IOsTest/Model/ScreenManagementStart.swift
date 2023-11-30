//
//  ScreenManagementStart.swift
//  IOsTest
//
//  Created by andres meza on 26/11/23.
//

import Foundation

//esta funcion se encarga de administrar la primera vista de la app
class ScreenManagementStart: ObservableObject {
    @Published var screenManagement: Bool = true
    
   
    func changesState(){
        print("cambio de estado \(screenManagement)")
        screenManagement.toggle()
        print("nuevo estado \(screenManagement)")
    }
    
}
