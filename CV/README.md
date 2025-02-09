# CV Portfolio

## Development
* In order to work on the project, please install dependencies by running `yarn` in the root directory.
* In order to start the development server, run `yarn start` in the root directory.

# Deployment
After changing anything in the project, please run `yarn build` in the root directory. This will create a new build in the `build` directory. You can then move the build folder to `gh-pages` by running the following command in the root directory:
```bash
> touch CV/out/.nojekyll
> git subtree push --prefix CV/out origin gh-pages
```