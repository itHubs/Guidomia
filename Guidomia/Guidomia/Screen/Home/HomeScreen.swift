//
//  ContentView.swift
//  CarList
//
//  Created by Pooja on 2023-01-14.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject private var carListVM: CarListViewModel

    init() {
        self.carListVM = CarListViewModel()
        self.carListVM.decodeCarList()
        
//        UINavigationBar.appearance().backgroundColor = .orange
//        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]

    }

    var body: some View {
//        NavigationView {
            VStack(spacing: 0){
                // header element
                HStack(spacing: 0) {
                    // Navigationbar Title Element
                    Text("GUIDOMIA")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color("White"))
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                        .padding()
                    
                    Spacer()
                    
                    // Navigationbar button
                    Button(action: {
                        print("Button tapped!")

                    }) {
                        Image("menu")
                            .resizable()
                            .scaledToFit()

                    }
                    .padding()

                }
                .background(Color("Orange"))
                .frame( height: 54)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0 ))

                // body element
                ScrollView{
                    // image element with title element
                    ZStack{
                        // image element
                        Image("Tacoma")
                            .resizable()
                            .scaledToFit()

                        
                        // title element
                        VStack{
                            Spacer()
                            
                            // title element
                            Text("Tacoma 2021")
                                .font(.system(size: 42, weight: .bold))
                                .foregroundColor(Color("White"))
                                .frame(maxWidth: .infinity,
                                       alignment: .leading)

                            // subtitle element
                            Text("Get your's now")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color("White"))
                                .frame(maxWidth: .infinity,
                                       alignment: .leading)
                                .padding(.leading, 8)
                                .padding(.bottom, 8)

                        }
                        .padding()
                    }
                    
                    // filter element
                    VStack(spacing: 0){
                        // title element
                        Text("Filters")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(Color("White"))
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))

                        // make element
                        Button {
                            print("Any make tapped!")
                        } label: {
                            Text ("Any make")
                                .font(.system(size: 16, weight: .semibold))
                                .padding()
                            Spacer()
                        }
                        .frame( height: 40)
                        .font(.title)
                        .foregroundColor(Color("DarkGray"))
                        .background(Color("White"))
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))


                        
                        // model element
                        Button {
                            print("Any model tapped!")
                        } label: {
                            Text ("Any model")
                                .font(.system(size: 16, weight: .semibold))
                                .padding()
                            Spacer()
                        }
                        .frame( height: 40)
                        .font(.title)
                        .foregroundColor(Color("DarkGray"))
                        .background(Color("White"))
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 24, trailing: 16))

                    }
                    .background(Color("DarkGray"))
                    .cornerRadius(16)
                    .padding()


                    
                    // car list element

                    CarListView(cars:  self.carListVM.cars, selectedCell: "")
                        .background(Color("black"))
                        
                }
                
                
            }
            
        }

}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .previewDevice("iPhone 13 Pro Max")
    }
}
