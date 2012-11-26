jQuery ->
  SimpleBlog.helpers.photo.init($('body.photos.show').find('div.photo'))
  SimpleBlog.helpers.statusChecker.run() if SimpleBlog.helpers.photo.processing 

