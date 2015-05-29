class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand' , @endGame, @

  endGame: ->
    if @get('playerHand').scores()[1] > 21
      playerScore = @get('playerHand').scores()[0]
    else playerScore = @get('playerHand').scores()[1]

    @get('dealerHand').first().flip()
    @get('dealerHand').hit() while @calculateDealerScore() < 17
    console.log(@calculateDealerScore());

    # debugger;

  calculateDealerScore: ->
    if @get('dealerHand').scores()[1] > 21
      dealerScore = @get('dealerHand').scores()[0]
    else dealerScore = @get('dealerHand').scores()[1]
