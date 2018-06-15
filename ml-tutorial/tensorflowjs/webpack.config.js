var path = require('path')
const CopyWebpackPlugin = require('copy-webpack-plugin')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const VueLoaderPlugin = require('vue-loader/lib/plugin')
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
module.exports = {
  mode: 'development',
  context: path.join(__dirname, 'src'),
  entry: {
    app: './index.ts'
  },
  output: {
    path: path.join(__dirname, 'build'),
    filename: '[name].bundle.js'
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.ts', 'tsx', '.js', '.vue', '.json'],
    alias: {
      'vue$': 'vue/dist/vue.esm.js'
    }
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        loader: 'ts-loader',
        options: {
          appendTsSuffixTo: [/\.vue$/],
        }
      },
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      },
      {
        test: /\.(png|jpg|gif|svg)$/,
        loader: 'file-loader',
        options: {
          name: '[name].[ext]?[hash]'
        }
      },
      {
        test: /\.css$/,
        // or `ExtractTextWebpackPlugin.extract(...)`
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader'
        ]
      }
    ]
  },
  plugins: [
    new CopyWebpackPlugin([{
      from: path.join(__dirname, 'src', 'data'),
      to: 'data'
    }]),
    new HtmlWebpackPlugin({
      template: 'index.html'
    }),
    new VueLoaderPlugin(),
    new MiniCssExtractPlugin({
      filename: 'output.css'
    })
  ],
  devServer: {
    contentBase: path.join(__dirname, 'build'),
    inline: true,
    stats: 'errors-only'
  }
}
