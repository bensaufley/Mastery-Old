# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

rotations = 0
since = null

divmod = (y,x) ->
  q = Math.floor(x/y)
  r = x - q*y
  return { div: q, rem: r }

startClock = ->
  angle = 360/60
  date = new Date()
  hour = date.getHours()
  if hour > 12
    hour -= 12
  minute = date.getMinutes() + 30
  second = date.getSeconds() + 30
  if second == 0
    rotations++
    second = rotations * 60
  else
    second += rotations * 60
  hourAngle = (360/12)*hour + (360/(12*60))*minute - 45
  $('#e_anim').css("transform" : "rotate(#{hourAngle}deg)", "-webkit-transform": "rotate(#{hourAngle}deg)")
  $('#m_anim').css("transform" : "rotate(#{angle*minute}deg)", "-webkit-transform": "rotate(#{angle*minute}deg)")
  $('#s_anim').css("transform" : "rotate(#{angle*second}deg)", "-webkit-transform": "rotate(#{angle*second}deg)");

counter = ->
  date = new Date()
  count = parseInt((date - since)/1000,10)
  disp = for x in [[60, 2, true], [60, 2, true], [24, 2, false], [365, 0, false], [1000, 0, false]]
    temp = divmod(x[0],count)
    count = temp.div
    if temp.rem!=0 || x[2]
      if temp.rem.length < x[1]
        new Array(x[1] - temp.rem.length).join('0') + temp.rem
      else
        temp.rem
  disp = disp.filter (x) ->
    x != undefined
  console.log disp
  $('#counter').html(disp.reverse().join(':'))

$(document).ready ->
  if $('html').hasClass('csstransforms')
    $logo = $('body > header h1 a')
    $logo.addClass('anim')
    $('<div />', id: 'e_anim').appendTo($logo)
    $('<div />', id: 'm_anim').appendTo($logo)
    $('<div />', id: 's_anim').appendTo($logo)
    startClock()
    logoclock = setInterval(startClock,1000)
  $('#counter').html('')
  since = new Date($('#counter').data('when'))
  counter()
  clock = setInterval(counter,250)