//
//  RatingView.swift
//  Bookworm
//
//  Created by HEMANTH on 07/01/23.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating:Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage :Image?
    var onImage :Image = Image(systemName: "star.fill")
    
    var onColor = Color.yellow
    var offColor = Color.gray
    
    var body: some View {
        HStack{
            if label.isEmpty == false{
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1 , id: \.self){ number in
                image(for : number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture(perform: {
                        rating = number
                    })
            }
        }
    }
    
    func image(for number :Int ) -> Image{
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
            
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
