all:
	sass --update sass:stylesheets
	coffee -o js/ -c coffeescripts/
