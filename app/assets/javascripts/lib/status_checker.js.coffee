SimpleBlog.helpers.photo = 
  el: null
  processing: false
  url: null
  init: (photo) ->
    @el = photo
    @processing = $(photo).data('processing')
    @url =  $(photo).data('url')

SimpleBlog.helpers.statusChecker =
  checker: null
  run: ->
    @checker = setInterval =>
      @checkPhoto()
    , 2000

  checkPhoto: ->
    $.ajax
      url: SimpleBlog.helpers.photo.url
      dataType: 'json'
      success: (data, textStatus, jqXHR) =>
        SimpleBlog.helpers.photo.processing = data.processing
        unless SimpleBlog.helpers.photo.processing
          @stopChecking()
          $(SimpleBlog.helpers.photo.el).find("#processing-status").text("- No Notifications Pending")
      error: (data, textStatus, jqXHR) ->
        console.log "error has occured"

  stopChecking:  ->
    clearInterval(@checker)