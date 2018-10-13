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

    enum Discover: String, CodingKey {
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

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Discover.self)
        identifier = try values.decode(Int.self, forKey: .identifier)
        title = try values.decode(String.self, forKey: .title)
        votes = try values.decode(Int.self, forKey: .votes)
        isVideo = try values.decode(Bool.self, forKey: .isVideo)
        averageVote = try values.decode(Double.self, forKey: .averageVote)
        popularity = try values.decode(Double.self, forKey: .popularity)
        poster = try values.decode(String.self, forKey: .poster)
        originalLanguage = try values.decode(String.self, forKey: .originalLanguage)
        originalTitle = try values.decode(String.self, forKey: .originalTitle)
        genres = try values.decode([Int].self, forKey: .genres)
        backdrop = try values.decode(String.self, forKey: .backdrop)
        isAdult = try values.decode(Bool.self, forKey: .isAdult)
        overview = try values.decode(String.self, forKey: .overview)
        releaseDate = try values.decode(String.self, forKey: .releaseDate)
    }
}
