def balance(chars: List[Char]): Boolean = {

  def getNextCount(input: Char): Int = {
    if (input == '(')
      1
    else if (input == ')')
      -1
    else
      0
  }

  def balanceIter(chars: List[Char], parenthesesCount: Int): Boolean = {
    if (chars.isEmpty)
      parenthesesCount == 0
    else if (parenthesesCount < 0)
      false
    else
      balanceIter(chars.tail, parenthesesCount + getNextCount(chars.head))

  }
  balanceIter(chars, 0);
}

balance("()".toList)
balance("a(sd".toList)