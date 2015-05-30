class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand' , @endGame, @

    @on 'change', ->
      debugger;
      @trigger 'gameOver'
      , @

  defaults: {
    winner: null
  },

  # gameOver: ->

  endGame: ->
    if @get('playerHand').scores()[1] > 21
      playerScore = @get('playerHand').scores()[0]
    else playerScore = @get('playerHand').scores()[1]

    @get('dealerHand').first().flip()
##    @get('dealerHand').hit() while @calculateDealerScore() < 17
    @get('dealerHand').hit() while @calculateDealerScore() < 17

    dealerScore = @calculateDealerScore()
##    console.log(@calculateDealerScore());
    if playerScore > 21
      ##console.log("Lose")
      @set('winner', 'Player')
    else if (playerScore > dealerScore) or (dealerScore > 21)
      @set('winner', 'Player')
    else if playerScore == dealerScore
      @set('winner', 'None')
    else
      @set('winner', 'Dealer')
    #
    # debugger;

  calculateDealerScore: ->
    if @get('dealerHand').scores()[1] > 21
      dealerScore = @get('dealerHand').scores()[0]
    else dealerScore = @get('dealerHand').scores()[1]

