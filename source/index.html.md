---
title: Coinpit API

language_tabs:
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

<a name="sdk"></a>
## Language SDK/Libraries

Currently we support the following SDK for programmatic access
  <ul>
  <li><a href="https://github.com/coinpit/coinpit-client">Node.js Client</a>
  <li><a href="https://github.com/coinpit/pycoinpit">Python client</a>
  </ul>

## Unified javascript Rest library

The <a href="https://github.com/coinpit/REST">rest.js</a> library enables isomorphic usage of REST calls from either node.js or the browser using either browserify or as a SCRIPT tag in HTML

### In Browser
```html
  <script src="jquery.min.js"></script>
  <script src="https://raw.githubusercontent.com/coinpit/REST/master/index.js"></script>
  <script>
    restjs.get("https://live.coinpit.io/api/v1/all/info")
          .then(function(result) {
            console.log(result)
          })
  </script>
```
### In node.js
```coffeescript
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

The base url for all REST API is `https://live.coinpit.io/api/v1`. To request an endpoint, append it to the base url and make a request.

For example to access the `/all/info` endpoint:

### From the command line
```shell
curl https://live.coinpit.io/api/v1/all/info
```
### From your programming language
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

The parameters `:symbol` and `:orderid` need to be filled in when making a REST call to server.
To get a specific order with id `123e4567-e89b-12d3-a456-426655440000` of contract `BTC1`, the actual url would be

```
https://live.coinpit.io/api/v1/contract/BTC1/order/123e4567-e89b-12d3-a456-426655440000
```
### HTTP headers
HTTP 1.1 requires `Host` header. In the examples here, we have used testnet host `live.coinpit.me`. For production use, you should change it to `live.coinpit.io`. You also need `Authorization` and `Nonce` headers for protected resources. You may also add other appropriate headers, which are omitted here for brevity.

<a name="loginless"></a>
# Loginless Authentication

Loginless is a zero-knowledge authentication system, which relies on ECDSA. The scheme involves arriving at a shared secret using your private key and the public key of the peer. Every request is HMAC authenticated using this shared secret.

## Benefits
Zero knowledge Authentication avoids setting session cookies and eliminates the following classes of attacks: Session Hijacking, Some kinds of replay attacks, Cookie sniffing and some XSS and XSRF attacks. Not having the password or session id on the server mitigates some kinds of attacks due to server breach. Zero knowledge systems never send passwords or cookies and are also safer in case of information leak from TLS issues such as Heartbleed bug

## Overview

Loginless requires you to set the Authorization header in HTTP for protected endpoints. This requires your public key and user id, which are in your json key file that you saved when you first visit the web site.

### Authorization and Nonce headers

```
Authorization HMAC <user_id>:<hmac_sha256>
Nonce <unix_time>
```

```
Authorization HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:0a9448430e631022ca75425805072ce7bad9d1f8229373fe64a479ab98a50ab3
Nonce 1478041315653
```

### Setup ECDH

Getting the corresponding public address of the server for your personal public address:
`GET /api/v1/auth/:my_public_key`
### Send your public key
```http
GET /api/v1/auth/038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df37 HTTP/1.1
Accept: application/json
Host: live.coinpit.io
```
### Server returns it's public key
```json
{
"serverPublicKey": "03133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda7",
"userid": "mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk"
}
```

### Compute Shared Secret

Compute the shared secret using your private key and the server's public key

```javascript
  var bitcoin      = require('bitcoinjs-lib')
  var crypto       = require('crypto')
  var myEcdhKey    = getEcdhKey(bitcoin.ECPair.fromWIF(myPrivateKeyWif, bitcoin.networks[network]))
  var sharedSecret = myEcdhKey.computeSecret(serverPublicKeyHex, 'hex', 'hex')

  function getEcdhKey(privateKey) {
    var ecdhKey = crypto.createECDH('secp256k1')
    ecdhKey.generateKeys()
    ecdhKey.setPrivateKey(privateKey.d.toBuffer(32))
    ecdhKey.setPublicKey(privateKey.getPublicKeyBuffer())
    return ecdhKey
  }
```
```python

import binascii
import pybitcointools
import pyelliptic

network_code = 111 # 111 for testnet; 0 for livenet

pub_key_bytes           = binascii.unhexlify(self.server_pub_key)
uncompressed_user_key   = binascii.unhexlify(pybitcointools.decompress(self.user_pub_key))
uncompressed_server_key = binascii.unhexlify(pybitcointools.decompress(self.server_pub_key))
user_priv_key_bin       = binascii.unhexlify(pybitcointools.encode_privkey(self.private_key, 'hex', network_code))
self.user               = pyelliptic.ECC(privkey=user_priv_key_bin, pubkey=uncompressed_user_key, curve='secp256k1')
self.shared_secret      = self.user.get_ecdh_key(uncompressed_server_key)
```

### Nonce
To prevent replay attacks, all requests should include a nonce and the nonce is also used to compute HMAC. The server expects UNIX time as the nonce. This requires a reasonably accurate clock on your client machine.
If your client does not have an accurate clock or you are on an unusually slow network connection, you can compute the skew and apply it to all future requests using the Server-Time header in the HTTP responses. The node.js [SDK](#sdk) does this automatically.

```
Server-Time: 1478041315780
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
    nonce = str(long(time.time() * 1000))
    request_string = '{"method":"' + method + '","uri":"' + rest_url  + ('",' if(body == None) else '","body":' + body + ',') + '"nonce":' + nonce + '}'
    mac = hmac.new(self.shared_secret, request_string,    hashlib.sha256)
    sig = mac.hexdigest()
    headers = {
        'Authorization': 'HMAC ' + self.user_id + ':' + sig,
        'Nonce': nonce,
        'Accept': 'application/json'
    }
    return headers
```


### Send request using Authorization and nonce headers

```
curl -H 'Authorization: HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:0a9448430e631022ca75425805072ce7bad9d1f8229373fe64a479ab98a50ab3' -H 'Nonce 1478041315653' https://live.coinpit.me/api/v1/contract/BTC1/order/open
```

# Coinpit REST API

## Unprotected REST API endpoints
Unprotected endpoints do not require an `Authorization` header.

### Authentication
|Method|Rest Endpoint|Description|
|---|---|---|
|POST|[/auth](#auth)|Get Server public key for loginless auth|

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
All user specific endpoints require an `Authorization` and `Nonce` headers as described in the [Loginless](#loginless) section

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
