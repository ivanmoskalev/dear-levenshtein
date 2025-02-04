import Testing
import DearLevenshtein

@Test
func stringDistances() async throws {
    #expect(levenshteinDistance("gumbo", "gambol") == 2)
    #expect(levenshteinDistance("saturday", "sunday") == 3)
    #expect(levenshteinDistance("a", "b") == 1)
    #expect(levenshteinDistance("ab", "ac") == 1)
    #expect(levenshteinDistance("ac", "bc") == 1)
    #expect(levenshteinDistance("abc", "axc") == 1)
    #expect(levenshteinDistance("xabxcdxxefxgx", "1ab2cd34ef5g6") == 6)
    #expect(levenshteinDistance("xabxcdxxefxgx", "abcdefg") == 6)
    #expect(levenshteinDistance("javawasneat", "scalaisgreat") == 7)
    #expect(levenshteinDistance("example", "samples") == 3)
    #expect(levenshteinDistance("sturgeon", "urgently") == 6)
    #expect(levenshteinDistance("levenshtein", "frankenstein") == 6)
    #expect(levenshteinDistance("distance", "difference") == 5)
    #expect(levenshteinDistance("kitten", "sitting") == 3)
    #expect(levenshteinDistance("Tier", "Tor") == 2)
    #expect(levenshteinDistance("hello", "hola") == 3)
    #expect(levenshteinDistance("abcdef", "azced") == 3)
    #expect(levenshteinDistance("intention", "execution") == 5)
}

@Test
func emoji() async throws {
    #expect(levenshteinDistance("😄", "😦") == 1)
    #expect(levenshteinDistance("😘", "😘") == 0)
    #expect(levenshteinDistance("👨‍👩‍👦", "👩‍👩‍👦") == 1)
    #expect(levenshteinDistance("🔥", "💧") == 1)
    #expect(levenshteinDistance("🐱", "🐶") == 1)
}

@Test
func inverseDistances() async throws {
    let pairs = [("gumbo", "gambol"), ("saturday", "sunday"), ("kitten", "sitting"), ("hello", "hola"), ("levenshtein", "frankenstein"), ("👨‍👩‍👦", "👩‍👩‍👦")]
    for (a, b) in pairs {
        let forward = levenshteinDistance(a, b)
        let backward = levenshteinDistance(b, a)
        #expect(forward == backward)
    }
}

@Test
func fuzz() async throws {
    let sizeRange = 0...20
    let unicodeScalars = (0x0020...0xFFFF).compactMap { UnicodeScalar($0) }
    let characters = unicodeScalars.map { String($0) }
    for _ in 0..<1_000_000 {
        let length1 = Int.random(in: sizeRange)
        let length2 = Int.random(in: sizeRange)
        let str1 = (0..<length1).map { _ in characters.randomElement()! }.joined()
        let str2 = (0..<length2).map { _ in characters.randomElement()! }.joined() + "•" // Ensure distance is never 0
        
        let distance = levenshteinDistance(str1, str2)
        
        #expect(distance >= 0)
    }
}
