// Libraries
const merge = require('webpack-merge');

// Config
const common = require('./webpack.config.js');

module.exports = merge.smart(common, {
    devServer: {
        clientLogLevel: 'silent',
        disableHostCheck: true,
        host: '0.0.0.0',
        hot: true,
        https: true,
        open: true,
        overlay: true,
        port: 8080,
        quiet: true
    },
    mode: 'development',
    devtool: 'eval-source-map',
    watchOptions: {
        poll: 1000
    }
});
