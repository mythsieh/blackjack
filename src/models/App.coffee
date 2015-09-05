# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    self = @
    #set an on event on playerhand
    @get 'playerHand'
      .on 'add', () ->
        if @minScore() > 21
          @.at(0)
            .flip()
          @.at(0)
            .flip()
          alert("You lose.")
          #restart game
          window.location.reload();
    #event listener for 'stand' which is triggered from Hand which received the intent from AppView
    @get 'dealerHand'
      .on 'stand' , () ->
        #on the card, revealed is a property
        #@ = dealerHand, collection of Cards
        #if first card revealed is false
        result = @.at(0)
          .get 'revealed'
        if !result
          @.at(0)
            .flip()
        #while minimum hand value < 17
        while @minScore() < 17
          @.hit()
          #dealer hits
        playerScore = self.get 'playerHand'
          .minScore()
        dealerScore = @minScore()
        if playerScore > dealerScore or dealerScore > 21
          alert('You, win!')
        else if playerScore is dealerScore
          alert('Push')
        else 
          alert('You, lose!')
        #restart game
        window.location.reload();
##