class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="newgame-button">New Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="result-container"></div>
  '

  template2: _.template '<h2><% if(this.model.get("winner") == undefined) { %><% } else { %>You Lose<% } %></h2>'

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .newgame-button': -> @model.newGame()

  initialize: ->
    @render()
    @model.on 'change:winner', => @render()

  render: ->    
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.result-container').html @template2()

