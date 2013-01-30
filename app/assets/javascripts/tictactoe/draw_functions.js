function make_move(player, position) {
  if (player == 'x') {
    place_image(x_img, position);
    x_positions[position] = 1;
  }

  else if (check_empty(position)) {
    place_image(o_img, position);
    o_positions[position] = 1; 
  }
}

function draw_winning_line(combo) {
  // the get_x/y_from_position() returns the upper left corner, so adding
  // 50 gives us the center of the position
  var start_x = get_x_from_position(winning_combinations[combo][0]) + 50;
  var start_y = get_y_from_position(winning_combinations[combo][0]) + 50;
  var end_x = get_x_from_position(winning_combinations[combo][2]) + 50;
  var end_y = get_y_from_position(winning_combinations[combo][2]) + 50;
  
  context.lineWidth = 5;
  context.strokeStyle = "red";
  context.lineCap = "round";
  context.beginPath();
  context.moveTo(start_x, start_y);
  context.lineTo(end_x, end_y);
  context.stroke();
  context.closePath();
}

function place_image(image, position) {
  // the get_x/y_from_position() returns the upper left corner of a position,
  // and the x and o images are about 90px by 90px, so adding 5 puts the image
  // of the x or the o in the center of the position
  var x = get_x_from_position(position) + 11;
  var y = get_y_from_position(position) + 11;

  context.drawImage(image, x, y);
}

function get_x_from_position(position) {
  if (position == 8) return 100;

  var coordinate = (parseInt(2.5 * Math.sin(position * .5)) * 100);
  return (coordinate > 0) ? coordinate : 0;
}

function get_y_from_position(position) {
  if (position == 8) return 100;

  var coordinate = (parseInt(2.5 * Math.sin((position - 2) * .5)) * 100);
  return (coordinate > 0) ? coordinate : 0;
}

function draw_menu() {
  context.font = "16pt Arial";
  context.fillText("Would you like to go first?", 20, 350);
  context.font = "12pt Arial";
  context.fillText("yes", 68, 395);
  context.fillText("no", 210, 395);

  context.strokeRect(50, 380, 60, 20);
  context.strokeRect(190, 380, 60, 20);
}

function draw_game_over_text() {
  context.font = "12pt Arial";
  context.fillText("You did not win.", 90, 350);
  context.fillText("Refresh the page to play again.", 40, 370);
}