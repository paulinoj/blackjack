class window.ResultView extends Backbone.View
  className: 'result'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @model.on 'gameOver', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model
    # @$el.append new AppView(model: @).$el
    # if @collection.scores()[1] > 21
    #   score = @collection.scores()[0]
    # else score = @collection.scores()[1]
    # @$('.score').text score
