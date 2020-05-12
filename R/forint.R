## Create the mr R package described above with the forint and get_bitcoin_price functions,
## and push to a new repo in your GitHub account, so that you can install the package on any
## computer via remotes::install_github. Submit the URL to your GitHub repo in Moodle.
## default function for later debugging
#' Dummy function writing "hello world"
#' @export
#' @param retried the number of previously done before the exponential backoff sleep
#' @importFrom binancer binance_coins_prices
hello <- function() {
  print("Hello, world!")
}
##
##
#' Accessing the Binance API to get the most recent price of a Bitcoin in USD.
#' @export
get_bitcoin_price <- function(retried = 0) {
  tryCatch(
    binance_coins_prices()[symbol == "BTC", usd],
    error = function(e){
      Sys.sleep(1+retried^2)
      get_bitcoin_price(retried = 1 + retried)
    })
  }


#' helper function for Ft format
#' @param x number
#' @export
#' @importFrom scales dollar
forint <- function(x) {
  dollar(x, prefix = '', suffix = 'Ft')}
