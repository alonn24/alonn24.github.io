def countChange(money: Int, coins: List[Int]): Int = {

  if (coins.isEmpty) {
    0
  }
  else {
    val nextMoneyToChange = money - coins.head
    if (nextMoneyToChange == 0)
      1
    else if (nextMoneyToChange < 0) {
      countChange(money, coins.tail)
    }
    else {
      countChange(nextMoneyToChange, coins) +
        countChange(money, coins.tail)
    }

  }
}

countChange(15, 1::2::Nil)
countChange(1, 1::2::Nil)