all:  README.md 

README.md:  
	@touch README.md
	@echo "## Peer Assignment Project, The Unix Workbench" > README.md
	@date '+%D %T' --date='now' >> README.md
	@echo "The number of code lines in guessinggame.sh is: " $$(egrep ".+" guessinggame.sh | wc -l)>> README.md
cleanup:
	rm README.md
