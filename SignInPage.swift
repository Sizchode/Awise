struct signInPage: View {
    @State var account = ""
    @State var password = ""
    var body: some View {
        ZStack{
            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top,80)
                Text("A Wise Room mate")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding()
                Text("Please log in to continue")
                    .foregroundColor(Color.black.opacity(0.5))
                    .fontWeight(.heavy)
                    .padding()
                GroupBox{
                    HStack{
                        //account
                        Image(systemName: "person.fill")
                            .font(.title2)
                            .foregroundColor(.black)
                            .frame(width: 35)
                        
                        TextField("Account", text: $account)
                            .autocapitalization(.none)
                            .fontWeight(.heavy)
                    }
                }
                .background(Color.black.opacity(account == "" ? 0 : 0.12))
                .cornerRadius(15)
                .padding()
                .frame(width:400, height: 80)
                GroupBox{
                    HStack{
                        //password
                        Image(systemName: "lock.fill")
                            .font(.title2)
                            .foregroundColor(.black)
                            .frame(width: 35)
                        SecureField("Password", text: $password)
                            .autocapitalization(.none)
                            .fontWeight(.heavy)
                    }
                }
                .background(Color.black.opacity(password == "" ? 0 : 0.12))
                .cornerRadius(15)
                .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
                .frame(width:400, height: 80)
                HStack{
                    Spacer()
                    NavigationLink(destination: forgetPassword()){
                        Text("Forget your password?")
                            .underline()
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
                .frame(width:400, height: 80)
                NavigationLink(destination: HomePageView()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(width:350, height:60)
                        HStack{
                            Image(systemName: "chevron.forward.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                            Text("Log in")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 150)
                                .clipShape(Capsule())
                        }
                    }
                }
                .padding([.leading, .bottom, .trailing])
                Divider()
                NavigationLink(destination: SignUpPage()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(width:350, height:60)
                        HStack{
                            
                            Image(systemName: "person.fill.badge.plus")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                
                            Text("Register")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 150)
                                .clipShape(Capsule())
                        }
                    }
                }
                .padding([.leading, .bottom, .trailing])
            }
        }.navigationBarHidden(true)
        .cornerRadius(20)
        .padding()
    }
}
