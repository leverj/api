---
title: Coinpit API

language_tabs:
  - shell: cURL
  - python
  - javascript

toc_footers:
  - Try our <a href='https://live.coinpit.me'>testnet site</a>.
  - Trade now at <a href='https://live.coinpit.io'>live site</a>.
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - examples

search: true
---
# Introduction

Coinpit REST and Websocket API enable access to all features of the platform. Trading platforms, Trading bots, market makers can create a complete platform on top of the Coinpit API

## Language SDK/Libraries

Currently we support the following SDK for programmatic access
  <ul>
  <li><a href="https://github.com/coinpit/coinpit-client">Node.js Client</a>
  <li><a href="https://github.com/coinpit/pycoinpit">Python client</a>
  </ul>

## Unified javascript Rest library

The library <a href="https://github.com/coinpit/REST">rest.js</a> enables isomorphic usage of REST calls from either node.js or the browser using either browserify or as a SCRIPT tag in HTML

```
 <!-- In browser -->
  <script src="jquery.min.js"></script>
  <script src="https://raw.githubusercontent.com/coinpit/REST/master/index.js">
  <script>
    restjs.get("https://live.coinpit.io/api/v1/all/info")
          .then(function(result) {
            console.log(result)
          })
  </script>

  // In node.js
  var restjs = require('rest.js')
  restjs.get("https://live.coinpit.io/api/v1/all/info")
        .then(function(result) {
          console.log(result)
        })
```
## Scheme

```
REST URL = BASE_URL + ENDPOINT
```

### Base URL

The base url for all REST API is https://live.coinpit.io/api/v1 . To request an endpoint, append it to the base url and make a request.

For example to access the /all/info endpoint:

```shell
curl https://live.coinpit.io/api/v1/all/info
```

```python
import requests
print requests.get("https://live.bluelot.us/api/v1/all/info").text'
```

```javascript
restjs.get("https://live.bluelot.us/api/v1/all/info")
 .then(function(info) {
   console.log(info)
  })
```

### URL parameters

Url parameters are denoted by prepending a colon:

```
/contract/:symbol/order/:orderid
```

A specific order with id 123e4567-e89b-12d3-a456-426655440000 of contract BTC1 would be accessed as the url

```
https://live.coinpit.io/api/v1/contract/BTC1/order/123e4567-e89b-12d3-a456-426655440000
```

# Loginless Authentication

Loginless Authentication is a zero-knowledge authentication system, which relies on ECDSA. The scheme involves arriving at a shared secret using your private key and the public key of the peer. Every request is HMAC authenticated using this shared secret.

## Benefits
Zero knowledge Authentication avoids setting session cookies and eliminates the following classes of attacks: Session Hijacking, Some kinds of replay attacks, Cookie sniffing and some XSS and XSRF attacks. Not having the password or session id on the server mitigates some kinds of attacks due to server breach. Zero knowledge systems never send passwords or cookies and are also safer in case of information leak from TLS issues such as Heartbleed bug

### Overview

Loginless requires you to set the Authorization header in HTTP for protected endpoints:

### Authorization and Nonce headers

```
Authorization HMAC \<user_id\>:\<hmac_sha256\>
Nonce <unix_time>
```

```
Authorization HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:0a9448430e631022ca75425805072ce7bad9d1f8229373fe64a479ab98a50ab3
Nonce 1478041315653
```

### Setup ECDH

Getting the corresponding public address of the server for your personal public address:

GET /auth/:my_public_key

```
GET /auth/038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df37

{
"serverPublicKey": "03133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda7"
"userid": "mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk",
// other fields
}
```

You also get the server clock in the Server-Time header. If your client does not have an accurate clock or you are on an unusually slow network connection, you can compute the skew and apply it to all future requests.

```
Server-Time 1478041315780
```

### Compute Shared Secret

```
// Programming language specific
sharedSecret = ECDH(myPrivateKey, serverPublicKey)
```

### Compute HMAC authorization for all subsequent requests

```javascript
  function getAuthorization(userId, secret, method, uri, body, nonce) {
    if (!secret) return 'HMAC ' + userId
    var message = JSON.stringify({ method: method, uri: uri, body: body, nonce: nonce })
    var hmac    = crypto.createHmac('sha256', new Buffer(secret, 'hex'))
    hmac.update(message)
    return 'HMAC ' + userId + ":" + hmac.digest('hex')
  }
```


```python
import pycoinpit
coinpit_me = pycoinpit.Client(private_key)
account = coinpit_me.get_account()
```


```shell
PRIVATE_KEY_WIF="" # private_key in WIF format
python -c "import pycoinpit; coinpit_me = pycoinpit.Client($PRIVATE_KEY_WIF); print coinpit_me.get_account()"
```


### Send request using Authorization and nonce headers

```
curl -H 'Authorization: HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:0a9448430e631022ca75425805072ce7bad9d1f8229373fe64a479ab98a50ab3' -H 'Nonce 1478041315653' https://live.coinpit.me/api/v1/contract/BTC1/order/open
```

# API endpoints

In the examples below parameters are preceded by colon(:) For example, GET /contract/:symbol/order/:uuid would be accessed as
```
GET /contract/BTC1/order/123e4567-e89b-12d3-a456-426655440000
```
## Unprotected REST API endpoints

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/all/info](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#info)|Get Exchange information|
|GET|[/all/spec](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#spec)|Get contract specs for all exchange traded instruments|
|GET|[/all/config](#CONFIG)|General Exchange configuration|
|GET|[/all/bands](#BANDS)|GET external index prices for different instruments|

## Protected REST API endpoints

### Executions
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/all/executions](#BANDS)|GET recents executions |


### Open Orders

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/BTC1/chart/5](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#chart)| Get chart info for instrument BTC1|
|GET|[/contract/BTC1/order/open](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#order)|Get all my open orders|
|GET|[/contract/BTC1/order/:uuid](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#order)|Get a specific order|
|POST|[/contract/BTC1/order/open](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#createorder)|Create order|
|PUT|[/contract/BTC1/order/open](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#updateorder)|Update Order|
|DELETE|[/contract/BTC1/order/open/:uuid](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#deleteorder)|Delete a specific order|
|DELETE|[/contract/BTC1/order/open](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#cancelallorders)|Cancel all orders|

### Closed Orders

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/BTC1/order/closed?after=uuid](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#closedorder)|Get my closed orders after a particular uuid. if uuid not provided, latest set of orders are returned|

### Cancelled Orders

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/BTC1/order/cancelled?after=uuid](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#cancelledorder)|Get my cancelled orders after a particular uuid. if uuid not provided, latest set of orders are returned|
### Order Book

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/BTC1/orderbook](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#orderbook) |Get order book|

### Recent Trades

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/BTC1/trade](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#trade)|Get recent trades|

### Margin, Position, P&L, open orders
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#userdetails)|

### Margin

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account/margin](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#margin)|Get balance in margin account|
|POST|[/account/margin](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#margin)|Move coins from multisig to Margin account|
|DELETE|[/account/margin/:amount](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#margin)|Move specified amount of coins from margin account to multisig account|

### Position
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account/position](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#position)|Get all open positions|

### P&L
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account/pnl](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#pnl)|Get My P&L info|

### Multisig Account functions
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account/withdrawtx](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#withdrawtx)||
|GET|[/account/recoverytx](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#recoverytx)|Get Server signed Multisig account Recovery TX|
