import Foundation

struct Config: Decodable {
    let pages: [Page]
}

struct Page: Decodable {
    let pageStyle: Int
    let title: String
    let message: String
    let buttonTitle: String
    let image: String
    let backgroundImage: String
}
