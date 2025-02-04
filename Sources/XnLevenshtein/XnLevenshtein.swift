// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// DearLevenshtein.swift
// Part of the dear suite <https://github.com/ivanmoskalev/dear>.
// This code is released into the public domain under The Unlicense.
// For details, see <https://unlicense.org/>.
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


/// Returns the Levenshtein distance between two collections and another.
/// - Parameters:
///   - a: First collection.
///   - b: Second collection.
/// - Returns: The Levenshtein distance as an integer.
/// - Complexity: time: O(n × m), space: O(n)
public func levenshteinDistance<A: Collection, B: Collection>(_ a: A, _ b: B) -> Int where A.Element: Equatable, B.Element: Equatable, A.Element == B.Element {
    let countA = a.count
    let countB = b.count
    
    if countA == 0 { return countB }
    if countB == 0 { return countA }

    var previousRow = [Int](0...countB)
    var currentRow = [Int](repeating: 0, count: countB + 1)

    var i = 0
    var indexA = a.startIndex
    
    while indexA != a.endIndex {
        currentRow[0] = i + 1
        var j = 0
        var indexB = b.startIndex

        let elementA = a[indexA]
        while indexB != b.endIndex {
            let elementB = b[indexB]
            let cost = (elementA == elementB) ? 0 : 1

            let insertion = previousRow[j + 1] + 1
            let deletion = currentRow[j] + 1
            let substitution = previousRow[j] + cost

            currentRow[j + 1] = min(insertion, deletion, substitution)

            b.formIndex(after: &indexB)
            j += 1
        }

        swap(&previousRow, &currentRow)
        a.formIndex(after: &indexA)
        i += 1
    }

    return previousRow[countB]
}

public extension Collection where Element: Equatable {
    /// Returns the Levenshtein distance between this collection and another.
    /// - Parameter other: Another collection of the same element type.
    /// - Returns: The Levenshtein distance as an integer.
    /// - Complexity: time: O(n × m), space: O(n)
    @inlinable
    func levenshteinDistance<C: Collection>(to other: C) -> Int where C.Element == Element {
        DearLevenshtein.levenshteinDistance(self, other)
    }
}
