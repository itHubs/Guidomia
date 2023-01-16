//
//  CarRow.swift
//  CarList
//
//  Created by Pooja on 2023-01-14.
//

import SwiftUI


struct CarListView: View {
    
    let cars: [CarViewModel]
    let selectedCell: String

    var body: some View {
        // list element
        VStack(alignment: .leading) {
            ForEach(cars) { car in
                CarListCell(car: car, selectedCell: selectedCell)
            }
        }
    }
}

struct CarListCell: View {
    
    var car: CarViewModel
    @State public var selectedCell: String
    
    var body: some View {
        VStack(spacing: 0){
            VStack(spacing: 0) {
                
                HStack(spacing: 0) {
                    // car image element
                    Image(car.image)
                        .resizable()
                        .frame( width:110, height: 60)
                        .scaledToFit()
                        .padding()
                    
                    // car detail element
                    VStack {
                        // car name element
                        Text(car.title)
                            .font(.headline)
                            .foregroundColor(Color("Text"))
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                        
                        // car price element
                        Text(car.subTitle)
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(Color("Text"))
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)


                        // car rating element
                        HStack{
                            RatingView(
                                rating: car.rating,
                                color: Color("Orange"),
                                backgroundColor: Color("DarkGray")
                            )
                            .frame(width:100, height: 13, alignment: .leading )
                            Spacer()
                        }
                    }

                }
                
                if (selectedCell == car.title) {
                    // pros title element
                    
                    if (car.pros.count>0)
                    {
                        Text("Pros :")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Color("Text"))
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 4, trailing: 20))
                    }


                    VStack(alignment: .leading) {
                        ForEach(car.pros, id: \.self) { pro in
                            if (pro.count>0)
                            {
                                HStack {
                                    Circle()
                                        .strokeBorder(Color("Orange"),lineWidth: 0)
                                        .background(Circle().foregroundColor(Color("Orange")))
                                        .frame(width: 6, height: 6)
                                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))

                                    Text(pro)
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(Color("Black"))
                                        .frame(maxWidth: .infinity,
                                               alignment: .leading)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 26))
                                }

                            }

                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))

                    
                    //cons title element
                    
                    if (car.cons.count>0)
                    {
                        Text("Cons :")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Color("Text"))
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 4, trailing: 20))
                    }

                    VStack(alignment: .leading) {
                        ForEach(car.cons, id: \.self) { con in
                            
                            if (con.count>0)
                            {
                                HStack {
                                    Circle()
                                        .strokeBorder(Color("Orange"),lineWidth: 0)
                                        .background(Circle().foregroundColor(Color("Orange")))
                                        .frame(width: 6, height: 6)
                                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))

                                    Text(con)
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(Color("Black"))
                                        .frame(maxWidth: .infinity,
                                               alignment: .leading)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 26))
                                }

                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 16, trailing: 26))
                }

                
            }
            .background(Color("LightGray"))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0 ))
            
            // Cell separator element
            Divider()
                .frame( height: 4)
                .background(Color("Orange"))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 2, trailing: 0 ))

        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0 ))
        .onTapGesture {
            self.selectedCell = self.car.title
        }

    }
}

