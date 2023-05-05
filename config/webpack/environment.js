const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({
 $: 'jquery',
 jQuery: 'jquery',
 Popper: ['popper.js', 'default']
}))


// add this code to to app's understand j query and js extentions

module.exports = environment
