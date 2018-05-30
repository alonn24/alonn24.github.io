import org.scalatest._
import patmat.Huffman._
import patmat.Huffman.Fork
import patmat.Huffman.Leaf

class HuffmanTest extends FlatSpec with Matchers {

  "Huffman" should "create code tree" in {
    val chars = "aabbc".toList
    val tree = createCodeTree(chars)
    tree should equal (Fork(
      Leaf('a', 2),
      Fork(
        Leaf('c', 1),
        Leaf('b', 2),
        List('c', 'b'), 3),
      List('a', 'c', 'b'), 5))

  }

  it should "decode secret" in {
    decodedSecret should equal ("huffmanestcool".toList)
  }

  it should "encode" in {
    encode(frenchCode)("huffmanestcool".toList) should equal (secret)
  }

  it should "quick encode" in {
    quickEncode(frenchCode)("huffmanestcool".toList) should equal (secret)
  }
}
