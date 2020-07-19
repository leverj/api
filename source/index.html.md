---
title: Leverj API

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - Try out <a href='https://test.leverj.io/'>testnet site</a>.
  - Trade at <a href='https://live.leverj.io/'>mainnet site</a>
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - examples

search: true

code_clipboard: true
---
# Introduction

Leverj REST and Websocket API enable access to all features of the platform. The [testnet](https://test.leverj.io/) and [live](https://live.leverj.io/) sites are built entirely using this API and should be seen as one of the many possible platform implementations. The API could be leveraged to power a comprehensive set of tools and utilities, including automated trading clients and bots.

## Language SDK/Libraries

Currently we support only node.js for programmatic access.
  <ul>
  <li><a href="https://www.npmjs.com/package/@leverj/zka">@leverj/zka library</a>
  <li><a href="https://www.npmjs.com/package/@leverj/adapter">@leverj/adapter library</a>
  </ul>

Usage of these libraries will be illustrated in the following sections.

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

### Unified javascript Rest library

The <a href="https://github.com/leverj/REST">rest.js</a> library enables isomorphic usage of REST calls from either node.js or the browser using either browserify or as a `SCRIPT` tag in HTML

### In node.js
```javascript
  var restjs = require('rest.js')
  restjs.get("https://live.leverj.io/api/v1/all/info")
        .then(function(result) {
          console.log(result.body)
        })
```

### URL parameters

Url parameters are denoted by prepending a colon:

```
/instrument/:symbol/chart/:timeframe
```

The parameters `:symbol` and `:timeframe` need to be filled in when making a REST call to server.
To get chart for a specific symbol with id `LEVETH` for timeframe `5`, the actual url would be

```
https://live.leverj.io/api/v1/instrument/LEVETH/chart/5
```

### HTTP headers
HTTP 1.1 requires `Host` header. In the examples here, we have used testnet host `test.leverj.io`. For production use, you should change it to `live.leverj.io`. You need `Authorization` and `Nonce` headers for protected resources. You may also add other appropriate headers, which are omitted here for brevity.

<a name="loginless"></a>
# Zero Knowledge Authentication (ZKA)

Leverj uses a zero-knowledge authentication system. Leverj replaces the typical username and password based authentication scheme with a triplet of your account id, an apikey and a secret associated with the apikey. There is absolutely no need for the system to know about your account's private key. The apikey's secret is used to sign and confirm your identity but is not transfered over to the server either. The loginless system relies on ECDSA (Elliptic Curve Digital Signature Algorithm). The scheme involves signing message payload using an apikey's secret and subsequently using the elliptic curve signature elements to derive or recover the apikey. The recovered apikey is matched against the registered apikey. This pair of actions involving signing and recovery establishes trust and identity to facilitate authentication. Every request is authenticated using this mechanism.

You need to register online with the exchange to setup and download an apikey and its corresponding secret. When you register, you will be given an option to download your `Trading Pass`. The `Trading Pass` contains your accountId, apikey, and secret. An account can have multiple pairs of apikeys and their corresponding secrets.

Zero knowledge Authentication avoids setting session cookies and eliminates the following classes of attacks: session hijacking, some kinds of replay attacks, cookie sniffing, and some XSS and CSRF attacks. Not having the password or session id on the server mitigates some kinds of attacks due to server breach. Zero knowledge systems never send passwords or cookies and are also safer in case of information leak from TLS issues such as the Heartbleed bug.

## Overview

ZKA requires you to set `Authorization` and `Nonce` headers in HTTP for protected endpoints. This requires your account id, apikey and secret, which are in your Trading Pass, a JSON key file that you saved when you registered with the exchange and setup your apikey.

### Authorization and Nonce headers

The syntax for `Authorization` and `Nonce` headers is as below.

```
Authorization: SIGN <account_id>.<apiKey>.<v>.<r>.<s>
Nonce: <unix_time>
```

**v**, **r**, and **s** are ECDSA related elements. **r** and **s** are normal outputs of an ECDSA signature and **v** is the extra byte or header byte that helps in public key recovery.


For example, to get all configuration information:

```http
GET /api/v1/all/config HTTP/1.1
Host: test.leverj.io
Authorization: 'SIGN 0xE239Caeb4A6eCe2567fa5307f6b5D95149a5188F.0x12d80a4b0803Cf7D462EDF36963429B6aCfA3fFa.27.0x50eef94b262808ea42072dbe4375d0e908efea6e713b37b8ed729a63e56e4c23.0x4cf4c460baf43092b5350692179a833feb9dd855d6421570a2dc7d1f3325a952'
Nonce: 1550791374642
```

`/all/config` is an open endpoint and you don't need an API key to access it but similar header and signature structures are used when getting protected information.

We provide transparent and seamless authentication support for node.js via an easy to use javascript module and suggest you use it instead of rolling out your own.

### zka node module

The <a href="https://www.npmjs.com/package/zka">zka node module</a> will do all the handshake and authentication and enables interaction with REST and socket API transparently. This may be used from a browser using browserify.

Remember to initialize and configure your zka instance before making calls to the API endpoints.

```javascript
const zka = require("zka")(baseUrl, "/api/v1")
zka.init(accountId, apiKey, secret)
```

### Authentication with zka

### Nonce
To prevent replay attacks, all requests should include a nonce. The server expects UNIX time as the nonce. This requires a reasonably accurate clock on your client machine.

```
Nonce: 1550791374642
```
###  Clients with inaccurate clocks
If your client does not have an accurate clock or you are on an unusually slow network connection, you can compute the skew and apply it to all future requests using the `Server-Time` header in the HTTP responses. The zka node module does skew adjustment automatically. The non-cacheable HTTP methods `PUT`, `POST`, `DELETE` and `OPTIONS` return a `Server-Time` header.

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
|POST|[/order](#open-create-order)|Create orders|
|PUT|[/order](#open-update-order)|Update Orders|
|DELETE|[/order/:uuids](#open-cancel-order)|Delete specified orders|

### Get account information: Orders and Trades
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/account](#account)|
|GET|[/account/execution](#account-execution)|GET User's recent executions |


## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

