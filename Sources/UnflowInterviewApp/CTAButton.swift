import SwiftUI

struct CTAButton: View {
    var title: String
    var action: () -> ()
    var width: CGFloat = 250
    var height: CGFloat = 44
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(width: width, height: height)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
        }
    }
}
