//
//  adminModal.swift
//  IOsTest
//
//  Created by andres meza on 27/11/23.
//

import SwiftUI

struct AdminModal: View {
    
    @State private var emailUser:String = ""
    @State var password:String = ""
    
    @State private var showPassword: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                
                Text("Your Email")
                    .padding([.leading, .trailing, .top], 10.0 )
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorPrimary"))
                
                
                TextField("Enter your email", text: $emailUser)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke( Color("ColorPrimary") ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
                    .foregroundColor(.black)
                    .textInputAutocapitalization(.never)
                    .overlay(
                        HStack {
                            Spacer()
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                                .frame(width: 30, height: 30)
                                .padding(.trailing, 15)
                        }
                    ).padding([.leading, .trailing], 10)
                
                
                
                Text("Password")
                    .padding([.leading, .trailing, .top], 10.0 )
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorPrimary"))
                
                if !showPassword {
                    SecureField("*******", text: $password)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke( Color("ColorPrimary") ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
                        .foregroundColor(.black)
                        .font(.headline)
                        .autocapitalization(.none)
                        .overlay(
                            HStack {
                                Spacer()
                                
                                Button( action: {showPassword.toggle()} ){
                                    Image(systemName: "eyeglasses.slash")
                                        .foregroundColor(.gray)
                                        .frame(width: 30, height: 30)
                                    .padding(.trailing, 15) }
                                
                            }
                        ).padding([.leading, .trailing], 10)
                } else {
                    TextField("*******", text: $password)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke( Color("ColorPrimary") ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
                        .foregroundColor(.black)
                        .font(.headline)
                        .autocapitalization(.none)
                        .overlay(
                            HStack {
                                Spacer()
                                Button( action: { showPassword.toggle() } ){
                                    Image(systemName: "eyeglasses")
                                        .foregroundColor(.gray)
                                        .frame(width: 30, height: 30)
                                    .padding(.trailing, 15) }
                                
                            }
                        ).padding([.leading, .trailing], 10)
                }
                
                NavigationLink(destination:  UserList())
                {
                    Text("Sign In")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.vertical , 20.0)
                        .frame( width: 120, alignment: .center)
                        .background(Color.white)
                        .foregroundColor(Color("ColorPrimary"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
            }
        }
    }
}

#Preview {
    AdminModal()
}
