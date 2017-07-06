class Dashing.Hahumiditymeter extends Dashing.Widget

  @accessor 'value',
    get: -> if @_value then Math.round(@_value * 10)/10 else 0
    set: (key, value) -> @_value = value
    Dashing.AnimatedValue

  constructor: ->
    super
    @queryState()
    @observe 'value', (value) ->
      $(@node).find(".meter").val(value).trigger('change')

  queryState: ->
    $.get '/homeassistant/humidity',
      widgetId: @get('id'),
      deviceId: @get('device')
      (data) =>
        json = JSON.parse data
        @set 'value', json.value

  ready: ->
    meter = $(@node).find(".meter")
    meter.attr("data-bgcolor", meter.css("background-color"))
    meter.attr("data-fgcolor", meter.css("color"))
    meter.knob()

  onData: (data) ->
