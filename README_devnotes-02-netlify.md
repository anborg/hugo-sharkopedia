### make tools ready

Netlify login 

```
npm install netlify-cli -g
# makesure you are in the project folder
netlify login
```

Git lfs (optional)

```
#Not 
git lfs install
# brew install git-lfs
#specify which files to track in repo 
git lfs track "static/uploads/*"
git lfs track "*.jpg"
```

Netlify lfs (optional)

```
netlify plugins:install netlify-lm-plugin
netlify lm:install
```
Linking to macos keychain (optional)
```
netlify link
netlify lm:setup
brew tap netlify/git-credential-netlify
brew install git-credential-netlify
```

Setup Netlify- GIT
Create oauth app in GIT : netlify-hugo-sharkopedia
 - app url: https://gifted-kirch-eb3996.netlify.app 
 - auth callback : https://api.netlify.com/auth/done
get clietid
get secret

go to netlify
create a site: https://app.netlify.com/sites/gifted-kirch-eb3996/settings/general
build from repo: github.com/anborg/hugo-sharkopedia
access contro: Add Oauth Provider 
 - github
 - add clientId 
 - add secret
 
 
 Now 
 
 netlify login 
 in config.toml
 baseUrl = "https://gifted-kirch-eb3996.netlify.app/"
 
 