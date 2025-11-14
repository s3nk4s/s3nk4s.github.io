---
title: Pushing From Obsidian
date: 2025-11-10
cover:
    image: "images/river.jpg"
summary: Attempting to push content between github repos 
tags:
- Obsidian

---

Trying to clone the whole hugo blog into obsidian isn't working

Will try to use github actions to allow me to manage just the content in Obsidian, then when checked-in the files will be pushed to the blog repos

with a little help from chatGPT, here's the starting point for the actions

```
name: Push posts and images to Hugo site

on:
 push:
   branches: [main]  # or whatever branch you use

jobs:
 sync:
   runs-on: ubuntu-latest
   steps:
     - name: Checkout content repo
       uses: actions/checkout@v4

     - name: Clone Hugo site repo
       run: |
         git clone https://github.com/<your-username>/<hugo-repo>.git site
         cd site
         git config user.name "GitHub Action"
         git config user.email "actions@github.com"
         cd ..

     - name: Copy posts and images
       run: |
         rsync -av content/posts/ site/content/posts/
         rsync -av static/images/ site/static/images/

     - name: Commit and push changes
       run: |
         cd site
         git add .
         git commit -m "Update posts and images from content repo" || echo "No changes"
         git push https://<your-username>:${{ secrets.DEPLOY_TOKEN }}@github.com/<your-username>/<hugo-repo>.git main
```

## update 1

so Obsidian still falls over with just the posts and images. Moving to a simpler model where obsidian only has a new post which can then be deleted once published

changing the rsync commands to remove ```--delete``` 

> Photo by me.  [![Creative Commons License](/images/cc88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/) [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses