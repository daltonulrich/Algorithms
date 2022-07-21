import UIKit

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil { return nil }
    
    var l1 = l1
    var l2 = l2
    
    var dummy: ListNode? = ListNode(0)
    var current = dummy
    
    while l1 != nil && l2 != nil {
        let l1Val = l1!.val
        let l2Val = l2!.val
        
        if l1Val < l2Val {
            current?.next = l1
            l1 = l1?.next
        } else {
            current?.next = l2
            l2 = l2?.next
        }
        
        current = current?.next
    }
    
    if l1 != nil {
        current?.next = l1
    }
    
    if l2 != nil {
        current?.next = l2
    }
    
    return dummy?.next
}

