//
//  homeView.swift
//  IOsTest
//
//  Created by andres meza on 23/11/23.
//

import SwiftUI

struct HomeView: View {
    var gradient = Gradient(colors: [Color("ColorGradPrimary"), Color("ColorGradPrimary")])
    
    let imageSize = 300
    @State private var yOffset: CGFloat = 0.0
    @State private var isFloating = true
    @StateObject var useStore = UserStore()
    
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                //                LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                
                //                circleBackground()
                
                VStack(alignment: .leading){
                    
                    
                    Image("MenWithPhone")
                        .resizable()
                        .frame(width: 350, height: 350)
                    Text("Welcome!!!")
                        .bold()
                        .font(.largeTitle)
                        .foregroundStyle(Color("ColorSecondary"))
                        .padding(.vertical, 12)
                        
                    Text("Learn to use it")
                        .bold()
                        .font(.title2)
                        .foregroundStyle(Color("ColorPrimary"))
                        .padding(.bottom, 1)
                    Text("This app is simple, you just have to register in it and create your account. Very easy")
                        .bold()
                        .font(.body)
                        .foregroundStyle(.gray)
                        
                    Spacer()
                    HStack{
                        
                        NavigationLink(destination:  CreatedAccount())
                        {
                            Text("Sign Up")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical , 20.0)
                                .frame( maxWidth: .infinity, alignment: .center)
                                .background(Color("ColorPrimary")
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.3), radius: 20.0, x: 0.0, y: 10))
                        }
                        
                        NavigationLink(destination:  LoginView())
                        {
                            Text("Sign In")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.vertical , 20.0)
                                .frame( width: 120, alignment: .center)
                                .background(Color.white)
                                .foregroundColor(Color("ColorPrimary"))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        }
                          
                    }
                    
                    CreatedBy()
                }.padding(10)
                
                
            }
            
        }.environmentObject(useStore)
    }
}



struct circleBackground: View {
    @State private var animationAmount = 1.0
    @State var scaleXY = 1.0
    
    var body: some View {
        Circle()
            .fill(Color("ColorSecondary"))
            .frame(width: 60)
            .scaleEffect(scaleXY + 2)
            .opacity(2 - animationAmount)
            .animation(.easeInOut(duration: 2).speed(0.1).repeatForever(autoreverses: true))
            .onAppear() {
                scaleXY += 3.0
            }
        
        Circle()
            .fill(Color("ColorSecondary"))
            .shadow(color: Color.black.opacity(0.3), radius: 20.0, x: 0.0, y: 10)
            .frame(width: 60)
            .scaleEffect(scaleXY)
            .opacity(0.5)
            .animation(.easeInOut(duration: 2).speed(0.1).repeatForever(autoreverses: true))
            .onAppear() {
                scaleXY += 2.0
            }
            .position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
        
        Circle()
            .fill(Color("ColorSecondary"))
            .shadow(color: Color.black.opacity(0.3), radius: 20.0, x: 0.0, y: 10)
            .frame(width: 60)
            .scaleEffect(scaleXY)
            .opacity(0.1)
            .animation(.easeInOut(duration: 2).speed(0.1).repeatForever(autoreverses: true))
            .onAppear() {
                scaleXY += 1.0
            }
            .position(CGPoint(x: 360.0, y: 60.0))
        Circle()
            .fill(Color("ColorSecondary"))
            .shadow(color: Color.black.opacity(0.3), radius: 20.0, x: 0.0, y: 10)
            .frame(width: 60)
            .scaleEffect(scaleXY)
            .opacity(0.5)
            .animation(.easeInOut(duration: 2).speed(0.1).repeatForever(autoreverses: true))
            .onAppear() {
                scaleXY += 1.0
            }
            .position(CGPoint(x: 360.0, y: 700.0))
    }
}


#Preview {
    HomeView()
}
