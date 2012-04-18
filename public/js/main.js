// Main App JS

var media = ['albums', 'movies', 'games'];

var filter = function(type){
  var SPEED = 200,
      selector = [],
      toHide = [],
      toShow = '.' + type.slice(0, - 1);

  _.each(media, function(type){
    selector.push('.' + type.slice(0, - 1));
  });

  toHide = _.without(selector, toShow);
   
  $(toHide.join(', ')).fadeOut(SPEED);
  $(toShow).fadeIn(SPEED);
}

$(window).bind('popstate', function(e){
  if (e.originalEvent.state !== null)
    filter(e.originalEvent.state.filter);
})

$(document).ready(function(){

  console.log('main.js loaded');

  // Sequentially fade in release boxes
  var d = 0;
  $('.release-box').each(function() {
    $(this).delay(d).fadeIn(200);
    d += 100;
  });

  // Prevent button text from being highlightable
  var _preventDefault = function(e) { e.preventDefault(); }
  $('.button')
    .bind("dragstart", _preventDefault)
    .bind("selectstart", _preventDefault);

  // Sorting UI
  _.each(media, function(type){
    $("a[href='/" + type + "']").bind('click', function(){
      filter(type);
      history.pushState({ filter: type }, null, '/' + type);
      $('h1 .type').text(type);
      mixpanel.track('Sort button clicked', { 'Sorted by': type });
      mixpanel.register_once({ 'First chose to sort by': type });
      return false;
    });
  });

})