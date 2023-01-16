//
//  CarRow.swift
//  CarList
//
//  Created by Pooja on 2023-01-14.
//

import SwiftUI

struct CarListView: View {
    
     let cars: [CarViewModel]
    let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        // list element
        VStack(alignment: .leading) {
            ForEach(cars) { car in
                CarListCell(car: car)
            }
        }
    }
}

struct CarListCell: View {
    
    var car: CarViewModel
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0) {
                
                // car image element
                Image(car.image)
                    .resizable()
                    .frame( width:120, height: 60)
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
            .background(Color("LightGray"))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0 ))
            
            // Cell separator element
            Divider()
                .frame( height: 4)
                .background(Color("Orange"))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 2, trailing: 0 ))

        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0 ))

    }
}

