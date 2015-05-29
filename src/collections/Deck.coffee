class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    # @on 'stand', @endGame, @
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true

  # endGame: ->
  #   console.log('time for the dealer to play')
  #   @trigger 'stand', @
