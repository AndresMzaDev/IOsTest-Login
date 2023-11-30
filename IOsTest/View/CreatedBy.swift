//
//  CreatedBy.swift
//  IOsTest
//
//  Created by andres meza on 26/11/23.
//

import SwiftUI

struct CreatedBy: View {
    var body: some View {
        HStack{
            Spacer()
            Text("Created by")
                .font(.caption)
                .foregroundStyle(.gray)
            Text("Andres Meza")
                .font(.caption)
                .bold()
                .foregroundStyle(Color("ColorSecondary"))
            Spacer()
        }.padding(.top)
    }
}

#Preview {
    CreatedBy()
}
