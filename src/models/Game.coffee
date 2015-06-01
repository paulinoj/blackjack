class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand' , @endGame, @

    defaults: {
      winner: undefined
    },

  newGame: ->
    new AppView(model: new Game()).$el.appendTo 'body'
    
#    console.log("hello")
    # @initialize()
    @set 'winner', ''

  endGame: ->
    console.log("Do we get hre")

    if @get('winner') != undefined
      @$('.hit-button').prop('disabled', true)
      @$('.stand-button').prop('disabled', true)

    if @get('playerHand').scores()[1] > 21
      playerScore = @get('playerHand').scores()[0]
    else playerScore = @get('playerHand').scores()[1]

    @get('dealerHand').first().flip()
##    @get('dealerHand').hit() while @calculateDealerScore() < 17
    @get('dealerHand').hit() while @calculateDealerScore() < 17

    dealerScore = @calculateDealerScore()
##    console.log(@calculateDealerScore());
    if playerScore > 21
      @set('winner', 'Player')
    else if (playerScore > dealerScore) or (dealerScore > 21)
      @set('winner', 'Player')
    else if playerScore == dealerScore
      @set('winner', undefined)
    else
      @set('winner', 'Dealer')
    #
    # debugger;

  calculateDealerScore: ->
    if @get('dealerHand').scores()[1] > 21
      dealerScore = @get('dealerHand').scores()[0]
    else dealerScore = @get('dealerHand').scores()[1]

