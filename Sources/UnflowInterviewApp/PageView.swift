//
//  PageView.swift
//  
//
//  Created by Fabrício Sperotto Sffair on 2021-10-29.
//

import SwiftUI

struct PageView: View {
    
    var image: String
    var title: String
    var text: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 50)
            
            Text(title)
                .font(.system(size: 30, design: .rounded))
                .fontWeight(.heavy)
                .padding(.bottom, 20)
            
            Text(text)
                .font(.system(size: 17, design: .rounded))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
        }
    .padding()
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(image: "", title: "Boogie Mode", text: "Use Audio Rooms for fun activities like socials. Turn on Boogie Mode to hve a random song play and so you can dance and get your heart pumping - the best part, nobody can see you!")
    }
}
