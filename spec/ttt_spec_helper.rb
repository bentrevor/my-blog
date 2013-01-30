# assert Human didn't win tic-tac-toe game
def assert_human_didnt_win
  expect(page).not_to have_selector("p#bad")
  expect(page).to have_selector("p#good")
end

def play_game
  
end