//
//  ListUserView.swift
//  IOsTest
//
//  Created by andres meza on 23/11/23.
//

import SwiftUI

struct ListUserView: View {
    
    var body: some View {
        VStack {
                    Text("Encabezado")
                        .font(.largeTitle)
                        .padding()

                    List {
                        Section(header: Text("Sección 1")) {
                            Text("Elemento 1")
                            Text("Elemento 2")
                            Text("Elemento 3")
                        }

                        Section(header: Text("Sección 2")) {
                            Text("Elemento 4")
                            Text("Elemento 5")
                        }
                    }
                    .listStyle(GroupedListStyle())

                    Spacer()

                    Text("Pie de página")
                        .font(.headline)
                        .padding()
                }
    }
}

#Preview {
    ListUserView()
}
