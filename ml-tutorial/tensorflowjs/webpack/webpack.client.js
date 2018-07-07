const merge = require('webpack-merge');
const path = require('path');
const projectRoot = path.resolve(__dirname, '..');

const baseConfig = require('./webpack.base.js');
module.exports = merge(baseConfig, {
  entry: path.join(projectRoot, 'src/client.ts'),
  output: {
    path: path.join(projectRoot, 'build/public'),
    // publicPath: path.join(projectRoot, 'public'),
    filename: 'bundle.client.js',
  }
});
