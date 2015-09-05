class window.Card extends Backbone.Model
  initialize: (params) ->
    @set
      revealed: true
      value: if !params.rank or 10 < params.rank then 10 else params.rank
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit]
      rankName: switch params.rank
        when 0 then 'King'
        when 1 then 'Ace'
        when 11 then 'Jack'
        when 12 then 'Queen'
        else params.rank

  flip: ->
    @set 'revealed', !@get 'revealed' ## (this['revealed'] = !this['revealed']), when dealer gets this.pop().flip
    @

## set revealed to the opposite of what revealed is right now
## before first flip, revealed = true;
## after first flip, revealed = opposite of revealed --> false;
## second flip, revealed = opposite of revealed --> true;
