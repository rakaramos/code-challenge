import Foundation

struct Product<Result: Decodable>: Decodable {
    let currentPage: Int
    let pages: Int
    let count: Int
    let results: [Result]

    enum Product: String, CodingKey {
        case currentPage = "page"
        case pages = "total_pages"
        case count = "total_results"
        case results
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Product.self)
        currentPage = try values.decode(Int.self, forKey: .currentPage)
        pages = try values.decode(Int.self, forKey: .pages)
        count = try values.decode(Int.self, forKey: .count)
        results = try values.decode([Result].self, forKey: .results)
    }
}
