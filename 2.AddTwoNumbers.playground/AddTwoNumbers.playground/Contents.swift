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
    var l1 = l1
    var l2 = l2
    
    var rootNode: ListNode = .init()
        
    var currentNode: ListNode? = rootNode
    var overload = 0
        
    while l1 != nil || l2 != nil {
        
        var sumValue = (l1?.val ?? 0) + (l2?.val ?? 0) + overload
        overload = sumValue / 10
            
        
        currentNode?.next = ListNode(sumValue % 10)
        currentNode = currentNode?.next
        
        l1 = l1?.next
        l2 = l2?.next
    }
    
    if overload > 0 {
        currentNode?.next = ListNode(overload)
    }
        
    return rootNode.next
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
