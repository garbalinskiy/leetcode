import UIKit

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard !s.isEmpty else {
        return 0
    }
    
    var notReapeatingCharactersMap: [String.Element: Int] = [:]
    var maxLength = 0
           
    for (characterPosition, character) in s.enumerated() {
        if let existingIndex = notReapeatingCharactersMap[character] {
            notReapeatingCharactersMap = notReapeatingCharactersMap.filter { $0.value >= existingIndex + 1 }
        }
        notReapeatingCharactersMap[character] = characterPosition
        maxLength = max(notReapeatingCharactersMap.count, maxLength)
    }
    
    return maxLength
}

debugPrint(lengthOfLongestSubstring("abcdedcba12345"))
