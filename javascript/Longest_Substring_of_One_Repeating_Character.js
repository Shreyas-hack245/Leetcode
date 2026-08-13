/* 2213. Longest Substring of One Repeating Character
You are given a 0-indexed string s. You are also given a 0-indexed string queryCharacters of length k and a 0-indexed array of integer indices queryIndices of length k, both of which are used to describe k queries.

The ith query updates the character in s at index queryIndices[i] to the character queryCharacters[i].

Return an array lengths of length k where lengths[i] is the length of the longest substring of s consisting of only one repeating character after the ith query is performed.

 

Example 1:

Input: s = "babacc", queryCharacters = "bcb", queryIndices = [1,3,3]
Output: [3,3,4]
Explanation: 
- 1st query updates s = "bbbacc". The longest substring consisting of one repeating character is "bbb" with length 3.
- 2nd query updates s = "bbbccc". 
  The longest substring consisting of one repeating character can be "bbb" or "ccc" with length 3.
- 3rd query updates s = "bbbbcc". The longest substring consisting of one repeating character is "bbbb" with length 4.
Thus, we return [3,3,4].
Example 2:

Input: s = "abyzz", queryCharacters = "aa", queryIndices = [2,1]
Output: [2,3]
Explanation:
- 1st query updates s = "abazz". The longest substring consisting of one repeating character is "zz" with length 2.
- 2nd query updates s = "aaazz". The longest substring consisting of one repeating character is "aaa" with length 3.
Thus, we return [2,3].*/

//solution:

class SegmentTreeNode {
    constructor(char) {
        this.max_len = 1;
        this.pref_len = 1;
        this.suff_len = 1;
        this.size = 1;
        this.left_char = char;
        this.right_char = char;
    }
}

class SegmentTree {
    constructor(s) {
        this.n = s.length;
        this.tree = new Array(4 * this.n);
        this.build(s, 0, 0, this.n - 1);
    }

    merge(left, right) {
        let parent = new SegmentTreeNode('');
        parent.size = left.size + right.size;
        parent.left_char = left.left_char;
        parent.right_char = right.right_char;

         parent.pref_len = left.pref_len;
        parent.suff_len = right.suff_len;
        parent.max_len = Math.max(left.max_len, right.max_len);

         if (left.right_char === right.left_char) {
            let combined = left.suff_len + right.pref_len;
            parent.max_len = Math.max(parent.max_len, combined);

             if (left.pref_len === left.size) {
                parent.pref_len = left.size + right.pref_len;
            }
             if (right.suff_len === right.size) {
                parent.suff_len = right.size + left.suff_len;
            }
        }

        return parent;
    }

    build(s, node, start, end) {
        if (start === end) {
            this.tree[node] = new SegmentTreeNode(s[start]);
            return;
        }
        let mid = Math.floor((start + end) / 2);
        this.build(s, 2 * node + 1, start, mid);
        this.build(s, 2 * node + 2, mid + 1, end);
        this.tree[node] = this.merge(this.tree[2 * node + 1], this.tree[2 * node + 2]);
    }

    update(node, start, end, idx, char) {
        if (start === end) {
            this.tree[node] = new SegmentTreeNode(char);
            return;
        }
        let mid = Math.floor((start + end) / 2);
        if (idx <= mid) {
            this.update(2 * node + 1, start, mid, idx, char);
        } else {
            this.update(2 * node + 2, mid + 1, end, idx, char);
        }
        this.tree[node] = this.merge(this.tree[2 * node + 1], this.tree[2 * node + 2]);
    }

    getMaxLength() {
        return this.tree[0].max_len;
    }
}

var longestRepeating = function(s, queryCharacters, queryIndices) {
    let segTree = new SegmentTree(s);
    let k = queryIndices.length;
    let lengths = new Array(k);

    for (let i = 0; i < k; i++) {
        let idx = queryIndices[i];
        let char = queryCharacters[i];
        
        segTree.update(0, 0, s.length - 1, idx, char);
        lengths[i] = segTree.getMaxLength();
    }

    return lengths;
};
