
Create a simple hugo proj

TODO Next: 
INPROG - final theme must look like this https://gohugo-ananke-theme-demo.netlify.app/
    - ref instruction : https://github.com/theNewDynamic/gohugo-theme-ananke
    - 

BACKLOG - understand themes, and apply a city
BACKLOG - add spa 
BACKLOG - setup netlify

DONE - scripting basic hugo 

```shell script
hugo new site hugo-sharkopedia
cd hugo-sharkopedia

#set baseurl empty config
cat <<EOT >> config.toml
baseURL = ""
languageCode = "en-us"
title = "Sharkopedia"

EOT


#Create homepage template
touch layouts/index.html

cat <<EOT >> layouts/index.html
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><^>{{ .Site.Title }}</title>
    <link rel="stylesheet" href="/style.css">
  </head>
  <body>

    <header>
      <h1>{{ .Site.Title }}</h1>
    </header>

    <main>
      <h2>{{ .Title }}</h2>
      {{ .Content }}
    </main>

    <footer>
      <small>Made with love and Hugo</small>
    </footer>
  </body>
</html>


EOT


#disable draft in default.md
cat <<EOT >> archetypes/default.md 
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: false
---

EOT


#Now: create content of homepage
hugo new _index.md
cat <<EOT >> content/_index.md
---
title: "Welcome"
date: 2020-10-07T14:07:35-05:00
draft: false
---
This is a site all about sharks! Select a shark from the list to learn more:
EOT
#Start server
hugo server &
curl http://localhost:1313


#TEMPLATES

#Create template for default single page
mkdir layouts/_default
cp layouts/index.html layouts/_default/single.html
#Crate new content for single page
>hugo new sharks/hammerhead.md
#Expect hammerhead conent
curl http://localhost:1313/sharks/hammerhead
# However you won't see it listed in /sharks

#Create default LIST template
touch layouts/_default/list.html

cat <<EOT >> layouts/_default/list.html
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><^>{{ .Site.Title }}</title>
    <link rel="stylesheet" href="/style.css">
  </head>
  <body>

    <header>
      <h1>{{ .Site.Title }}</h1>
    </header>

<main>
  <h2>{{ .Title }}</h2>
  {{ .Content }}

  <ul>
  {{ range .Pages }}
    <li><a href="{{ .RelPermalink }}">{{ .Title }}</a></li>
  {{ end }}
  </ul>
</main>

    <footer>
      <small>Made with love and Hugo</small>
    </footer>
  </body>
</html>

EOT

#Now expect to see /sharks
wget http://localhost:1313/sharks

#Create some shark content
hugo new sharks/mako.md
hugo new sharks/whale.md

#setup git 

git init
echo “public” >> .gitignore
git add archetypes/ config.toml content/ .gitignore layouts/ data/ themes/ resources/ static/
git commit -m "init"
git branch -M main
git remote add origin https://github.com/anborg/hugo-sharkopedia.git
git push -u origin main
```

### Setup themes

```shell script

#Add a new theme and USE it in config
set THEME_NAME=ananke
git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
echo 'theme = %THEME_NAME%' >> config.toml

# Copy  css from theme 
mkdir layouts\partials
cp themes/%THEME_NAME%/layouts/partials/site-header.html layouts/partials/header.html 
mkdir static\css
touch static/css/custom-style.css
 





cat <<EOT >> config.toml
[params]
custom_css = ["css/custom-style.css"]
EOT

```


### Seetup pwa

Refw : https://techformist.com/add-pwa-hugo/
