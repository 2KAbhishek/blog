+++
title = "Add two numbers without arithmetic operators 🙅‍♂️➕"
date = 2020-05-03T11:36:00+05:30
tags = ["leetcode","problem-solving","programming"]
+++



[![](https://lh3.googleusercontent.com/-yq2Qa1F9Fds/Xq6rqqlwSrI/AAAAAAAASh4/JXgbUBMbwt0huDVJYf-pthJg-w5PzkzpgCLcBGAsYHQ/s640/1588505511128999-0.png)](https://lh3.googleusercontent.com/-yq2Qa1F9Fds/Xq6rqqlwSrI/AAAAAAAASh4/JXgbUBMbwt0huDVJYf-pthJg-w5PzkzpgCLcBGAsYHQ/s1600/1588505511128999-0.png)

What if you are given a problem where you have to add two integers but you can't use any arithmetic operators (+ - \* / % // \*\*), like LeetCode's problem [#371](https://leetcode.com/problems/sum-of-two-integers).

### So how do you approach this problem?

Answer: Bit manipulation

Problems like this can be solved using bit-wise operators as basic mathematics rules work in the same way whether it be binary or decimal. All we have to do is:

1. Figure out how the basic mathematical operation works step by step.
2. Replicate these operators using bit-wise operators (& | ~ ^ << >>).

In case of addition in decimal system the process looks something like this:

1. If sum of two digits is less than 10 we add it to our sum.
2. If sum is greater than 10 then we add the least significant bit to sum and carry 1 to next operation.

### When doing this operation in binary which bit-wise operators do we need?

Let's look at an example: 2 + 1 = 3

**2 in binary is 010**

**1 in binary is 001**

**3 in binary is 011**

#### Which bit-wise operator can do this?

The answer is XOR ( ^ ) it returns 1 only when one of it's operands is 1, otherwise 0.
So, (2 ^ 1) = 3 but XOR falls short if a carry is generated.

Let's look at another example: 2 + 3 = 5

**2 in binary is 010**

**3 in binary is 011**

**5 in binary is 101**

But **(2 ^ 3) = 001** as XOR can't process the carry in case of 1 + 1.

#### Which bit-wise operator can we use to alleviate this issue?

The answer is AND ( & ) it returns 1 only when both of it operands are 1, which is just what we need but that alone won't completely solve our problem as:

**(2 & 3) = 010**

But you can see that the carry bit is not at it's correct position.

#### How do we fix this?

The next operator that we need to bring in is the left shift ( << ) operator which just shift its operand bits to left by a given count, in our case the count is 1.

**(010) << 1 = 100**

#### Now all we have to do is XOR the results together

**(2 ^ 3) = 001**

**(2&3) << = 100**

**(001^101) = 101**

Which is 5 in decimal the answer that we have been looking for.

#### So all that's left to do now is put this all into code

```java
class Solution {
   public int getSum(int a, int b) {
        while (b != 0){
            int carry = (a&b) << 1;
            a = a ^ b; b = carry;
        }
        return a;
    }
}
```

This solution is written in Java but can be easily replicated in other programming languages.

#### Special note for Python

If you want to solve this problem using Python we will face an overflow condition when we try to add operands like (-1,1) or (4,-4) this is because of the way Python stores negative numbers, you can read more about it [here](https://wiki.python.org/moin/BitwiseOperators).
To solve this problem in Python we need to mask the numbers like so:

```python
class Solution:
    def getSum(self, a: int, b: int) -> int:
    carry = 0
    mask = 0xffffffff
    while b & mask != 0:
        carry = (a & b) << 1
        a = a ^ b b = carry
    return a&mask if b > mask else a
# Or you can just use this :P
#   return sum([a,b])
```

Hopefully, I was able to explain this problem and solution. Thanks for reading.
