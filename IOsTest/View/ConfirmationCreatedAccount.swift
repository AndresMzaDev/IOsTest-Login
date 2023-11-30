//
//  ConfirmationCreatedAccount.swift
//  IOsTest
//
//  Created by andres meza on 26/11/23.
//

import SwiftUI

struct ConfirmationCreatedAccount: View {
    var body: some View {
        VStack {
            Image(systemName: "checkmark.seal.fill")
                .foregroundStyle(.white)
                .font(.system(size: 130))
                .offset(x: 0, y: -100)
                
            Text("congratulations, you have created your account in our app, you can log in from the home menu")
                .bold()
                .font(.title3)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            
        }.background(
                Color("ColorSecondary")
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
        .padding()
    }
}

#Preview {
    ConfirmationCreatedAccount()
}
