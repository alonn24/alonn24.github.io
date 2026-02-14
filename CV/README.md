# CV Portfolio

## Development
* Install dependencies: `npm install` (run from the CV directory).
* Start the development server: `npm start`.

## Deployment
To publish the site to GitHub Pages, run the publish script from the CV directory:

```bash
./publish.sh
```

The script runs these stages:
1. **Install** – `npm ci` or `npm install`
2. **Build** – `npm run build` (Next.js static export → `out/`)
3. **Prepare** – ensure `out/.nojekyll` exists for GitHub Pages
4. **Commit** – stage and commit `CV/out` (skipped if no changes)
5. **Publish** – `git subtree push --prefix CV/out origin gh-pages`

To run the steps manually instead of using the script:

```bash
npm run build
touch out/.nojekyll
# From the repository root (parent of CV):
git add CV/out && git commit -m "Build CV for gh-pages"
git subtree push --prefix CV/out origin gh-pages
```