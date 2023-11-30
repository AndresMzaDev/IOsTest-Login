//
//  SheetLogin.swift
//  IOsTest
//
//  Created by andres meza on 22/11/23.
//

import SwiftUI

struct sheetLogin: View {
    @State var userName = ""
    @State var userPassword = ""
    var gradient = Gradient(colors: [Color("ColorBackground"), Color("ColorBackground").opacity(0.8)])
    
    var body: some View {
        
        ZStack(){
            
            //                            background(Color("ColorBackground"))
            //            LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            
            VStack(alignment: .leading  ){
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorPrimary"))
                
                VStack(spacing:30){
                    HStack (alignment: .bottom, spacing: 3.0){
                        
                        TextField("Username", text: $userName )
                            .foregroundColor(Color("ColorPrimary"))
                            .font(.headline)
                        
                        Image(systemName:"person")
                            .foregroundColor(Color("ColorPrimary"))
                        
                        
                    }.padding(15).overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("ColorPrimary"), lineWidth: 1))
                    .background(.white)
                    .cornerRadius(10)
                    
                    //                Divider()
                    HStack (alignment: .bottom, spacing: 3.0){
                        
                        TextField("Password", text: $userName )
                            .foregroundColor(Color("ColorPrimary"))
                            .font(.headline)
                        
                        Image(systemName:"eye")
                            .foregroundColor(Color("ColorPrimary"))
                        
                    }.padding(15).background(.white).overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("ColorPrimary"), lineWidth: 1))
                    .cornerRadius(10)
                }
                HStack(){
                    Spacer()
                    Text("Forgot Password")
                        .font(.caption)
                        .foregroundColor(Color("ColorPrimary"))
                        .multilineTextAlignment(.trailing)
                }
                Spacer()
                Button {
//                    HomeView()
                } label: {
                    Text("Sing In")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical , 20.0)
                        .frame( maxWidth: .infinity, alignment: .center)
                        .background(Color("ColorPrimary")
                            .cornerRadius(10)
                        )
                }
                HStack(alignment: .center){
                    Spacer()
                    Text("Not a member?")
                        .font(.caption)
                        .foregroundColor(Color("ColorPrimary"))
                        .multilineTextAlignment(.center)
                    Text("Register now")
                        .font(.caption)
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                
            }.padding(20)
        }
    }
}
struct sheetLogin_Previews: PreviewProvider {
    static var previews: some View {
        sheetLogin()
    }
}
//#Preview {
//    SheetLogin()
//}
