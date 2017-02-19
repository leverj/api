---
title: Coinpit API

language_tabs:
  - shell
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

The <a href="https://github.com/coinpit/REST">rest.js</a> library enables isomorphic usage of REST calls from either node.js or the browser using either browserify or as a SCRIPT tag in HTML

```html
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

Loginless is a zero-knowledge authentication system, which relies on ECDSA. The scheme involves arriving at a shared secret using your private key and the public key of the peer. Every request is HMAC authenticated using this shared secret.

## Benefits
Zero knowledge Authentication avoids setting session cookies and eliminates the following classes of attacks: Session Hijacking, Some kinds of replay attacks, Cookie sniffing and some XSS and XSRF attacks. Not having the password or session id on the server mitigates some kinds of attacks due to server breach. Zero knowledge systems never send passwords or cookies and are also safer in case of information leak from TLS issues such as Heartbleed bug

## Overview

Loginless requires you to set the Authorization header in HTTP for protected endpoints:

## Authorization and Nonce headers

```
Authorization HMAC <user_id>:<hmac_sha256>
Nonce <unix_time>
```

```
Authorization HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:0a9448430e631022ca75425805072ce7bad9d1f8229373fe64a479ab98a50ab3
Nonce 1478041315653
```

## Setup ECDH

Getting the corresponding public address of the server for your personal public address:

GET /api/v1/auth/:my_public_key

```
GET /api/v1/auth/038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df37
Accept: application/json
```
```json
{
"serverPublicKey": "03133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda7",
"userid": "mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk"
}
```

You also get the server clock in the Server-Time header. If your client does not have an accurate clock or you are on an unusually slow network connection, you can compute the skew and apply it to all future requests.

```
Server-Time: 1478041315780
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

### General Exchange data
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/all/info](#all-info)|Last price, 24Hr volume, etc|
|GET|[/all/band](#all-band)|GET external index prices for different instruments|

### Exchange configuration
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/all/spec](#all-spec)|Get contract specs for all exchange traded instruments|
|GET|[/all/config](#all-config)|General Exchange configuration|


## Protected REST API endpoints

### Open Orders

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/:symbol/chart/5](#contract-chart)| Get chart info for instrument :symbol|
|GET|[/contract/:symbol/order/open](#contract-order-all)|Get all my open orders|
|GET|[/contract/:symbol/order/:uuid](#contract-order-id)|Get a specific order|
|POST|[/contract/:symbol/order/open](#contract-create-order)|Create order|
|PUT|[/contract/:symbol/order/open](#contract-update-order)|Update Order|
|DELETE|[/contract/:symbol/order/open/:uuid](#contract-cancel-order)|Delete a specific order|
|DELETE|[/contract/:symbol/order/open](#contract-cancel-all)|Cancel all orders|
|PATCH|[/contract/:symbol/order/open](#contract-patch-order)|Combined create/update/cancel|

### Closed Orders

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/:symbol/order/closed?after=uuid](#contract-order-closed)|Get my closed orders after a particular uuid. if uuid not provided, latest set of orders are returned|

### Cancelled Orders

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/:symbol/order/cancelled?after=uuid](#contract-order-cancelled)|Get my cancelled orders after a particular uuid. if uuid not provided, latest set of orders are returned|
### Order Book

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/:symbol/orderbook](#contract-orderbook) |Get order book|

### Recent Trades

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/:symbol/trade](#contract-recent-trade)|Get recent trades|

### User Executions
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account/execution](#account-execution)|GET User's recent executions |

### Margin, Position, P&L, open orders
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account](#account)|

### Margin

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account/margin](#account-margin)|Get balance in margin account|
|POST|[/account/margin](#account-margin-move)|Move coins from multisig to Margin account|
|DELETE|[/account/margin/:amount](#account-margin-clear)|Move specified amount of coins from margin account to multisig account|

### Position
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account/position](#account-position)|Get all open positions|

### P&L
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account/pnl](#account-pnl)|Get My P&L info|

### Multisig Account functions
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account/withdrawtx](#account-withdrawtx)||
|GET|[/account/recoverytx](#account-recoverytx)|Get Server signed Multisig account Recovery TX|
