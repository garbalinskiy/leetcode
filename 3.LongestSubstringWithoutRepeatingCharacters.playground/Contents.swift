import UIKit

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard !s.isEmpty else {
        return 0
    }
    
    var dict: [String.Element: Int] = [:]
    var maxLength = 0
           
    for (end, c) in s.enumerated() {
        if let existingIndex = dict[c] {
            dict = dict.filter { $0.value >= existingIndex + 1 }
        }
        dict[c] = end
        maxLength = max(dict.count, maxLength)
    }
    
    return maxLength
}

debugPrint(lengthOfLongestSubstring("abcdedcba12345"))
