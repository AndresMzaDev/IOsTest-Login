//
//  FormValidation.swift
//  IOsTest
//
//  Created by andres meza on 26/11/23.
//

import Foundation


class FormValidation {
    func validateEmail(_ value: String) -> Bool {
        let correoRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let correoValido = NSPredicate(format: "SELF MATCHES %@", correoRegEx)
        //        print(correoValido.evaluate(with: value))
        return correoValido.evaluate(with: value)
        
    }
    
    func validateName(_ value: String ) -> Bool {
        if !value.isEmpty && value.count > 3 {
            return true
        } else {
            return false
        }
    }
    
    func validateAge(_ value: String ) -> Bool {
        guard let ageNumber = Int(value) else {
            
            return false
        }
        
        if !value.isEmpty && ageNumber > 18 && ageNumber < 110 {
            return true
        } else {
            return false
        }
    }
    //    valida si existe un numero en el string
    func validCharacterIsNumber(_ value: String) -> Bool {
        return value.contains{character in character.isNumber}
    }
    //    valida si existe un caracter mayusculo en el string
    func validCharacterIsUppercase(_ value: String) -> Bool {
        return value.contains{character in character.isUppercase}
    }
    //    valida si existe un caracter minuscula en el string
    func validCharacterIsLowercase(_ value: String) -> Bool {
        return value.contains{character in character.isLowercase}
    }
    //    valida si existe un caracter especiales en el string
    func validCharacterSymbol(_ value: String) -> Bool {
        let characterValid = "!@#$%^&*()_+{}|\\\"<>?,.;:'-=\\/"
        //        let checkerCharacter = NSPredicate(format:"SELF MATCHES %@", characterValid)
        
        return value.contains{characterValid.contains($0)}
    }
    
    func validatePassword(_ value: String, _ minCharacters: Int) -> Bool {
        print("entro a la funcion")
        let thereNumber = validCharacterIsNumber(value)
        let thereUppercase = validCharacterIsUppercase(value)
        let thereLowercase = validCharacterIsLowercase(value)
        let thereSymbol = validCharacterSymbol(value)
        let miniSizeCharacters =  value.count > minCharacters
        
        
        if thereNumber  && thereUppercase && thereLowercase && miniSizeCharacters && thereSymbol {
            //            print("se valido")
            return true
        } else {
            //            print("no es se valido")
            return false
        }
        
    }
    
//    func validateForm() {
//        if (validatePassword(password) && validateAge(ageUser) && validateEmail(emailUser) && validateName(namesUser) && !genderUser.isEmpty && phoneUser.count == limitPhone ){
//            print("se valido")
//            
//            //            metodo para ingresar los datos del usuarios
//            StoreUser().addUser(name: "perro", age: 68, numberPhone: 232333, gender: "macho", email: "andres@bes", password: "String")
//            
//            
//        } else {
//            print("no se valido")
//        }
//        
//    }
}
