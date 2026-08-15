/*2. Add Two Numbers

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.*/

//solution:


class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
     ListNode dummyHead = ListNode(0);
    ListNode current = dummyHead;
    int carry = 0;

     ListNode? p1 = l1;
    ListNode? p2 = l2;

     while (p1 != null || p2 != null || carry > 0) {
      int sum = carry;

       if (p1 != null) {
        sum += p1.val;
        p1 = p1.next;
      }

       if (p2 != null) {
        sum += p2.val;
        p2 = p2.next;
      }

       carry = sum ~/ 10;

       current.next = ListNode(sum % 10);
      current = current.next!;
    }

     return dummyHead.next;
  }
}
