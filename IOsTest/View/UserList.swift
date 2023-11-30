//
//  userList.swift
//  IOsTest
//
//  Created by andres meza on 27/11/23.
//

import SwiftUI

struct UserList: View {
    
    @EnvironmentObject var useStore : UserStore
    
    var body: some View {
        
                List {
                    ForEach(useStore.users, id: \.email ) { item in
                        formatCard(data: item)
                    }
                
        }
        
        
    }
}

struct formatCard: View {
    
    var data:userStruct
    
    var body: some View {
        HStack{
            
            if data.gender == "M" {
                Image("genderMale")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x:2, y:2)
                    .background(Color("ColorSecondary"))
                    .clipShape(Circle())
            }
            if data.gender == "F" {
                Image("genderFemale")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x:2, y:2)
                    .background(Color("backCreateAccount"))
                    .clipShape(Circle())
            }
            if data.gender == "O" {
                Image("genderOther")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x:2, y:2)
                    .background(Color("ColorGradSecondary"))
                    .clipShape(Circle())
            }
            
            
            VStack(alignment: .leading, spacing: 5){
                Text("\(data.name)")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text("\(data.email) ")
                    .font(.caption)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.gray)
              
            }
            
        }
    }
}

#Preview {
    UserList()
}
