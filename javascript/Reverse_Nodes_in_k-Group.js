/* 25. Reverse Nodes in k-Group

Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.

k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.

You may not alter the values in the list's nodes, only nodes themselves may be changed.*/

//solution:

var reverseKGroup = function(head, k) {
     let count = 0;
    let current = head;
    while (current !== null && count < k) {
        current = current.next;
        count++;
    }
    
     if (count === k) {
        let prev = null;
        let nextNode = null;
        let curr = head;
        
         for (let i = 0; i < k; i++) {
            nextNode = curr.next;
            curr.next = prev;
            prev = curr;
            curr = nextNode;
        }
        
          if (nextNode !== null) {
            head.next = reverseKGroup(nextNode, k);
        }
        
         return prev;
    }
    
     return head;
};
