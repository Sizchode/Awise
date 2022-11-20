//
//  profile.swift
//  Awise
//
//  Created by liu zhenke on 10/31/22.
//


import SwiftUI
import Foundation

struct Profile_Previews: PreviewProvider {
     static var previews: some View {
         NavigationView{
             ProfileView()
         }
    }
}

struct ProfileView: View{
    @State private var enable = true

    var body: some View {
        ZStack{
            Form {
                Image("signup")
                    .resizable()
                    .clipped()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 2.0))
                Section(header: Text("Basic Information")) {
                    HStack {
                        Text("First Name")
                        Spacer(minLength: 100)
                        Text("Zhenke")
                    }
                    HStack {
                        Text("Last Name")
                        Spacer(minLength: 100)
                        Text("Liu")
                    }
                }
                Section(header: Text("Additional")) {
                    HStack {
                        Text("Gender")
                        Spacer(minLength: 100)
                        Text("Male")
                    }
                }
            }.navigationBarHidden(true)
            HStack{
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        HStack {
                            NavigationLink(destination: HomeView()){
                                VStack {
                                    Image(systemName: "homekit")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
                                        .padding(.top, 10)
                                    Text("Home")
                                        .font(.footnote)
                                    Spacer()
                                }
                            }.accentColor(Color(.black))
                            NavigationLink(destination: QuizScroll()){
                                VStack {
                                    Image(systemName: "doc.richtext")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
                                        .padding(.top, 10)
                                    Text("Quiz")
                                        .font(.footnote)
                                    Spacer()
                                }
                            }.accentColor(Color(.black))
                            ZStack {
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                    .shadow(radius: 4)
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                    .foregroundColor(Color.pink)
                            }
                            .offset(y: -geometry.size.height/8/2)
                            NavigationLink(destination: HomeView()){
                                VStack {
                                    Image(systemName: "highlighter")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
                                        .padding(.top, 10)
                                    
                                    Text("Setting")
                                        .font(.footnote)
                                    Spacer()
                                }
                            }.accentColor(Color(.black))
                            NavigationLink(destination: signInPage()){
                                VStack {
                                    Image(systemName: "figure.walk.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
                                        .padding(.top, 10)
                                    
                                    Text("Log Out")
                                        .font(.footnote)
                                    Spacer()
                                }
                            }.accentColor(Color(.black))
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                    }
                }.edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}
