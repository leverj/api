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
/instrument/:symbol/order/:uuid
```

The parameters `:symbol` and `:uuid` need to be filled in when making a REST call to server.
To get a specific order with id `123e4567-e89b-12d3-a456-426655440000` of instrument `LEVETH`, the actual url would be

```
https://live.leverj.io/api/v1/instrument/LEVETH/order/123e4567-e89b-12d3-a456-426655440000
```

### Pagination
All resource objects have a Type-1 UUID that also represents creation time. Requests return results in descending order of creation time. By default the most recent object is returned with a page size of 100. Use the query parameter ```from``` to get data for the next page.

Example: If the last accessed page had the final item with uuid `123e4567-e89b-12d3-a456-426655440000`, to get page with subsequent items:

```
https://live.leverj.io/api/v1/instrument/LEVETH/executions?from=123e4567-e89b-12d3-a456-426655440000
```

### HTTP headers
HTTP 1.1 requires `Host` header. In the examples here, we have used testnet host `test.leverj.io`. For production use, you should change it to `live.leverj.io`. You also need `Authorization` and `Nonce` headers for protected resources. You may also add other appropriate headers, which are omitted here for brevity.

<a name="loginless"></a>
# Zero Knowledge Authentication (ZKA)

Leverj's uses a zero-knowledge authentication system. Leverj replaces the typical username and password based authentication scheme with a triplet of your account id, an apikey and a secret associated with the apikey. There is absolutely no need for the system to know about your account's private key. The apikey's secret is used to sign and confirm your identity but is not transfered over to the server either. The loginless system relies on ECDSA (Elliptic Curve Digital Signature Algorithm). The scheme involves signing message payload using an apikey's secret and subsequently using the elliptic curve signature elements to derive or recover the apikey. The recovered apikey is matched against the registered apikey. This pair of actions involving signing and recovery establishes trust and identity to facilitate authentication. Every request is authenticated using this mechanism.

You need to register online with the exchange to setup and download an apikey and its corresponding secret. An account can have multiple pairs of apikeys and their corresponding secrets.

Zero knowledge Authentication avoids setting session cookies and eliminates the following classes of attacks: session hijacking, some kinds of replay attacks, cookie sniffing, and some XSS and CSRF attacks. Not having the password or session id on the server mitigates some kinds of attacks due to server breach. Zero knowledge systems never send passwords or cookies and are also safer in case of information leak from TLS issues such as the Heartbleed bug.

## Overview

ZKA requires you to set `Authorization` and `Nonce` headers in HTTP for protected endpoints. This requires your account id, apikey and secret, which are in your JSON key file that you saved when you registered with the exchange and setup your apikey.

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

### Authentication with zka

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

### Send request using Authorization and nonce headers

```
curl -H "Authorization: 'SIGN 0x175692523CC570fB0E1856BFa190c7a89777347d.0x5fB9c0E7d496C89792f0F5C7d3b0337C0Bba7C3a.28.0x711802f48404ef5abbc0962370b750f4d6ef71a4336e8a691b4b42953022465a.0x23c14435d18e972b19119791ec5f9f120b24ed26fef4feda4b8efc74d8297a41'" -H 'Nonce 1529543915691' https://live.coinpit.me/api/v1/instrument/LEVETH/order
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

### Orders by instrument and status

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/instrument/:symbol/order/:uuid](#instrument-order-id)|Get specific order for a particular instrument|
|GET|[/instrument/:symbol/order/open](#instrument-order-open)|Get all open orders for a specific instrument|
|GET|[/instrument/:symbol/order/closed?from=uuid](#instrument-order-closed)|Get closed orders. Use uuid of last item to fetch next page|
|GET|[/instrument/:symbol/order/cancelled?from=uuid](#instrument-order-cancelled)|Get closed orders. Use uuid of last item to fetch next page|

### Get account information: Margin, Position, P&L, open orders
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account](#account)|
|GET|[/account/execution](#account-execution)|GET User's recent executions |


