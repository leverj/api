---
title: Leverj API

language_tabs:
  - python
  - javascript

toc_footers:
  - Try our <a href='https://test.leverj.io/'>testnet site</a>.
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - examples
  - socket
  - errors

search: true
---
# Introduction

Leverj REST and Websocket API enable access to all features of the platform. The [testnet](https://test.leverj.io/) and [live](https://live.leverj.io/) sites are built entirely using this API and should be seen as one of the many possible platform implementations. The API could be leveraged to power a comprehesive set of tools and utilities, including automated trading clients and bots.

Please refer to [JSON field definitions](https://leverj.io/docs/definitions.html) for more information.

<a name="sdk"></a>

## Language SDK/Libraries

Currently we support node.js and python for programmatic access. Select your programming language on the top right of the page to select code examples appropriately. Python code examples and the client library is compatible with Python3.
  <ul>
  <li><a href="https://github.com/leverj/leverj-client">Node.js client</a>
  <li><a href="https://github.com/leverj/pyleverj">Python client</a>
  </ul>

## Scheme

```
REST URL = BASE_URL + ENDPOINT
```

### Base URL

The base url for all REST API for the live site is `https://live.leverj.io/api/v1`. For testnet use `https://test.leverj.io/api/v1`.
To request an endpoint, append it to the base url and make a request.

For example to access the `/all/info` endpoint:

### From the command line
```shell
curl https://live.leverj.io/api/v1/all/info
```
### From your programming language
```python
import requests
print(requests.get("https://live.leverj.io/api/v1/all/info").text)
```

```javascript
restjs.get("https://live.leverj.io/api/v1/all/info")
 .then(function(info) {
   console.log(info)
  })
```
### Unified javascript Rest library

The <a href="https://github.com/coinpit/REST">rest.js</a> library enables isomorphic usage of REST calls from either node.js or the browser using either browserify or as a `SCRIPT` tag in HTML

### In Browser
```html
  <script src="jquery.min.js"></script>
  <script src="https://raw.githubusercontent.com/coinpit/REST/master/index.js"></script>
  <script>
    restjs.get("https://live.leverj.io/api/v1/all/info")
          .then(function(result) {
            console.log(result)
          })
  </script>
```
### In node.js
```javascript
  var restjs = require('rest.js')
  restjs.get("https://live.leverj.io/api/v1/all/info")
        .then(function(result) {
          console.log(result)
        })
```

### URL parameters

Url parameters are denoted by prepending a colon:

```
/contract/:symbol/order/:uuid
```

The parameters `:symbol` and `:uuid` need to be filled in when making a REST call to server.
To get a specific order with id `123e4567-e89b-12d3-a456-426655440000` of instrument `LEVETH`, the actual url would be

```
https://live.leverj.io/api/v1/contract/BTCUSDW/order/123e4567-e89b-12d3-a456-426655440000
```

### Pagination
All resource objects have a Type-1 UUID that also represents creation time. Requests return results in descending order of creation time. By default the most recent object is returned with a page size of 100. Use the query parameter ```from``` to get data for the next page.

Example: If the last accessed page had the final item with uuid `123e4567-e89b-12d3-a456-426655440000`, to get page with subsequent items:

```
https://live.leverj.io/api/v1/contract/BTCUSDW/executions?from=123e4567-e89b-12d3-a456-426655440000
```

### HTTP headers
HTTP 1.1 requires `Host` header. In the examples here, we have used testnet host `live.coinpit.me`. For production use, you should change it to `live.leverj.io`. You also need `Authorization` and `Nonce` headers for protected resources. You may also add other appropriate headers, which are omitted here for brevity.

## Quickstart using Coinpit shell: coinpit.py

The python package [`pycoinpit`](https://pypi.python.org/pypi/pycoinpit) enables a shell like interaction with the leverj.io API and enables you to enter REST commands and have them translated to authenticated REST calls. The ```-p``` or ```--pretty``` option pretty-prints JSON responses. The ```-v``` or `--verbose` option in addition also dumps headers.

```shell
$ pip install pycoinpit

$ coinpit.py -v -k mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj.json

Using keyfile:  mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj.json

Connected to  https://live.coinpit.me/api/v1
Enter REST commands: METHOD path body. Enter quit to exit
For more information: https://leverj.io/api

Examples:
  GET /account
  POST /order [{"price":1201.2,"side":"buy","quantity":10,"orderType":"LMT","instrument":"BTCUSDW"}]
  PUT /order [{"price":1201.3,"uuid":"b117ef30-1f50-11e7-b324-e2f410d2f5f7"}]
  GET /order
  DELETE /order/b117ef30-1f50-11e7-b324-e2f410d2f5f7

mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj>
```

REST commands may be entered at the prompt as HTTP method, url and optional body. The shell performs authenticated REST call and displays the result

```
mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj>get /account
```
```http
GET https://live.coinpit.me/api/v1/account HTTP/1.0
Nonce: 1492043473117
Accept: application/json
Authorization: HMAC mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj:f6d59269584a86f7457e23c8c61e8aba4c5d9fca1fe800fd3536caa22a3348fd
```
```
===================================

200
===================================
```
```json
{
    "displayMargin":9414800,
    "positions":{},
    "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
    "margin":9414800,
    "orders":{
        "BTCUSD7J14":{
            "6feea600-1fa7-11e7-883c-2b1c532b3fc4":{
                "marginPerQty":27815,
                "stopPrice":2,
                "eventTime":1492018965601165,
                "uuid":"6feea600-1fa7-11e7-883c-2b1c532b3fc4",
                "instrument":"BTCUSD7J14",
                "orderType":"LMT",
                "filled":0,
                "status":"open",
                "normalizedPrice":8325008,
                "price":1201.2,
                "entryTime":1492018965601165,
                "targetPrice":3,
                "cancelled":0,
                "averagePrice":0,
                "side":"buy",
                "quantity":10
            }
        },
        "BTCUSD7J21":{}
    },
    "accountMargin":9971100
}
```
<a name="loginless"></a>
# Loginless or ZKA

Leverj's loginless authentication is a zero-knowledge authentication system. Leverj replaces the typical username and password based authentication scheme with a triplet of your account id, an apikey and a secret associated with the apikey. There is absolutely no need for the system to know about your account's private key. The apikey's secret is used to sign and confirm your identity but is not transfered over to the server either. The loginless system relies on ECDSA (Elliptic Curve Digital Signature Algorithm). The scheme involves signing message payload using an apikey's secret and subsequently using the elliptic curve signature elements to derive or recover the apikey. The recovered apikey is matched against the registered apikey. This pair of actions involving signing and recovery establishes trust and identity to facilitate authentication. Every request is authenticated using this mechanism.

You need to register online with the exchange to setup and download an apikey and its corresponding secret. An account can have multiple pairs of apikeys and their corresponding secrets.

Zero knowledge Authentication avoids setting session cookies and eliminates the following classes of attacks: session hijacking, some kinds of replay attacks, cookie sniffing, and some XSS and CSRF attacks. Not having the password or session id on the server mitigates some kinds of attacks due to server breach. Zero knowledge systems never send passwords or cookies and are also safer in case of information leak from TLS issues such as the Heartbleed bug.

## Overview

Loginless requires you to set `Authorization` and `Nonce` headers in HTTP for protected endpoints. This requires your account id, apikey and secret, which are in your JSON key file that you saved when you registered with the exchange and setup your apikey.

### Authorization and Nonce headers

The syntax for `Authorization` and `Nonce` headers is as below.

```
Authorization: SIGN <account_id>.<apiKey>.<v>.<r>.<s>
Nonce: <unix_time>
```

**v**, **r**, and **s** are ECDSA related elements. **r** and **s** are normal outputs of an ECDSA signature and **v** is the extra byte or header byte that helps in public key recovery.


For example, to get account information:

```http
GET /api/v1/account HTTP/1.1
Host: live.leverj.io
Authorization: 'SIGN 0x175692523CC570fB0E1856BFa190c7a89777347d.0x5fB9c0E7d496C89792f0F5C7d3b0337C0Bba7C3a.28.0x711802f48404ef5abbc0962370b750f4d6ef71a4336e8a691b4b42953022465a.0x23c14435d18e972b19119791ec5f9f120b24ed26fef4feda4b8efc74d8297a41'
Nonce: 1529543915691
```

We support transparent authentication support for node.js and python and suggest you use them instead of rolling out your own

### zka node module

The zka node module will do all the handshake and authentication and enables interaction with REST and socket API transparently. This may be used from a browser using browserify.

```coffeescript
const zka    = require("zka")(baseUrl, "/api/v1")
zka.init(accountId, apiKey, secret)
```

## Authentication with loginless server

If you prefer a programming language that does not yet have loginless library, you can authenticate using the scheme below:

### Setup ECDH

Getting the corresponding public address of the server for your personal public address:
`GET /api/v1/auth/:my_public_key`
### Send your public key
```http
GET /api/v1/auth/038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df37 HTTP/1.1
Accept: application/json
Host: live.leverj.io
```
### Server returns the corresponding public key
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

```
Nonce: 1478041310000
```
###  Clients with inaccurate clocks
If your client does not have an accurate clock or you are on an unusually slow network connection, you can compute the skew and apply it to all future requests using the `Server-Time` header in the HTTP responses. The node.js [SDK](#sdk) does skew adjustment automatically. The non-cacheable HTTP methods `PUT`, `POST`, `DELETE` and `OPTIONS` return a `Server-Time` header.

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
curl -H 'Authorization: HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:0a9448430e631022ca75425805072ce7bad9d1f8229373fe64a479ab98a50ab3' -H 'Nonce 1478041315653' https://live.coinpit.me/api/v1/contract/BTCUSDW/order
```

# Leverj REST API

## Unprotected REST API Endpoints
Unprotected endpoints do not require an `Authorization` header.

### General Exchange Data
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/all/info](#all-info)|Last price, 24Hr volume, etc|

### Exchange Configuration
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/all/spec](#all-spec)|Get specs for all exchange traded instruments|
|GET|[/all/config](#all-config)|Get exchange configuration parameters|

### Market Data
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/instrument/:symbol/trade](#instrument-recent-trade)|Get recent trade data|
|GET|[/instrument/:symbol/chart/:timeframe](#instrument-chart)|Get chart data for instrument|
|GET|[/instrument/:symbol/orderbook](#instrument-orderbook)|Get order book for the instrument|

## Protected REST API endpoints
All user specific endpoints require `Authorization` and `Nonce` headers as described in the [Loginless or ZKA](#loginless) section

### Open Orders

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/order](#open-order-all)|Get all open orders|
|GET|[/order/:uuid](#open-order-id)|Get a specific open order|
|POST|[/order](#open-create-order)|Create orders|
|PUT|[/order](#open-update-order)|Update Orders|
|DELETE|[/order/:uuids](#open-cancel-order)|Delete specified orders|
|PATCH|[/order](#open-patch-order)|Combined create/update/cancel|

### Orders by contract and status

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/:symbol/order/:uuid](#contract-order-id)|Get specific order for a particular contract|
|GET|[/contract/:symbol/order/open](#contract-order-open)|Get all open orders for a specific contract|
|GET|[/contract/:symbol/order/closed?from=uuid](#contract-order-closed)|Get closed orders. Use uuid of last item to fetch next page|
|GET|[/contract/:symbol/order/cancelled?from=uuid](#contract-order-cancelled)|Get closed orders. Use uuid of last item to fetch next page|

### Order Book
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/:symbol/orderbook](#contract-orderbook) |Get order book|

### Recent Trades
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/contract/:symbol/trade](#contract-recent-trade)|Get recent trades|

### Get account information: Margin, Position, P&L, open orders
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account](#account)|
|GET|[/account/execution](#account-execution)|GET User's recent executions |


