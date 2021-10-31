import SwiftUI

enum PageStyle {
    case standard(title: String, text: String, image: String, buttonTitle: String?, backgroundImage: String)
    
    var backgroundImage: Image {
        switch self {
        case .standard(_, _, _, _, let backgroundImage):
            return Image(backgroundImage)
        }
    }
    
    var showButton: Bool {
        switch self {
        case .standard(_, _, _, let buttonTitle, _):
            return buttonTitle != nil
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .standard(_, _, _, let buttonTitle, _):
            return buttonTitle ?? ""
        }
    }
}

public struct CarouselView: View {
    
    enum MoveDirection {
        case next, previous
    }
    
    @State var currentPage: Int = 0
    @State var slideGesture: CGSize = CGSize.zero
    @State var backgroundImage: Image?
    
    var pages: [PageStyle]
    
    public var body: some View {
        ZStack {
            if let image = backgroundImage {
                image
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
            } else {
                Color(.systemBackground).edgesIgnoringSafeArea(.all)
            }
            
            ZStack(alignment: .center) {
                ForEach(0..<pages.count) { index in
                    switch pages[index] {
                    case .standard(let title, let text, let image, _, _):
                        PageView(image: image, title: title, text: text)
                            .offset(x: CGFloat(index) * UIScreen.main.bounds.size.width)
                            .offset(x: slideGesture.width - CGFloat(currentPage) * UIScreen.main.bounds.size.width)
                            .animation(.spring())
                            .gesture(DragGesture().onChanged{ value in
                                self.slideGesture = value.translation
                            }
                            .onEnded{ value in
                                if self.slideGesture.width < -50 {
                                    move(to: .next)
                                }
                                if self.slideGesture.width > 50 {
                                    move(to: .previous)
                                }
                                self.slideGesture = .zero
                            })
                    }
                }
            }
            VStack {
                Spacer()
                if pages[currentPage].showButton {
                    CTAButton(title: pages[currentPage].buttonTitle) {
                        move(to: .next)
                    }
                }
            }
            .onAppear {
                if pages.count > 0 {
                    backgroundImage = pages[currentPage].backgroundImage
                }
            }
        }
    }
    
    private func move(to direction: MoveDirection) {
        switch direction {
        case .next:
            if currentPage < pages.count - 1 {
                withAnimation {
                    currentPage += 1
                }
            }
        case .previous:
            if currentPage > 0 {
                withAnimation {
                    currentPage -= 1
                }
            }
        }
        changeBackground()
    }
    
    private func changeBackground() {
        backgroundImage = pages[currentPage].backgroundImage
        
    }
    
}

struct CarouselView_Previews: PreviewProvider {
    
    static var previews: some View {
        CarouselView(pages: [.standard(title: "", text: "", image: "", buttonTitle: "Next", backgroundImage: "")])
    }
}
