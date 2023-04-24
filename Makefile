DATE :=$$( date +"%Y-%m-%d %T" )

clean-commits:  ## clean all commits from repo master branch
	echo $(DATE_STR)
	git checkout --orphan latest_branch   # create new branch
	git add .                             # add all files
	git commit -m "$(DATE) - clean commits" # commit the changes
	git branch -D master                  # delete the branch
	git branch -m master                  # rename current branch to master
	git push -f origin master             # force repo update

help:  ## Show this help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; \
	{printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help