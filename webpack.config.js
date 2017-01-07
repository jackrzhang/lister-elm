const webpack = require('webpack');
const path = require('path');
const autoprefixer = require('autoprefixer');

let config = {

  entry: {
    main: [
      './src/index.js'
    ]
  },

  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: '[name].js',
  },

  module: {
    loaders: [
      {
        test: /\.(css|scss)$/,
        loaders: [
          'style-loader',
          'css-loader',
          'postcss-loader',
          'sass-loader'
        ]
      },
      {
        test:    /\.html$/,
        exclude: /node_modules/,
        loader:  'file?name=[name].[ext]',
      },
      {
        test:    /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader:  'elm-webpack',
      },
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'url-loader?limit=10000&minetype=application/font-woff',
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'file-loader',
      },
    ],

    noParse: /\.elm$/,
  },

  postcss: [
    autoprefixer({ browsers: ['last 2 versions'] }) 
  ],

  devServer: {
    inline: true,
    stats: {
     colors: true,
     hash: false,
     timings: true,
     chunks: false,
     chunkModules: false,
     modules: false
   }
  },

};


if (process.env.NODE_ENV === 'production') {
  config = Object.assign(config, {

    plugins: [
      new webpack.optimize.UglifyJsPlugin({
        compress: { warnings: false }
      }),
      new webpack.optimize.OccurrenceOrderPlugin()
    ]

  });
}

module.exports = config;
