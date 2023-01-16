//
//  ContentView.swift
//  CarList
//
//  Created by Pooja on 2023-01-14.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject public var carListVM: CarListViewModel
    @State var projectManager = ProjectManager()
    @State private var selectedMake: String
    @State private var selectedModel: String
    @State private var makeList: [String]
    @State private var modelList: [String]

    init() {
        self.carListVM = CarListViewModel()
        self.selectedMake = "Any make"
        self.selectedModel = "Any model"
        self.makeList = []
        self.modelList = []
        self.carListVM.decodeCarList()
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
                        Menu {
                            ForEach(self.makeList.count==0 ? self.carListVM.makes : self.makeList , id: \.self) { make in
                                Button(make){
                                    self.selectedMake = make
                                    
                                    self.carListVM.filterCars = self.carListVM.cars.filter {
                                        $0.make == self.selectedMake
                                    }
//                                    if (self.selectedModel=="Any model"){
                                        
                                        var modelList:[String] = []

                                        for car in self.carListVM.filterCars {
                                            modelList.insert(car.model, at: 0)
                                        }
                                        
                                        self.modelList = modelList
                                        self.selectedModel = "Any model"
                                        print(self.modelList)
//                                    }
                                }
                                Divider()
                            }
                        } label: {
                            Text (self.selectedMake)
                                .font(.system(size: 16, weight: .semibold))
                                .padding()
                            Spacer()
                        }
                        .frame( height: 40)
                        .font(.title)
                        .foregroundColor(Color("DarkGray"))
                        .background(Color("White"))
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))


                        
                        // model element
                        Menu {
                            ForEach(self.modelList.count==0 ? self.carListVM.models : self.modelList, id: \.self) { model in
                                Button(model){
                                    self.selectedModel = model
                                    
                                    self.carListVM.filterCars = self.carListVM.cars.filter {
                                        $0.model == self.selectedModel
                                    }
//                                    if (self.selectedMake=="Any make"){
                                        
                                        var makeList:[String] = []

                                        for car in self.carListVM.cars {
                                            makeList.insert(car.make, at: 0)
                                        }
                                        
                                        self.makeList = makeList
//                                    }

                                }
                                Divider()
                            }
                        } label: {
                            Text (self.selectedModel)
                                .font(.system(size: 16, weight: .semibold))
                                .padding()
                            Spacer()
                        }
                        .frame( height: 40)
                        .font(.title)
                        .foregroundColor(Color("DarkGray"))
                        .background(Color("White"))
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))

                    }
                    .background(Color("DarkGray"))
                    .cornerRadius(16)
                    .padding()

                    
                    // car list element
                    CarListView(cars:  self.carListVM.cars, projectManager: projectManager, carListVM: self.carListVM)
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
