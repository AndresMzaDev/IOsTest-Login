//
//  ConfirmPageHandler.swift
//  IOsTest
//
//  Created by andres meza on 26/11/23.
//

import Foundation

//esta funcion se encarga de administrar la primera vista de la app
class ConfirmPageHandler: ObservableObject {
    @Published var PageHandler: Bool = true
    
   
    func changesState(){
        print("cambio de estado \(PageHandler)")
        PageHandler.toggle()
        print("nuevo estado \(PageHandler)")
    }
    
}
