//
//  EnterSocialNetworks.swift
//  IOsTest
//
//  Created by andres meza on 26/11/23.
//

import SwiftUI

struct EnterSocialNetworks: View {
    
    @State private var showModal = false
    var body: some View {
        
        VStack {
            Text("Or sign in with")
                .font(.caption)
                .foregroundStyle(.gray)
            HStack(){
                Spacer()
                Button(action: {
                    showModal.toggle()
                    
                }
                ) {
                    Image("logoBlackTwitter")
                        .resizable()
                        .padding()
                        .frame( width: 50 , height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke( Color("ColorPrimary") ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
                }
                Button(action: {
                    
                    showModal.toggle()
                }
                ) {
                    Image("LogoLK")
                        .resizable()
                        .padding()
                        .frame( width: 50 , height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke( Color("ColorPrimary") ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
                }
                Button(action: {
                    showModal.toggle()
                }
                ) {
                    Image("logoFacebookColor")
                        .resizable()
                        .padding()
                        .frame( width: 50 , height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke( Color("ColorPrimary") ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
                }
                Spacer()
            }
            //            PopupView()
            
        }.sheet(isPresented: $showModal) {
            // Contenido del modal
            popUpView()
                .presentationDetents([.medium, .fraction(0.4)])
        }
        
    }
    
    func Login (){
        
    }
}
struct popUpView: View {
    //    @Binding var close: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "xmark.circle")
                .foregroundStyle(Color("Accent"))
                .font(.system(size: 80))
            
            Text("Ups!")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Text("These methods are not ready yet")
                .font(.body)
                .foregroundStyle(.gray)
            
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    EnterSocialNetworks()
}
