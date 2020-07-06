//
//  ItemDetail.swift
//  iDine
//
//  Created by Jorge Rivero III on 7/3/20.
//  Copyright © 2020 Jorge Rivero III. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    var favText = "Add to favorites"
    var item: MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                Text("Photo \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description).padding()
            Spacer()
            HStack{
                
                Button("Add to order"){
                    self.order.add(item: self.item)
                }.frame(minWidth:0, maxWidth: .infinity)
                    .font(.title)
                    .padding(15)
                    
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(40)
                    .padding(.horizontal, 10)
                    .border(Color.purple, width: 0)
                    .offset(y: -30)
            }
            
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    .navigationBarItems(trailing:
        Button(action: {
            if(self.favorites.items.contains(self.item)){
                self.favorites.remove(item: self.item)
            }else{
                self.favorites.add(item: self.item)
            }

        }){
            if (self.favorites.items.contains(self.item)){
                Image(systemName: "star.fill")
            }else{
                Image(systemName: "star")
            }
            
    }.foregroundColor(Color.yellow))
    }
    
}


struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        TabView{
            NavigationView{
                ItemDetail(item: MenuItem.example).environmentObject(order)
            }
        }
        
    }
}
