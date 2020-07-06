//
//  FavoritesView.swift
//  iDine
//
//  Created by Jorge Rivero III on 7/5/20.
//  Copyright © 2020 Jorge Rivero III. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: Favorites
    func deleteItems(at offsets: IndexSet){
        favorites.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(favorites.items){ item in
                    ItemRow(item: item)
                }
                
            }.navigationBarTitle("Favorites").listStyle(GroupedListStyle())
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
