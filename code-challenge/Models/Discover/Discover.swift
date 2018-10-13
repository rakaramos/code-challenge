import Foundation

struct Discover: Decodable {
    let identifier: Int
    let title: String
    let votes: Int
    let isVideo: Bool
    let averageVote: Double
    let popularity: Double
    let poster: String
    let originalLanguage: String
    let originalTitle: String
    let genres: [Int]
    let backdrop: String
    let isAdult: Bool
    let overview: String
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
        case votes = "vote_count"
        case isVideo = "video"
        case averageVote = "vote_average"
        case popularity
        case poster = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genres = "genre_ids"
        case backdrop = "backdrop_path"
        case isAdult = "adult"
        case overview
        case releaseDate = "release_date"
    }
}
