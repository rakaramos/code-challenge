import XCTest

@testable import code_challenge

// swiftlint:disable line_length function_body_length
class ModelMappingTests: XCTestCase {

    func test_discoverMapping() {
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
                    """.data(using: .utf8)

        guard let data = input else {
            return XCTFail("Unable to convert from String to Data")
        }

        let decoder = JSONDecoder()

        do {
            let discover = try decoder.decode(Product<Discover>.self, from: data)

            XCTAssertTrue(discover.currentPage == 1)
            XCTAssertTrue(discover.pages == 93)
            XCTAssertTrue(discover.count == 1856)

            let first = discover.results.first

            XCTAssertTrue(first?.identifier == 156022)
            XCTAssertTrue(first?.votes == 4136)
            XCTAssertTrue(first?.isVideo == false)
            XCTAssertTrue(first?.title == "The Equalizer")
            XCTAssertTrue(first?.popularity == 24.573)
            XCTAssertTrue(first?.poster == "/2eQfjqlvPAxd9aLDs8DvsKLnfed.jpg")
            XCTAssertTrue(first?.originalLanguage == "en")
            XCTAssertTrue(first?.originalTitle == "The Equalizer")
            XCTAssertTrue(first?.genre == [53, 28, 80])
            XCTAssertTrue(first?.backdrop == "/hEJ52KqwOmyRpcihs10h7xOwN7e.jpg")
            XCTAssertTrue(first?.isAdult == false)
            XCTAssertTrue(first?.releaseDate == "2014-09-24")
            XCTAssertTrue(first?.overview == "In The Equalizer, Denzel Washington plays McCall, a man who believes he has put his mysterious past behind him and dedicated himself to beginning a new, quiet life. But when McCall meets Teri (Chloë Grace Moretz), a young girl under the control of ultra-violent Russian gangsters, he can’t stand idly by – he has to help her. Armed with hidden skills that allow him to serve vengeance against anyone who would brutalize the helpless, McCall comes out of his self-imposed retirement and finds his desire for justice reawakened. If someone has a problem, if the odds are stacked against them, if they have nowhere else to turn, McCall will help. He is The Equalizer.")

        } catch {
            XCTFail("\(error)\nCan't cast to \(String(describing: Product<Discover>.self))")
        }
    }
}
