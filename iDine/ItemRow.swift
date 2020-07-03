//
//  ItemRow.swift
//  iDine
//
//  Created by Jorge Rivero III on 5/9/20.
//  Copyright © 2020 Jorge Rivero III. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        
        HStack{
            Image(item.thumbnailImage).clipShape(Circle()).overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
            VStack(alignment: .leading){
                Text(item.name).font(.headline)
                Text(String("$\(item.price)"))
            }
            ForEach(item.restrictions, id:\.self){ restriction in
                Text(restriction)
                    .font(.caption).fontWeight(.black).padding(5).clipShape(Circle()).foregroundColor(.white).background(Self.colors[restriction, default: .black])
                
            }
            
        }
        
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
