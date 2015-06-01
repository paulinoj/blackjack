class window.CardView extends Backbone.View
  className: 'card'

  # template: 'img/cards/' + @model.get('rankName') + "-" + @model.get('suitName') + '.png'

  tagName:  'img' 

#  template: _.template ('<img src="' + this.model.get("cardFile")() + '">')

#  template: '<img><%= @cardFile %></img>'

  initialize: -> @render()

  render: ->
#   console.log(@model.cardFile())
    @$el.children().detach()
    @$el.attr('src', 'img/cards/' + @model.get('rankName') + "-" + @model.get('suitName') + '.png') + '.png'

    @$el.addClass 'covered' unless @model.get 'revealed'

