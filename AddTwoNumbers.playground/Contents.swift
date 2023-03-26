import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0
        next = nil
    }

    public init(_ val: Int) { self.val = val
        next = nil
    }

    public init(_ val: Int, _ next: ListNode?) { self.val = val
        self.next = next
    }
}
 
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var rootNode: ListNode?
        
    var currentNode = rootNode
    var isOverloaded = false
        
    var l1 = l1
    var l2 = l2
        
    while l1 != nil || l2 != nil {
        var sumValue = (l1?.val ?? 0) + (l2?.val ?? 0) + (isOverloaded ? 1 : 0)
        
        if sumValue > 9 {
            isOverloaded = true
            sumValue = sumValue % 10
        } else {
            isOverloaded = false
        }
            
        l1 = l1?.next
        l2 = l2?.next
            
        if currentNode != nil {
            let nextNode = ListNode(sumValue)
            currentNode?.next = nextNode
            currentNode = nextNode
        } else {
            currentNode = ListNode(sumValue)
            rootNode = currentNode
        }
    }
    
    if isOverloaded {
        currentNode?.next = ListNode(1)
    }
        
    return rootNode
}

func debugPrint(listNode: ListNode?) {
    
    var values: [Int] = []
    
    var nextNode = listNode
    while nextNode != nil {
        if let nextNodeValue = nextNode?.val {
            values.append(nextNodeValue)
        }
        nextNode = nextNode?.next
    }
    
    debugPrint(values.reversed().map { "\($0)" }.joined())
}

let l1 = ListNode(9, .init(9, .init(9, .init(9, .init(9, .init(9, .init(9)))))))
let l2 = ListNode(9, .init(9, .init(9, .init(9))))

debugPrint(listNode: l1)
debugPrint(listNode: l2)

let l3 = addTwoNumbers(l1, l2)

debugPrint(listNode: l3)
