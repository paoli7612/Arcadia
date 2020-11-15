
playGame:
	love src

resetGame: save/reset.py
	python3 $<

mapEditor: map_editor/main.py
	python3 $<
