---
title: API Reference

language_tabs:
  - curl
  - python
  - javascript

toc_footers:
  - Try our <a href='https://live.coinpit.me'>testnet site</a>.
  - Trade now at <a href='https://live.coinpit.io'>live site</a>.
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

### Benefits
Zero knowledge Authentication avoids setting session cookies and eliminates the following classes of attacks: Session Hijacking, Some kinds of replay attacks, Cookie sniffing and some XSS and XSRF attacks. Not having the password or session id on the server mitigates some kinds of attacks due to server breach. Zero knowledge systems never send passwords or cookies and are also safer in case of information leak from TLS issues such as Heartbleed bug

## Scheme

### Overview

Loginless requires you to set the Authorization header in HTTP for protected endpoints:

#### Authorization \<user_id\>:\<hmac\>

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

```javascript
Server-Time 1478041315780
```

### Compute Shared Secret

```javascript
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

### Send request using Authorization and nonce headers

```curl
curl -H 'Authorization: HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:0a9448430e631022ca75425805072ce7bad9d1f8229373fe64a479ab98a50ab3' -H 'Nonce 1478041315653' https://live.coinpit.me/api/v1/contract/BTC1/order/open
```

# Authentication

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve
