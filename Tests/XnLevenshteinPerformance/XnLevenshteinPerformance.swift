import XCTest
import XnLevenshtein

final class PerformanceTests: XCTestCase {
    let smallA = String(repeating: "a", count: 10)
    let smallB = String(repeating: "b", count: 10)
    let mediumA = String(repeating: "a", count: 1_000)
    let mediumB = String(repeating: "b", count: 1_000)
    
    func testLevenshteinDistance_SmallStrings() {
        measure {
            for _ in 0..<100 {
                _ = levenshteinDistance(smallA, smallB)
            }
        }
    }
    
    func testLevenshteinDistance_MediumStrings() {
        measure {
            for _ in 0..<100 {
                _ = levenshteinDistance(mediumA, mediumB)
            }
        }
    }
    
    func testLevenshteinDistance_RandomStrings() {
        let length = 100
        let randomData: [(String, String)] = (0..<10).map { _ in
            (randomAlphabeticString(length: length), randomAlphabeticString(length: length))
        }
        
        measure {
            for (strA, strB) in randomData {
                _ = levenshteinDistance(strA, strB)
            }
        }
    }
    
    private func randomAlphabeticString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
}
