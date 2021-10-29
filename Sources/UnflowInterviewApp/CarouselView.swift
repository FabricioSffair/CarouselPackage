import SwiftUI

enum PageStyle {
    case standard(title: String, text: String, image: String, backgroundImage: String)
}

public struct CarouselView: View {
    
    @State var currentPage: Int = 0
    @State var slideGesture: CGSize = CGSize.zero
    
    var pages: [PageStyle]
    
    public var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .center) {
                ForEach(0..<pages.count) { index in
                    switch pages[index] {
                    case .standard(let title, let text, let image, let backgrounImage):
                        PageView(image: image, title: title, text: text)
                            .offset(x: CGFloat(index) * UIScreen.main.bounds.size.width)
                            .offset(x: slideGesture.width - CGFloat(currentPage) * UIScreen.main.bounds.size.width)
                            .animation(.spring())
                            .gesture(DragGesture().onChanged{ value in
                                self.slideGesture = value.translation
                            }
                                        .onEnded{ value in
                                if self.slideGesture.width < -50 {
                                    if currentPage < pages.count - 1 {
                                        withAnimation {
                                            currentPage += 1
                                        }
                                    }
                                }
                                if self.slideGesture.width > 50 {
                                    if currentPage > 0 {
                                        withAnimation {
                                            currentPage -= 1
                                        }
                                    }
                                }
                                self.slideGesture = .zero
                            })
                    }
                    
                }
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    
    static var previews: some View {
        CarouselView(pages: [.standard(title: "", text: "", image: "", backgroundImage: "")])
    }
}
