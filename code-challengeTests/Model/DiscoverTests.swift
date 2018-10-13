import XCTest

@testable import code_challenge

class ModelMappingTests: XCTestCase {

    func test_discoverMapping() throws {
        let input = """
                    {
                      "page": 1,
                      "total_results": 1856,
                      "total_pages": 93,
                      "results": [
                        {
                          "vote_count": 4136,
                          "id": 156022,
                          "video": false,
                          "vote_average": 7.1,
                          "title": "The Equalizer",
                          "popularity": 24.573,
                          "poster_path": "/2eQfjqlvPAxd9aLDs8DvsKLnfed.jpg",
                          "original_language": "en",
                          "original_title": "The Equalizer",
                          "genre_ids": [
                            53,
                            28,
                            80
                          ],
                          "backdrop_path": "/hEJ52KqwOmyRpcihs10h7xOwN7e.jpg",
                          "adult": false,
                          "overview": "In The Equalizer, Denzel Washington plays McCall, a man who believes he has put his mysterious past behind him and dedicated himself to beginning a new, quiet life. But when McCall meets Teri (Chloë Grace Moretz), a young girl under the control of ultra-violent Russian gangsters, he can’t stand idly by – he has to help her. Armed with hidden skills that allow him to serve vengeance against anyone who would brutalize the helpless, McCall comes out of his self-imposed retirement and finds his desire for justice reawakened. If someone has a problem, if the odds are stacked against them, if they have nowhere else to turn, McCall will help. He is The Equalizer.",
                          "release_date": "2014-09-24"
                        }
                      ]
                    }
                    """.data(using: .utf8)!

        let decoder = JSONDecoder()

        let discover = try decoder.decode(Product<Discover>.self, from: input)

        XCTAssertEqual(discover.currentPage, 1)
        XCTAssertEqual(discover.pages, 93)
        XCTAssertEqual(discover.count, 1856)

        let first = discover.results.first

        XCTAssertEqual(first?.identifier, 156022)
        XCTAssertEqual(first?.votes, 4136)
        XCTAssertEqual(first?.isVideo, false)
        XCTAssertEqual(first?.title, "The Equalizer")
        XCTAssertEqual(first?.popularity, 24.573)
        XCTAssertEqual(first?.poster, "/2eQfjqlvPAxd9aLDs8DvsKLnfed.jpg")
        XCTAssertEqual(first?.originalLanguage, "en")
        XCTAssertEqual(first?.originalTitle, "The Equalizer")
        XCTAssertEqual(first?.genres, [53, 28, 80])
        XCTAssertEqual(first?.backdrop, "/hEJ52KqwOmyRpcihs10h7xOwN7e.jpg")
        XCTAssertEqual(first?.isAdult, false)
        XCTAssertEqual(first?.releaseDate, "2014-09-24")
        XCTAssertEqual(first?.overview, "In The Equalizer, Denzel Washington plays McCall, a man who believes he has put his mysterious past behind him and dedicated himself to beginning a new, quiet life. But when McCall meets Teri (Chloë Grace Moretz), a young girl under the control of ultra-violent Russian gangsters, he can’t stand idly by – he has to help her. Armed with hidden skills that allow him to serve vengeance against anyone who would brutalize the helpless, McCall comes out of his self-imposed retirement and finds his desire for justice reawakened. If someone has a problem, if the odds are stacked against them, if they have nowhere else to turn, McCall will help. He is The Equalizer.")
    }
}
