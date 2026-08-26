/* 19. Remove Nth Node From End of List

Given the head of a linked list, remove the nth node from the end of the list and return its head.*/

//solution:


class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
     ListNode dummy = ListNode(0, head);
    ListNode? fast = dummy;
    ListNode? slow = dummy;

     for (int i = 0; i <= n; i++) {
      fast = fast?.next;
    }

     while (fast != null) {
      fast = fast.next;
      slow = slow?.next;
    }

     slow?.next = slow.next?.next;

     return dummy.next;
  }
}
