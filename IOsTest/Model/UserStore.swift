//
//  storeUser.swift
//  IOsTest
//
//  Created by andres meza on 25/11/23.
//

import Foundation


// define los datos de los usuarios ingresados
class UserStore: ObservableObject {
    @Published var users: [userStruct] = [userStruct(name: "Andres Neptaly Meza", age: 30, numberPhone: 99999999999, gender: "M", email: "admin@root.com", password: "Admin123.")]
    
    func addUser(name: String, age: Int, numberPhone: Int, gender: String, email: String, password: String ){
        let newUser =  userStruct(name: name, age: age, numberPhone: numberPhone, gender: gender, email: email, password: password)
        users.append(newUser)

        print("usuarios \(getUser())")
    }
    
    func validateEmail(_ email: String) -> Bool {
        
        if let userFound = users.first(where: { $0.email == email }) {
            print("Persona encontrada: \(userFound)")
            return true
        } else {
            print("No se encontró ninguna persona con edad igual a 30")
            return false
          
        }
//        if users.contains(where: {user in
//            user.email == email}){
//            print("contiene el nombre Andres")
//            return
//        }
    }
    
    func getUser() -> [userStruct] {
        return users
    }
}


