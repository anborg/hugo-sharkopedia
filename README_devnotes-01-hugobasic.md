
# Create a simple hugo proj


### npm setup 
```
```
### Create project from scratch
```shell script
SET PROJ_NAME=hugo-sharkopedia
mkdir %PROJ_NAME%
cd %PROJ_NAME%
hugo new site . --force



```
### Git checkout and work on existing
```
git clone <url>
cd cd %PROJ_NAME%  
```


### Create config file
```shell script
cat <<EOT >> config.toml
# set baseUrl to empty
baseURL = ""
languageCode = "en-us"
title = "Sharkopedia"

EOT
```

### Create homepage template

```shell script
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
```

### Disable draft setting  in default.md
This helps to quickly see results while developing

```
cat <<EOT >> archetypes/default.md 
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: false
---

EOT
```

### Create content of homepage
```
hugo new _index.md
cat <<EOT >> content/_index.md
---
title: "Welcome"
date: 2020-10-07T14:07:35-05:00
draft: false
---
This is a site all about sharks! Select a shark from the list to learn more:
EOT
```
### Start server
```shell script
hugo server &
curl http://localhost:1313
```

### TEMPLATES

### Create template for default single page
```
mkdir layouts/_default
cp layouts/index.html layouts/_default/single.html
```
### Crate new content for single page
```
hugo new sharks/hammerhead.md
```
### Expect hammerhead conent
```
curl http://localhost:1313/sharks/hammerhead
```
### However you won't see it listed in /sharks

### Create default LIST template

```
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
```

### Now expect to see /sharks
```
wget http://localhost:1313/sharks
```
### Create some shark content
```
hugo new sharks/mako.md
hugo new sharks/whale.md
```
### setup git 
```
git init
echo “public” >> .gitignore
git add archetypes/ config.toml content/ .gitignore layouts/ data/ themes/ resources/ static/
git commit -m "init"
git branch -M main
git remote add origin https://github.com/anborg/hugo-sharkopedia.git
git push -u origin main
```


# Section 2:  Theme

### Setup themes

Get a new theme, and apply it in current project


```shell script

set THEME_NAME=ananke
git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
# It may be better to just copy theme from a theme repository [to reduce future breakage]
#git clone https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
```
Update Config.toml with theme name 
```
echo 'theme = %THEME_NAME%' >> config.toml
```


### Custom styling css 

If you create custom css, make sure to update it in appropriate partial (wherevever css is imported)

```
mkdir layouts\partials
cp themes/%THEME_NAME%/layouts/partials/site-header.html layouts/partials/site-header.html 
mkdir static\css
touch static/css/custom-style.css
``` 

Add the theme & css to config

```
cat <<EOT >> config.toml
[params]
custom_css = ["css/custom-style.css"]
EOT
```


### Seetup pwa

Refw : 
