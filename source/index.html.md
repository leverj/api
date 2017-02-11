---
title: Coinpit API

#language_tabs:
#  - curl
#  - python
#  - javascript

toc_footers:
  - Try our <a href='https://live.coinpit.me'>testnet site</a>.
  - Trade now at <a href='https://live.coinpit.io'>live site</a>.
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - examples

search: true
------------
# Loginless Authentication

Loginless Authentication is a zero-knowledge authentication system, which relies on ECDSA. The scheme involves arriving at a shared secret using your private key and the public key of the peer. Every request is HMAC authenticated using this shared secret.

## Benefits
Zero knowledge Authentication avoids setting session cookies and eliminates the following classes of attacks: Session Hijacking, Some kinds of replay attacks, Cookie sniffing and some XSS and XSRF attacks. Not having the password or session id on the server mitigates some kinds of attacks due to server breach. Zero knowledge systems never send passwords or cookies and are also safer in case of information leak from TLS issues such as Heartbleed bug

## Scheme

### Overview

Loginless requires you to set the Authorization header in HTTP for protected endpoints:

### Authorization \<user_id\>:\<hmac\>

```
Authorization HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:0a9448430e631022ca75425805072ce7bad9d1f8229373fe64a479ab98a50ab3
Nonce 1478041315653
```

### Setup ECDH

Getting the corresponding public address of the server for your personal public address:

GET /api/v1/auth/:my_public_key

```
Authorization HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk

GET api/v1/auth/038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df37

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
 function getAuthorization(userId, secret, method, uri, body, nonce) {
    if (!secret) return 'HMAC ' + userId
    var message = JSON.stringify({ method: method, uri: uri, body: body, nonce: nonce })
    var hmac    = crypto.createHmac('sha256', new Buffer(secret, 'hex'))
    hmac.update(message)
    return 'HMAC ' + userId + ":" + hmac.digest('hex')
  }
```

```curl
 function getAuthorization(userId, secret, method, uri, body, nonce) {
    if (!secret) return 'HMAC ' + userId
    var message = JSON.stringify({ method: method, uri: uri, body: body, nonce: nonce })
    var hmac    = crypto.createHmac('sha256', new Buffer(secret, 'hex'))
    hmac.update(message)
    return 'HMAC ' + userId + ":" + hmac.digest('hex')
  }
```



### Send request using Authorization and nonce headers

```
curl -H 'Authorization: HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:0a9448430e631022ca75425805072ce7bad9d1f8229373fe64a479ab98a50ab3' -H 'Nonce 1478041315653' https://live.coinpit.me/api/v1/contract/BTC1/order/open
```

# API endpoints

In the examples below parameters are preceded by colon(:) For example, GET /api/v1/contract/:symbol/order/:uuid would be accessed as
```
GET /api/v1/contract/BTC1/order/123e4567-e89b-12d3-a456-426655440000
```
## Unprotected REST API endpoints

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/all/info](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#info)|Get Exchange information|
|GET|[/api/v1/all/spec](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#spec)|Get contract specs for all exchange traded instruments|
|GET|[/api/v1/all/config](#CONFIG)|General Exchange configuration|
|GET|[/api/v1/all/bands](#BANDS)|GET external index prices for different instruments|

## Protected REST API endpoints

### Executions
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/all/executions](#BANDS)|GET recents executions |


### Open Orders

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/contract/BTC1/chart/5](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#chart)| Get chart info for instrument BTC1|
|GET|[/api/v1/contract/BTC1/order/open](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#order)|Get all my open orders|
|GET|[/api/v1/contract/BTC1/order/:uuid](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#order)|Get a specific order|
|POST|[/api/v1/contract/BTC1/order/open](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#createorder)|Create order|
|PUT|[/api/v1/contract/BTC1/order/open](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#updateorder)|Update Order|
|DELETE|[/api/v1/contract/BTC1/order/open/:uuid](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#deleteorder)|Delete a specific order|
|DELETE|[/api/v1/contract/BTC1/order/open](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#cancelallorders)|Cancel all orders|

### Closed Orders

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/contract/BTC1/order/closed?after=uuid](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#closedorder)|Get my closed orders after a particular uuid. if uuid not provided, latest set of orders are returned|

### Cancelled Orders

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/contract/BTC1/order/cancelled?after=uuid](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#cancelledorder)|Get my cancelled orders after a particular uuid. if uuid not provided, latest set of orders are returned|
### Order Book

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/contract/BTC1/orderbook](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#orderbook) |Get order book|

### Recent Trades

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/contract/BTC1/trade](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#trade)|Get recent trades|

### Margin, Position, P&L, open orders
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/account/userdetails](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#userdetails)|

### Margin

|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/account/margin](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#margin)|Get balance in margin account|
|POST|[/api/v1/account/margin](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#margin)|Move coins from multisig to Margin account|
|DELETE|[/api/v1/account/margin/:amount](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#margin)|Move specified amount of coins from margin account to multisig account|

### Position
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/account/position](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#position)|Get all open positions|

### P&L
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/account/pnl](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#pnl)|Get My P&L info|

### Multisig Account functions
|Method|Rest Endpoint|Description|
|---|---|---|
|GET|[/api/v1/account/withdrawtx](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#withdrawtx)||
|GET|[/api/v1/account/recoverytx](https://github.com/coinpit/coinpit.io/wiki/Coinpit-API-Spec#recoverytx)|Get Server signed Multisig account Recovery TX|
