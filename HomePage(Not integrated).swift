import SwiftUI
//Homepage view
struct HomePageView: View {
    @State var isShowing = false
    @State var dark = false
    var body: some View{
        //NavigationView{
            ZStack(){
                if isShowing{
                    SideMenuHeaderView(dark: self.$dark, isShowing: self.$isShowing)
                        .preferredColorScheme(self.dark ? .dark : .light)
                }
                HomeView()
                    .cornerRadius(isShowing ? 20 : 10)
                    .offset(x:isShowing ? 300 : 0, y:isShowing ? 44:0)
                    .scaleEffect(isShowing ? 0.8 : 1)
                    .toolbar{
                        ToolbarItemGroup(placement:.navigationBarTrailing){
                            Button(action:{
                                withAnimation(.spring()){
                                    isShowing.toggle()
                            
                                }
                            },
                                           label:{
                                Image(systemName: "line.3.horizontal")
                                    .foregroundColor(.black)
                                    .padding(.trailing)
                                    .frame(width: 10.0, height: 10.0)
                                               
                                           })
                        }
                    }
                    .navigationTitle("Roommate")
            }
    }
}



struct HomeView: View{
    var body: some View {
        ZStack{
            ZStack{
                ForEach(Card.data.reversed()){card in
                    CardView(card: card).padding(8)
                }
            }.frame(width: 100, height:  575)
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
                            NavigationLink(destination: SettingView()){
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
                }         .edgesIgnoringSafeArea(.bottom)
                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

//card view
struct CardView: View{
    @State var card: Card
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    var body: some View{
        ZStack(alignment: .leading){
            Image(card.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:400)
            LinearGradient(gradient: cardGradient,startPoint: .top, endPoint: .bottom)
            VStack{
                
            }
            .padding()
            //.foregroundColor(.white)
            /*HStack{
                Image("h")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150)
            }*/
            VStack{
                Spacer()
                VStack(alignment: .leading){
                    HStack{
                        //Text("Alice Awise").font(.largeTitle).fontWeight(.bold)
                        Text(card.name).font(.largeTitle).fontWeight(.bold)
                        //Text("Freshman")
                        Text(card.bio)
                    }
                    Text(card.imageName)
                }
            }
            .padding()
            .foregroundColor(.white)
        }
        .cornerRadius(8)
        .offset(x: card.x, y:card.y)
        .rotationEffect(.init(degrees: card.degree))
        .gesture(
            DragGesture()
                
                .onChanged{value in
                    withAnimation(.default){
                        card.x = value.translation.width
                        card.y = value.translation.height
                        card.degree = 7*(value.translation.width > 0 ? 1: -1)
                    }
                }
            
                .onEnded{
                    value in
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50,damping: 8,
                                                       initialVelocity:0)){
                        switch value.translation.width{
                        case 0...100:
                            card.x = 0; card.degree = 0; card.y = 0
                        case let x where x>100:
                            card.x = 500; card.degree = 12
                        case (-100)...(-1):
                            card.x = 0; card.degree = 0; card.y = 0
                        case let x where x < -100:
                            card.x = -500; card.degree = -12
                        default: card.x = 0; card.y = 0
                        }
                    }
                }
        )
    }
}
