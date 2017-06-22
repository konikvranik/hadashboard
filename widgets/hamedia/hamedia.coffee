class Dashing.Hamedia extends Dashing.Widget
  constructor: ->
    super
    @_icons =
      rain: '&#xe009',
      rainy: '&#xe009',
      snow: '&#xe036',
      snowy: '&#xe036',
      sleet: '&#xe003',
      wind: '&#xe021',
      windy: '&#xe021',
      fog: '&#xe01b',
      cloudy: '&#xe000',
      clear_day: '&#xe028',
      clear: '&#xe028',
      clear_night: '&#xe02d',
      partly_cloudy_day: '&#xe001',
      partlycloudy: '&#xe001',
      partly_cloudy_night: '&#xe002'
    @queryState()

  @accessor 'icon', ->
    new Batman.TerminalAccessible (attr) =>
      @_icons[attr]

  @accessor 'state',
    get: -> @_state ? 'off'
    set: (key, value) -> @_state = value

  @accessor 'artist',
    get: -> @_artist
    set: (key, value) -> @_artist = value

  @accessor 'album',
    get: -> @_album
    set: (key, value) -> @_album = value

  @accessor 'title',
    get: -> @_title
    set: (key, value) -> @_title = value

  ready: ->
    if @get('bgcolor')
      $(@node).css("background-color", @get('bgcolor'))

  onData: (data) ->
