const merge = require('webpack-merge');
const path = require('path');
const projectRoot = path.resolve(__dirname, '..');

const baseConfig = require('./webpack.base.js');
module.exports = merge(baseConfig, {
  target: 'node', // !different
  entry: path.join(projectRoot, 'src/server.ts'),
  output: {
    libraryTarget: 'commonjs2', // !different
    path: path.join(projectRoot, 'build'),
    filename: 'bundle.server.js',
  }
});
