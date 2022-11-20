//
//  setting view.swift
//  Awise
//
//  Created by liu zhenke on 10/24/22.
//

import SwiftUI

struct Setting_Previews: PreviewProvider {
     static var previews: some View {
         NavigationView{
             SettingView()
         }
    }
}

struct SettingView: View{
    var body: some View {
        ZStack{
            ZStack{
                Image(systemName: "arrow.left")
            }
            Form{
                Section(header: Text("Setting"),footer:Text("")){
                    
                    Toggle(isOn:.constant(true),
                           label:{
                        Text("Normal mode")
                    })
                    Toggle(isOn: .constant(true), label: {
                        Text("Tinder Recommendation")
                    })
                }
            }.navigationBarHidden(true)
            HStack{
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        HStack {
                            NavigationLink(destination: ProfileView()){
                                VStack {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
                                        .padding(.top, 10)
                                    Text("Profile")
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
