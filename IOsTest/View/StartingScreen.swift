//
//  ContentView.swift
//  IOsTest
//
//  Created by andres meza on 22/11/23.
//

import SwiftUI

struct StartingScreen: View {
    var gradient = Gradient(colors: [Color("ColorGradPrimary"), Color("ColorGradPrimary")])
    @State private var showSheet: Bool = false
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    @ObservedObject var screen : ScreenManagementStart
    
//    init(modelo: MiModelo) {
//           self.modelo = modelo
//       }
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                Rectangle()
                    .fill(Color("ColorSecondary"))
                    .frame(width: 50)
                    .rotationEffect(.degrees(rotation))
                    .scaleEffect(CGFloat(scaleXY))
                    .animation(Animation.easeOut(duration: 5).speed(1))
                    .onAppear() {
                        rotation += 20
                        scaleXY += 1.5
                    }
                    .opacity(0.3)
                VStack(alignment: .leading){
                    //                    InicioSesionView()
                    
                    Rectangle()
                        .fill(Color("ColorSecondary"))
                        .frame(width: 80)
                        .rotationEffect(.degrees(rotation))
                        .scaleEffect(CGFloat(scaleXY))
                        .animation(Animation.easeOut(duration: 5).speed(1))
                        .onAppear() {
                            rotation += 360
                            scaleXY += 1.2
                        }
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("Start Here")
                        .foregroundStyle(Color(.white))
                        .fontWeight(.heavy)
                        .font(.custom( "Courier" ,size: 70))
                        .padding(.bottom , 70)
                        .frame(width: 250.0)
                    
                    HStack( ){
                        Spacer()
                        
                        Button(action: {screen.changesState()} , label: {
//                            Button(action: {ScreenManagementStart().changesState()} , label: {
                            Image(systemName: "arrow.right")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical , 30.0)
                                .frame( width: 80)
                                .background(Color("ColorSecondary")
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.3), radius: 20.0, x: 0.0, y: 10))
                        })
                        
                        //                        NavigationLink(destination:  HomeView())
                        //                        {
                        //                            Image(systemName: "arrow.right")
                        //                                .font(.headline)
                        //                                .fontWeight(.bold)
                        //                                .foregroundColor(.white)
                        //                                .padding(.vertical , 30.0)
                        //                                .frame( width: 80)
                        //                                .background(Color("ColorSecondary")
                        //                                    .cornerRadius(15)
                        //                                    .shadow(color: Color.black.opacity(0.3), radius: 20.0, x: 0.0, y: 10))
                        //                        }
                        
                    }
                    
                    
                }.padding(14)
                
            }
            
        }
    }
}



func login(){
    
}

#Preview {
    StartingScreen(screen: ScreenManagementStart())
}
