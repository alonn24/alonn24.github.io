type Set = Int => Boolean
def contains(s: Set, elem: Int): Boolean = s(elem)

/**
 * 2.1
 */
def singletonSet(elem: Int): Set = (x: Int) => x == elem

def union(s: Set, t: Set): Set = (x: Int) => s(x) || t(x)
def intersect(s: Set, t: Set): Set = (x: Int) => s(x) && t(x)
def not(s: Set): Set = (x: Int) => !s(x)
def diff(s: Set, t: Set): Set = intersect(union(s, t), not(intersect(s, t)))
def filter(s: Set, p: Int => Boolean): Set = intersect(s, p)

/**
 * 2.2
 */
def forall(s: Set, p: Int => Boolean): Boolean = {
  def iter(a: Int): Boolean = {
    if (a > 1000) true
    else if (contains(s, a) && !contains(filter(s, p), a)) false
    else iter(a + 1)
  }
  iter(-1000)
}
def exists(s: Set, p: Int => Boolean): Boolean =
  !forall(s, not(p))
forall((x: Int) => x < 0, (x: Int) => x < 1)
forall((x: Int) => x < 0, (x: Int) => x < 0)
forall((x: Int) => x > 0, (x: Int) => x < 0)
forall((x: Int) => x > -5, (x: Int) => x < 5)
exists((x: Int) => x < 0, (x: Int) => x < 1)
exists((x: Int) => x < 0, (x: Int) => x < 0)
exists((x: Int) => x > 0, (x: Int) => x < 0)
exists((x: Int) => x > -5, (x: Int) => x < 5)