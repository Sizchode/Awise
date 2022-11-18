struct HomeView: View{
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    var body: some View{
        
        VStack{
            //top stack
            HStack{
            }
            .padding(.horizontal)
            //card View
            ZStack{
                ForEach(Card.data.reversed()){card in
                     CardView(card: card).padding(8)
                 }
            }
            Spacer()

            //Bottom Stack
            HStack{
                GeometryReader { geometry in
                     VStack {
                         HStack {
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
                          }
                              .frame(width: geometry.size.width, height: geometry.size.height/8)
                     }
                 }         .edgesIgnoringSafeArea(.bottom)

            }

        }
    }
}
