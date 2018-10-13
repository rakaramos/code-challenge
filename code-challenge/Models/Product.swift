import Foundation

struct Product<Result: Decodable>: Decodable {
    let currentPage: Int
    let pages: Int
    let count: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case currentPage = "page"
        case pages = "total_pages"
        case count = "total_results"
        case results
    }
}
