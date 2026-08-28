/* 23. Merge k Sorted Lists

You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

Merge all the linked-lists into one sorted linked-list and return it.*/

//solution:

class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    if (lists.isEmpty) return null;
    return _mergeSortLists(lists, 0, lists.length - 1);
  }

   ListNode? _mergeSortLists(List<ListNode?> lists, int start, int end) {
    if (start == end) return lists[start];
    
    int mid = start + (end - start) ~/ 2;
    ListNode? left = _mergeSortLists(lists, start, mid);
    ListNode? right = _mergeSortLists(lists, mid + 1, end);
    
    return _mergeTwoLists(left, right);
  }

   ListNode? _mergeTwoLists(ListNode? l1, ListNode? l2) {
    ListNode dummy = ListNode(0);
    ListNode? current = dummy;

    while (l1 != null && l2 != null) {
      if (l1.val < l2.val) {
        current?.next = l1;
        l1 = l1.next;
      } else {
        current?.next = l2;
        l2 = l2.next;
      }
      current = current?.next;
    }

    if (l1 != null) current?.next = l1;
    if (l2 != null) current?.next = l2;

    return dummy.next;
  }
}
