assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49
    it 'should subtract a card from the deck', ->
      assert.strictEqual deck.length, 50
      hand.hit()
      assert.strictEqual deck.length, 49
    it 'should add a card to player hand', ->
      hand.hit()
      assert.strictEqual hand.length, 3 
    it 'should update score', ->
      previous = hand.minScore()
      hand.hit()
      result = hand.minScore()
      assert.isAbove result, previous

  describe 'player hand', ->
    it 'should give the player two cards', ->
      assert.strictEqual hand.length, 2
