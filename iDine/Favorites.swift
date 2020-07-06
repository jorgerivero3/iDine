//
//  Favorites.swift
//  iDine
//
//  Created by Jorge Rivero III on 7/5/20.
//  Copyright © 2020 Jorge Rivero III. All rights reserved.
//

import Foundation

class Favorites: ObservableObject{
    @Published var items = [MenuItem]()
    
    func add(item: MenuItem){
        self.items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
