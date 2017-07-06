class Dashing.Hatemp extends Dashing.Widget

  @accessor 'value',
    get: -> if @_value then Math.round(@_value * 10)/10 else 0
    set: (key, value) -> @_value = value

  constructor: ->
    super
    @queryState()

  queryState: ->
    $.get '/homeassistant/temperature',
      widgetId: @get('id'),
      deviceId: @get('device')
      (data) =>
        json = JSON.parse data
        @set 'value', json.value

  ready: ->

  onData: (data) ->
