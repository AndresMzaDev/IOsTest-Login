//
//  DataUser.swift
//  IOsTest
//
//  Created by andres meza on 27/11/23.
//

import SwiftUI

struct DataUserView: View {
    
    @Binding var dataUser:userStruct
    
    var body: some View {
        VStack(alignment: .leading ){
            Text("My Profile")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color("ColorPrimary"))
                .padding(.top, 10)
            
            HStack {
                Spacer()
                if dataUser.gender == "M" {
                Image("genderMale")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .background(Color("backCreateAccount"))
                    .clipShape(Circle())
                }
                if dataUser.gender == "F" {
                Image("genderFemale")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .background(Color("backCreateAccount"))
                    .clipShape(Circle())
                }
                if dataUser.gender == "O" {
                Image("genderOther")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .background(Color("backCreateAccount"))
                    .clipShape(Circle())
                }
                Spacer()
            }
            VStack(alignment: .center){
                Text("\(dataUser.name)")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("ColorPrimary"))
                    .padding(.top, 10)
                    .multilineTextAlignment(.center)
                
                Text("\(dataUser.age) años")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 13)
                HStack{
                    Text("Email")
                        .font(.callout)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    Text("\(dataUser.email)")
                        .bold()
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color("ColorPrimary").opacity(0.05)))
                    .padding([.leading, .trailing, .bottom], 12)
                
                
                HStack{
                    Text("Sexo")
                        .font(.callout)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    Text("\(getGender(dataUser.gender))")
                        .bold()
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color("ColorPrimary").opacity(0.05)))
                    .padding([.leading, .trailing, .bottom], 12)
                
                HStack{
                    Text("Number Phone")
                        .font(.callout)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    Text("+\(dataUser.numberPhone)")
                        .bold()
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color("ColorPrimary").opacity(0.05)))
                    .padding([.leading, .trailing, .bottom], 12)
                
                HStack{
                    Text("Password")
                        .font(.callout)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    Text("\(dataUser.password)")
                        .bold()
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color("ColorPrimary").opacity(0.05)))
                    .padding([.leading, .trailing, .bottom], 12)
                
            }
            
            Spacer()
            
        
            
            
        }.padding()
            .background(
                Image("backgrounAppOpacity")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    func getGender(_ gender:String) -> String {
        
        switch gender {
        case "M":
            return "Male"
        case "F":
            return "Female"
        case "O":
            return "Other"
        default:
            return "Error"
        }
        
        
    }
    
}



//#Preview {
//    DataUserView(dataUser: userStruct)
//}
