//
//  CreatedAccount.swift
//  IOsTest
//
//  Created by andres meza on 26/11/23.
//

import SwiftUI

struct CreatedAccount: View {
    @StateObject private var PageHandler = ConfirmPageHandler()
    
    var body: some View {

        if PageHandler.PageHandler {
            SignUpView(handler: PageHandler)
        } else {
            ConfirmationCreatedAccount().transition(.slide)
        }
    }
}

#Preview {
    CreatedAccount()
}
