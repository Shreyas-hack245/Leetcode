/* 23. Merge k Sorted Lists

You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

Merge all the linked-lists into one sorted linked-list and return it.

 

Example 1:

Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted linked list:
1->1->2->3->4->4->5->6
Example 2:

Input: lists = []
Output: []
Example 3:

Input: lists = [[]]
Output: []*/

//solution:

var mergeKLists = function(lists) {
    if (!lists || lists.length === 0) return null;
    
     const mergeTwoLists = (l1, l2) => {
        let dummy = new ListNode(0);
        let curr = dummy;
        
        while (l1 !== null && l2 !== null) {
            if (l1.val < l2.val) {
                curr.next = l1;
                l1 = l1.next;
            } else {
                curr.next = l2;
                l2 = l2.next;
            }
            curr = curr.next;
        }
        
        curr.next = l1 !== null ? l1 : l2;
        return dummy.next;
    };

     while (lists.length > 1) {
        let nextRoundLists = [];
        
        for (let i = 0; i < lists.length; i += 2) {
            let l1 = lists[i];
            let l2 = (i + 1 < lists.length) ? lists[i + 1] : null;
            nextRoundLists.push(mergeTwoLists(l1, l2));
        }
        
        lists = nextRoundLists;
    }
    
    return lists[0];
};
