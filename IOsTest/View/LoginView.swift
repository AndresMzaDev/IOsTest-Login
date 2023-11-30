//
//  LoginView.swift
//  IOsTest
//
//  Created by andres meza on 23/11/23.
//

import SwiftUI


struct LoginView: View {
    
    @State private var emailUser:String = ""
    @State var password:String = ""
    
    @State private var showLoading: Bool = false
    @State private var showPassword: Bool = false
    @State private var showDataScreen: Bool = false
    @State private var notFound: Bool = false
    @State private var showAlert: Bool = false
    @State private var showAdministration: Bool = false
    @State private var messageAlert: String = ""
    
    @State var userFound = userStruct(name: "", age: 0, numberPhone: 0, gender: "", email: "", password: "")
    @EnvironmentObject var useStore : UserStore
    
    var body: some View {
        
        ZStack {
            VStack(alignment:.leading){
                
                Text("Login To")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("ColorPrimary"))
                    .padding(.top, 30)
                
                Text("Your Account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("ColorPrimary"))
                    .padding(.bottom, 50)
                
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
                HStack{
                    Spacer()
                    Text("Forget Password")
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                        .foregroundStyle(Color("ColorSecondary"))
                }.padding(.horizontal)
                    .padding(.bottom, 20)
                
                Button(action:
                        validateUser
                ) {
                    Text("Sing In")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical , 20.0)
                        .frame( maxWidth: .infinity, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 30.0))
                        .background(Color("ColorPrimary")
                            .cornerRadius(20))
                    
                }
                
                Button(action:
                        admiSignIn
                ) {
                    Text("Admin Sing In")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame( maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color("ColorPrimary"))
                        .padding(.vertical , 10.0)
                    
                }.sheet(isPresented: $showAdministration) {
                    UserList()
                    
                }
                
                Spacer()
                
                EnterSocialNetworks()
                CreatedBy()
            }.padding()
                .background(
                    Image("backgrounAppOpacity")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                ).alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(messageAlert), dismissButton: .default(Text("OK")))
                }.sheet(isPresented: $showDataScreen) {
                    DataUserView(dataUser: $userFound)
                    
                }.sheet(isPresented: $notFound) {
                    notFoundUser()
                        .presentationDetents([.medium, .fraction(0.4)])
                }
            
            if showLoading{
                LoadingView().shadow(color: Color.black.opacity(0.3), radius: 20.0, x: 0.0, y: 10).transition(.opacity)
            }
            
        }
        
    }
    
    func admiSignIn(){
        
        if emailUser.isEmpty || password.isEmpty{
            messageAlert = "One or more data was not entered, check and try again"
            showAlert = true
            
        } else {
            showLoading = true
            if let found = useStore.users.first(where: { $0.email == emailUser && $0.password == password }) {
                print("Persona encontrada: \(found)")
                cleanData()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showLoading = false
                    showAdministration.toggle()
                }
            } else {
                cleanData()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showLoading = false
                    notFound = true
                }
                print("No se encontró ninguna persona con edad igual a 30")
            }
        }
       
    }
    
    func cleanData(){
        emailUser = ""
        password = ""
    }
    
    func validateUser()  {
        if emailUser.isEmpty || password.isEmpty{
            messageAlert = "One or more data was not entered, check and try again"
            showAlert = true
            
        } else {
            showLoading = true
            if let found = useStore.users.first(where: { $0.email == emailUser && $0.password == password }) {
                print("Persona encontrada: \(found)")
                userFound = found
                cleanData()
                print("Persona encontrada: \(userFound)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showLoading = false
                    showDataScreen = true
                }
            } else {
                
                cleanData()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showLoading = false
                    notFound = true
                }
                print("No se encontró ninguna persona con edad igual a 30")
            }
            
            
        }
        
    }
    
    
    
}

struct notFoundUser: View {
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.magnifyingglass")
                .foregroundStyle(Color("Accent"))
                .font(.system(size: 80))
            
            Text("Ups!")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Text("We can't find you in our database")
                .font(.body)
                .foregroundStyle(.gray)
            
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}


#Preview {
    LoginView()
}
