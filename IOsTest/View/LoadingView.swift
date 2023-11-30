//
//  LoadingView.swift
//  IOsTest
//
//  Created by andres meza on 26/11/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
        VStack {
            ProgressView("Wait a moment...")
                .progressViewStyle(CircularProgressViewStyle() )
                .padding()
                
        }.frame(width: 180, height: 180)
            .background(RoundedRectangle(cornerRadius: 10).fill(.white) )
            .padding( 12)
            
        
    }
}

#Preview {
    LoadingView()
}
