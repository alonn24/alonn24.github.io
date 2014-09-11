package week3

/**
 * A class to represent tweets.
 */
class Tweet(val user: String, val text: String, val retweets: Int) {
  override def toString: String =
    "User: " + user + "\n" +
      "Text: " + text + " [" + retweets + "]"
}

/**
 * This represents a set of objects of type `Tweet` in the form of a binary search
 * tree. Every branch in the tree has two children (two `TweetSet`s). There is an
 * invariant which always holds: for every branch `b`, all elements in the left
 * subtree are smaller than the tweet at `b`. The eleemnts in the right subtree are
 * larger.
 */
abstract class TweetSet {

  /**
   * This method takes a predicate and returns a subset of all the elements
   * in the original set for which the predicate is true.
   */
  def filter(p: Tweet => Boolean): TweetSet = filterAcc(p, new Empty)

  /**
   * This is a helper method for `filter` that propagetes the accumulated tweets.
   */
  def filterAcc(p: Tweet => Boolean, acc: TweetSet): TweetSet

  /**
   * Returns a new `TweetSet` that is the union of `TweetSet`s `this` and `that`.
   */
  def union(that: TweetSet): TweetSet

  /**
   * Returns the tweet from this set which has the greatest retweet count.
   *
   * Calling `mostRetweeted` on an empty set should throw an exception of
   * type `java.util.NoSuchElementException`.
   *
   * Question: Should we implment this method here, or should it remain abstract
   * and be implemented in the subclasses?
   */
  def mostRetweeted: Tweet
  def mostRetweetedIter(acc: Tweet): Tweet

  /**
   * The following methods are already implemented
   */

  /**
   * Returns a list containing all tweets of this set, sorted by retweet count
   * in descending order. In other words, the head of the resulting list should
   * have the highest retweet count.
   *
   * Hint: the method `remove` on TweetSet will be very useful.
   * Question: Should we implment this method here, or should it remain abstract
   * and be implemented in the subclasses?
   */
  def descendingByRetweet: TweetList

  /**
   * Returns a new `TweetSet` which contains all elements of this set, and the
   * the new element `tweet` in case it does not already exist in this set.
   *
   * If `this.contains(tweet)`, the current set is returned.
   */
  def incl(tweet: Tweet): TweetSet

  /**
   * Returns a new `TweetSet` which excludes `tweet`.
   */
  def remove(tweet: Tweet): TweetSet

  /**
   * Tests if `tweet` exists in this `TweetSet`.
   */
  def contains(tweet: Tweet): Boolean

  /**
   * This method takes a function and applies it to every element in the set.
   */
  def foreach(f: Tweet => Unit): Unit
}

class Empty extends TweetSet {

  def filterAcc(p: Tweet => Boolean, acc: TweetSet): TweetSet = acc

  def union(that: TweetSet): TweetSet = that

  def mostRetweeted: Tweet = throw new java.util.NoSuchElementException("asd")
  def mostRetweetedIter(acc: Tweet) = acc

  def descendingByRetweet: TweetList = Nil

  /**
   * The following methods are already implemented
   */

  def contains(tweet: Tweet): Boolean = false

  def incl(tweet: Tweet): TweetSet = new NonEmpty(tweet, new Empty, new Empty)

  def remove(tweet: Tweet): TweetSet = this

  def foreach(f: Tweet => Unit): Unit = ()
}

class NonEmpty(elem: Tweet, left: TweetSet, right: TweetSet) extends TweetSet {

  def filterAcc(p: Tweet => Boolean, acc: TweetSet): TweetSet =
    if (p(elem)) left.filterAcc(p, acc incl elem) union
      right.filterAcc(p, acc)
    else left.filterAcc(p, acc) union
      right.filterAcc(p, acc)

  def union(that: TweetSet): TweetSet =
    ((left union right) union that) incl elem

  def mostRetweeted: Tweet = mostRetweetedIter(elem)
  def mostRetweetedIter(acc: Tweet): Tweet = {
    val mostRetweeted = if (elem.retweets > acc.retweets) elem else acc
    left.mostRetweetedIter(right.mostRetweetedIter(mostRetweeted))
  }

  def descendingByRetweet: TweetList = new Cons(mostRetweeted, remove(mostRetweeted).descendingByRetweet)

  /**
   * The following methods are already implemented
   */

  def contains(x: Tweet): Boolean =
    if (x.text < elem.text) left.contains(x)
    else if (elem.text < x.text) right.contains(x)
    else true

  def incl(x: Tweet): TweetSet = {
    if (x.text < elem.text) new NonEmpty(elem, left.incl(x), right)
    else if (elem.text < x.text) new NonEmpty(elem, left, right.incl(x))
    else this
  }

  def remove(tw: Tweet): TweetSet =
    if (tw.text < elem.text) new NonEmpty(elem, left.remove(tw), right)
    else if (elem.text < tw.text) new NonEmpty(elem, left, right.remove(tw))
    else left.union(right)

  def foreach(f: Tweet => Unit): Unit = {
    f(elem)
    left.foreach(f)
    right.foreach(f)
  }
}

trait TweetList {
  def head: Tweet

  def tail: TweetList

  def isEmpty: Boolean

  def foreach(f: Tweet => Unit): Unit =
    if (!isEmpty) {
      f(head)
      tail.foreach(f)
    }
}

object Nil extends TweetList {
  def head = throw new java.util.NoSuchElementException("head of EmptyList")

  def tail = throw new java.util.NoSuchElementException("tail of EmptyList")

  def isEmpty = true
}

class Cons(val head: Tweet, val tail: TweetList) extends TweetList {
  def isEmpty = false
}


object GoogleVsApple {
  val google = List("Google", "android", "Android", "galaxy", "Galaxy", "nexus", "Nexus")
  val apple = List("Apple", "ios", "iOS", "iphone", "iPhone", "ipad", "iPad")


  lazy val googleTweets: TweetSet = TweetReader.allTweets.filter(t => google exists t.text.contains)
  lazy val appleTweets: TweetSet  = TweetReader.allTweets.filter(t => apple exists t.text.contains)

  /**
   * A list of all tweets mentioning a keyword from either apple or google,
   * sorted by the number of retweets.
   */
   val trending: TweetList = googleTweets.union(appleTweets).descendingByRetweet
}

object Main extends App {
  val empty = new Empty
  val tweet1 = new Tweet("alon", "tweet1", 0)
  val tweet2 = new Tweet("me", "tweet3", 2)
  val tweet3 = new Tweet("alon", "tweet2", 1)
  val allTweets = empty incl tweet1 incl tweet2 incl tweet3

  val filteredTweets = allTweets.filter((p:Tweet) => {
    p.retweets > 0
  })
  println("> filtered tweets")
  filteredTweets.foreach((t:Tweet) => {
    println(t)
  })
  println("< filtered tweets")

  println("> decending retweet")
  allTweets.descendingByRetweet.foreach((t:Tweet) => {
    println(t)
  })
  println("< decending retweet")

  println("> trending tweets")
  GoogleVsApple.trending.foreach((t:Tweet) => {
    println(t)
  })
  println("< trending tweets")
}
