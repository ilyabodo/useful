# Git

### Sync a forked repository with the original
#### Add the original repo as 'upstream' (only do once)
```
git remote add upstream https://github.com/user/original_repo.git
```
#### Update forked repo
```
git fetch upstream
git checkout master
git rebase upstream/master
	or git merge upstream/master
git push origin master	
```