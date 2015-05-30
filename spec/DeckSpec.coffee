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

describe 'hand', ->

  beforeEach ->
    # deck = new Deck()
    hand = new Hand()

  describe 'stand', ->
    xit 'should be a function', ->
      assert.strictEqual typeof hand.stand, 'function'

    xit 'should trigger the end of the game', ->

  describe 'scores', ->

    xit 'should be an array of two values', ->

    # xit 'should trigger the end of the game', ->



  describe 'hasAce', ->

    xit 'should return 1 if hand contains Ace', ->

  describe 'minScore', ->

