//
//  SignUpView.swift
//  IOsTest
//
//  Created by andres meza on 23/11/23.
//

import SwiftUI
import Foundation



struct SignUpView: View {
    
    @State private var namesUser:String = ""
    @State private var emailUser:String = ""
    @State private var ageUser:String = ""
    @State private var phoneUser:String = ""
    @State private var genderUser:String = ""
    @State var password:String = ""
    @State var validPassword:String = ""
    
    let limitPhone = 10
    let minCharacters = 6
    @State private var showAlert: Bool = false
    @State private var messageAlert: String = ""
    @State private var showLoading: Bool = false
    let validations = FormValidation()
    
    @ObservedObject var handler : ConfirmPageHandler
    @EnvironmentObject var useStore : UserStore
    @State private var muestraPopup = false
    
    
    var body: some View {
        
        ZStack {
            VStack(alignment:.leading){
                
                
                ScrollView{
                    
                    VStack(alignment: .leading){
                        
                        Text("Create")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("ColorPrimary"))
                            .padding(.top, 30)
                        
                        Text("Account")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("ColorPrimary"))
                            .padding(.bottom, 50)
                        
                        Text("Your Name")
                            .padding([.leading, .trailing, .top], 10.0 )
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorPrimary"))
                        HStack {
                            TextField("Enter your name", text: $namesUser)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).stroke( Color("ColorPrimary") ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
                                .padding([.leading, .trailing], 10)
                                .foregroundColor(.black)
                                .textInputAutocapitalization(.never)
                            
                            
                            if  validations.validateName(namesUser) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color("ColorSecondary"))
                                    .font(.system(size: 30))
                                    .transition(.symbolEffect(.automatic))
                            }
                        }
                        
                        Text("Email")
                            .padding([.leading, .trailing, .top], 10.0 )
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorPrimary"))
                        HStack{
                            TextField("user@***.com", text: $emailUser)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).stroke( Color("ColorPrimary") ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
                                .padding([.leading, .trailing], 10)
                                .foregroundColor(.black)
                                .font(.headline)
                                .autocapitalization(.none)
                            
                            if validations.validateEmail(emailUser) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color("ColorSecondary"))
                                    .font(.system(size: 30))
                            }
                            
                        }
                        
                        Text("Age")
                            .padding([.leading, .trailing, .top], 10.0 )
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorPrimary"))
                        HStack{
                            
                            TextField("Age over 18 years", text:$ageUser)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).stroke( Color("ColorPrimary") ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
                                .padding([.leading, .trailing], 10)
                                .foregroundColor(.black)
                                .font(.headline)
                                .keyboardType(.numberPad)
                            
                            if validations.validateAge(ageUser) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color("ColorSecondary"))
                                    .font(.system(size: 30))
                            }
                        }
                        Text("Gender")
                            .padding([.leading, .trailing, .top], 10.0 )
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorPrimary"))
                        VStack(alignment:.trailing ){
                            if !genderUser.isEmpty {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color("ColorSecondary"))
                                    .font(.system(size: 30))
                            }
                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        Picker("Flavor", selection: $genderUser) {
                            Text("Male").tag("M")
                            Text("Female").tag("F")
                            Text("Others").tag("O")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        .accessibilityLabel("gender")
                        
                        
                        Text("Phone Number")
                            .padding([.leading, .trailing, .top], 10.0 )
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorPrimary"))
                        HStack{
                            TextField("only numbers", text: $phoneUser)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).stroke( Color("ColorPrimary") ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
                                .padding([.leading, .trailing], 10)
                                .foregroundColor(.black)
                                .font(.headline)
                                .keyboardType(.numberPad)
                                .onChange(of: phoneUser) { oldValue, newValue in
                                    if newValue.count > limitPhone {
                                        phoneUser = String(newValue.prefix(limitPhone))
                                    }
                                }
                            
                            if phoneUser.count == limitPhone {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color("ColorSecondary"))
                                    .font(.system(size: 30))
                            }
                        }
                        
                        Text("Password")
                            .padding([.leading, .trailing, .top], 10.0 )
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorPrimary"))
                        HStack{
                            
                            TextField("Enter your password", text: $password)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).stroke( Color("ColorPrimary") ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
                                .padding([.leading, .trailing], 10)
                                .foregroundColor(.black)
                                .font(.headline)
                                .textFieldStyle(PlainTextFieldStyle())
                            
                            
                            if validations.validatePassword(password, minCharacters) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color("ColorSecondary"))
                                    .font(.system(size: 30))
                            }
                        }
                        Text("YOUR PASSWORD MUST CONTAIN:")
                            .padding([.leading, .trailing, .top], 10.0 )
                            .fontWeight(.bold)
                            .font(.footnote)
                            .foregroundColor(Color("ColorPrimary"))
                        
                        VStack {
                            HStack{
                                Text("- Min 6 characters")
                                    .font(.subheadline)
                                
                                Spacer()
                                if (password.count > minCharacters) {
                                    
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .transition(.symbolEffect(.automatic))
                                    
                                }
                            }.padding([.leading, .trailing, .top], 12)
                            
                            HStack{
                                Text("- 1 or more upper case letter")
                                    .font(.subheadline)
                                Spacer()
                                if validations.validCharacterIsUppercase(password) {
                                    
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .transition(.symbolEffect(.automatic))
                                }
                            }.padding([.leading, .trailing], 12)
                                .padding(.top, 9)
                            
                            HStack{
                                Text("- 1 or more lower case letter")
                                    .font(.subheadline)
                                Spacer()
                                if validations.validCharacterIsLowercase(password) {
                                    
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .transition(.symbolEffect(.automatic))
                                }
                            }.padding([.leading, .trailing], 12)
                                .padding(.top, 9)
                            
                            HStack{
                                Text("- 1 or more numbers")
                                    .font(.subheadline)
                                Spacer()
                                if validations.validCharacterIsNumber(password) {
                                    
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .transition(.symbolEffect(.automatic))
                                }
                            }.padding([.leading, .trailing], 12)
                                .padding(.top, 9)
                            
                            HStack{
                                Text("- 1 or more especial character")
                                    .font(.subheadline)
                                Spacer()
                                if validations.validCharacterSymbol(password) {
                                    
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .transition(.symbolEffect(.automatic))
                                }
                            }.padding([.leading, .trailing, .bottom], 12)
                                .padding(.top, 9)
                            
                        }.background(RoundedRectangle(cornerRadius: 10).stroke(Color("backCreateAccount"), lineWidth: 3).fill(Color("ColorSecondary")) )
                            .padding([.leading, .trailing, .bottom], 12)
                        
                        
                    }
                    
                    
                }
                Spacer()
                Button(action:
                        validateForm
                ) {
                    Text("Crear Cuenta")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical , 20.0)
                        .frame( maxWidth: .infinity, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 30.0))
                        .background(Color("ColorPrimary")
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.3), radius: 20.0, x: 0.0, y: 10))
                    
                }
                
                
                
            }.padding() .background(
                Image("backgrounAppOpacity")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(messageAlert), dismissButton: .default(Text("OK")))
            }
            if showLoading{
                LoadingView().shadow(color: Color.black.opacity(0.3), radius: 20.0, x: 0.0, y: 10).transition(.opacity)
            }
        }
        
    }
    
    
    
    func validateForm() {
        //        la primera validacion se hace con el numero de telefono
        if let numberPhoneParse = Int(phoneUser)  {
            //        Segunda validacion con la edad
            if let ageUserParse = Int(ageUser) {
                //                La tercera validacion se valida que el correo no exista en la BD
                if !useStore.validateEmail(emailUser){
                    
                    //                    la cuarta validacion ya se valida todo el formulario
                    if (validations.validatePassword(password, minCharacters) && validations.validateAge(ageUser) && validations.validateEmail(emailUser) && validations.validateName(namesUser) && !genderUser.isEmpty && phoneUser.count == limitPhone ){
                        print("se valido")
                        
                        useStore.addUser(name: namesUser, age: ageUserParse, numberPhone: numberPhoneParse , gender: genderUser, email: emailUser, password: password)
                        //                    metodo para simular la consulta a una api
                        showLoading = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showLoading = false
                            handler.changesState()
                        }
                        
                    } else {
                        messageAlert = "One or more data entered does not meet the requested characteristics, review the form and try again"
                        showAlert = true
                        print("no se valido")
                    }
                }else {
                    messageAlert = "The email address is already in use, try a different one"
                    showAlert = true
                }
                
                
            } else {
                messageAlert = "The age can only have numerical characters"
                showAlert = true
            }
            
        } else {
            messageAlert = "The phone number can only have numerical characters"
            showAlert = true
        }
        
    }
}



#Preview {
    SignUpView(handler: ConfirmPageHandler())
}
