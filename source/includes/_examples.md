# Examples
Examples are structured as follows:

|Section|Description|
|---|---|
|Title|What the /api endpoint stands for|
|URL template|Any colon prepended tokens are url parameters|
|HTTP Request|Abbreviated HTTP request|
|Server Response|Including expected HTTP error code|

<a name="auth"></a>
## Get Loginless Server pubkey
If you have already registered your public key, for example by signing on via the trading site, you can use the public key from the json key file to get the server's public key. The server uses a different key for each user.
### GET /api/v1/auth
### 200 OK
```http
GET /api/v1/auth/038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df37 HTTP/1.1
Accept: application/json
Host: live.coinpit.me
```
### 200 OK
```json
{
"serverPublicKey": "03133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda7",
"userid": "mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk"
}
```
## Register Loginless User
It is easiest to register on the trading site, but if you wish to programmatically register a user, you can do so by sending a signed message with your public key, country and IP of registration. During registration, your IP needs to match your country code. Our [SDK](#sdk) enables you to do the signatures easily.
### POST /api/v1/auth
```http
POST /api/v1/auth/038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df37 HTTP/1.1
Accept: application/json
Host: live.coinpit.me
```
```json
[
  {
    "message":"{\"publicKey\":\"039d43948b9ce88893f3f3cb61d1995142741418f86412f1d5fcc12a010a753ac8\",\"country\":\"DK\",\"timestamp\":1487534736607,\"ip\":\"127.0.0.1\",\"introducerid\":\"\"}",
    "signature":"IF3239UZOPfdU3Ko8Wxf1Ohu5v0SF8TiXhdd66Nb2S4XXDyftF4r7ev1y/S/SGULLX9VxEMi4CJEmtiGzrHDCf0="
  }
]
```
### 200 OK
```json
 {"userid":"my7hu7RZDhRRBFRHXgqDMbbtCNX8rokGS9","serverPublicKey":"03cfa0eb0226f9c189967f048ba575b989bded84bebf4042e08571384f12252408"}
```
<a name="all-info"></a>
## Exchange Basic Info
### GET /api/v1/all/info
```http
GET /api/v1/all/info HTTP/1.1
Accept: application/json
Host: live.coinpit.me
```
### 200 OK
```json
{
    "BTCUSD7J21":{
        "lastPrice":1218.2,
        "vol24H":{
            "instrument":"BTCUSD7J21",
            "btc":0,
            "qty":0
        },
        "bid":1223,
        "ask":1224.1,
        "indexPrice":1217.3,
        "openInterest":{
            "instrument":"BTCUSD7J21",
            "btc":3.35991635,
            "qty":40
        }
    },
    "BTCUSD7J14":{
        "lastPrice":1216.9,
        "vol24H":{
            "instrument":"BTCUSD7J14",
            "btc":2.95598808,
            "qty":36
        },
        "bid":1217.2,
        "ask":1217.9,
        "indexPrice":1217.3,
        "openInterest":{
            "instrument":"BTCUSD7J14",
            "btc":2.30003528,
            "qty":28
        }
    },
    "BTCUSD":{
        "aggregate":true,
        "vol24H":{
            "btc":2.95598808,
            "qty":36
        },
        "openInterest":{
            "btc":5.65995163,
            "qty":68
        },
        "indexPrice":1217.3
    }
}
```
<a name="all-band"></a>
## Anti-Manipulation bands
### GET /api/v1/all/band
```http
GET /api/v1/all/band HTTP/1.1
Accept: application/json
Host: live.coinpit.me
```
### 200 OK
```json
{
    "BTCUSD7J14":{
        "max":1227.7,
        "price":1217.7,
        "instrument":"BTCUSD7J14",
        "min":1207.7
    },
    "BTCUSD7J21":{
        "max":1229.9,
        "price":1217.7,
        "instrument":"BTCUSD7J21",
        "min":1205.5
    }
}

```
<a name="all-spec"></a>
## Contract Specs
### GET /api/v1/all/spec
```http
GET /api/v1/all/spec HTTP/1.1
Accept: application/json
Host: live.coinpit.me
```
### 200 OK
```json
{
    "instruments":[
        "BTCUSD7J14",
        "BTCUSD7J21"
    ],
    "parameter":{
        "BTCUSD7J14":{
            "maxLeverage":50,
            "expiryClass":"weekly",
            "bandUpperLimit":10,
            "minLimitStop":1.6,
            "minMarketStop":1.6,
            "bandLowerLimit":10,
            "ticksize":1,
            "uplDecimalPlaces":4,
            "start":1490980500000,
            "next":"BTCUSD7J21",
            "commission":0.0005,
            "template":"BTCUSD",
            "crossMarginInitialStop":15,
            "type":"inverse",
            "introducerReward":0,
            "status":"active",
            "targetprice":3,
            "symbol":"BTCUSD7J14",
            "expiry":1492190100000,
            "contractusdvalue":100,
            "introducedReward":0,
            "externalFeed":"coinpit-index#BTCUSD",
            "stopcushion":2,
            "ticksperpoint":10,
            "stopprice":2,
            "rewardsCalculationInterval":14400,
            "reward":0
        },
        "BTCUSD7J21":{
            "maxLeverage":50,
            "expiryClass":"weekly",
            "bandUpperLimit":0.01,
            "minLimitStop":1.6,
            "minMarketStop":1.6,
            "bandLowerLimit":0.01,
            "ticksize":1,
            "uplDecimalPlaces":4,
            "start":1491585300000,
            "next":"BTCUSD7J28",
            "commission":0.0005,
            "template":"BTCUSD",
            "crossMarginInitialStop":15,
            "type":"inverse",
            "introducerReward":0,
            "status":"active",
            "targetprice":3,
            "symbol":"BTCUSD7J21",
            "expiry":1492794900000,
            "contractusdvalue":100,
            "introducedReward":0,
            "externalFeed":"coinpit-index#BTCUSD",
            "stopcushion":2,
            "ticksperpoint":10,
            "stopprice":2,
            "rewardsCalculationInterval":14400,
            "reward":0
        }
    }
}
```

<a name="contract-chart"></a>
## Chart for contract
### /api/v1/contract/:symbol/chart/:timeframe
```http
GET /api/v1/contract/BTC1/chart/5 HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:0a9448430e631022ca75425805072ce7bad9d1f8229373fe64a479ab98a50ab3
Nonce: 1481655922696
```
### 200 OK
```json
[
  {
    "v": 0,
    "s": 0,
    "t": 1481655900,
    "o": 779.4,
    "h": 779.5,
    "l": 779.4,
    "c": 779.5,
    "instrument": "BTC1"
  },
  {
    "v": 0,
    "s": 0,
    "t": 1481655600,
    "o": 779.6,
    "h": 779.6,
    "l": 779.5,
    "c": 779.6,
    "instrument": "BTC1"
  }
]
```
<a name="contract-order-all"></a>
## Get all orders
### GET /api/v1/contract/:symbol/order
```http
GET /api/v1/contract/BTC1/order HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1480957451447
```
### 200 OK
```json
[
   {
      "uuid":"7cf5d9a0-bb0b-11e6-ad8c-feca0c133dfb",
      "userid":"mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
      "side":"buy",
      "quantity":1,
      "filled":0,
      "cancelled":0,
      "price":752.1,
      "averagePrice":0,
      "entryTime":1480956869690928,
      "eventTime":1480956869690928,
      "status":"open",
      "entryOrder":{

      },
      "orderType":"LMT",
      "stopPrice":2.8,
      "targetPrice":"NONE",
      "clientid":"7bdfd5c0-bb0b-11e6-91e6-571f03ad5182",
      "instrument":"BTC1",
      "commission":10000,
      "reward":-2500,
      "cushion":1,
      "reservedTicks":2,
      "crossMargin":false
   },
   {
      "uuid":"6cc52580-bb0c-11e6-b831-df21626bb966",
      "userid":"mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
      "side":"buy",
      "quantity":3,
      "filled":0,
      "cancelled":0,
      "price":752.2,
      "averagePrice":0,
      "entryTime":1480957272024245,
      "eventTime":1480957272024245,
      "status":"open",
      "entryOrder":{

      },
      "orderType":"LMT",
      "stopPrice":2.8,
      "targetPrice":"NONE",
      "clientid":"6badc210-bb0c-11e6-b1b0-31a3e9373a6c",
      "instrument":"BTC1",
      "commission":10000,
      "reward":-2500,
      "cushion":1,
      "reservedTicks":2,
      "crossMargin":false
   }
]
```
<a name="contract-order-id"></a>
## Get order by id
### GET /api/v1/contract/:symbol/order/:uuid
```http
GET /api/v1/contract/BTC1/order/open/503eb8a0-c7b3-11e6-a1d4-539d1cb6cbbc HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1481655922696
```
### 200 OK
```json
[
   {
      "uuid":"503eb8a0-c7b3-11e6-a1d4-539d1cb6cbbc",
      "userid":"mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd",
      "side":"sell",
      "quantity":1,
      "filled":0,
      "cancelled":0,
      "price":814.8,
      "averagePrice":0,
      "entryTime":1482348434328077,
      "eventTime":1482348364074468,
      "status":"open",
      "entryOrder":{
         "50192f40-c7b3-11e6-ba51-b8bd8cf25f84":1
      },
      "orderType":"STP",
      "stopPrice":7.2,
      "targetPrice":"NONE",
      "instrument":"BTC1",
      "oco":"503eb8a1-c7b3-11e6-bbb6-4029c20f8e39",
      "maxStop":814,
      "entryPrice":822.3,
      "entryAmount":822.3,
      "commission":10000,
      "reward":-2500,
      "cushion":1,
      "reservedTicks":2,
      "crossMargin":false
   }
]
```
<a name="contract-create-order"></a>
## Create New Order
### POST /api/v1/contract/:symbol/order
```http
POST /api/v1/contract/BTC1/order HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1481655922696
```
```json
[
   {
      "userid":"mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd",
      "side":"sell",
      "quantity":1,
      "price":790,
      "orderType":"LMT",
      "clientid":"de12c110-c616-11e6-8cd0-fbf50c0d0231",
      "stopPrice":30.6,
      "crossMargin":false,
      "targetPrice":"NONE",
      "postOnly":false
   }
]
```
### 200 OK
```json
[
   {
      "uuid":"de730980-c616-11e6-948a-14e8eedc81d8",
      "userid":"mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd",
      "side":"sell",
      "quantity":1,
      "filled":0,
      "cancelled":0,
      "price":790,
      "averagePrice":0,
      "entryTime":1482171220504726,
      "eventTime":1482171220504726,
      "status":"open",
      "entryOrder":{

      },
      "orderType":"LMT",
      "stopPrice":30.6,
      "targetPrice":"NONE",
      "clientid":"de12c110-c616-11e6-8cd0-fbf50c0d0231",
      "instrument":"BTC1",
      "commission":10000,
      "reward":-2500,
      "cushion":1,
      "reservedTicks":2,
      "crossMargin":false
   }
]
```
<a name="contract-update-order"></a>
## Update Orders
### PUT /api/v1/contract/:symbol/order/open
```http
PUT /api/v1/contract/BTC1/order/open HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:26751dd64f75523257a3aeda5f2d59e68f4322500bcbc4beaa8ad27754ddd62b
Nonce: 1482348434637
```
```json
[
    {
       "uuid":"503eb8a0-c7b3-11e6-a1d4-539d1cb6cbbc",
       "price":814.8
    }
]
```
### 200 OK
```json
[
   {
      "uuid":"503eb8a0-c7b3-11e6-a1d4-539d1cb6cbbc",
      "userid":          "mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd",
      "side":"sell",
      "quantity":        1,
      "filled":          0,
      "cancelled":       0,
      "price":814.8,
      "averagePrice":    0,
      "entryTime":1482348434328077,
      "eventTime":1482348364074468,
      "status":          "open",
      "entryOrder":{
         "50192f40-c7b3-11e6-ba51-b8bd8cf25f84":1
      },
      "orderType":"STP",
      "stopPrice":7.2,
      "targetPrice":     "NONE",
      "instrument":      "BTC1",
      "oco":"503eb8a1-c7b3-11e6-bbb6-4029c20f8e39",
      "maxStop":814,
      "entryPrice":822.3,
      "entryAmount":822.3,
      "commission":10000,
      "reward":          -2500,
      "cushion":         1,
      "reservedTicks":   2,
      "crossMargin":     false
   }
]
```
<a name="contract-cancel-order"></a>
## Cancel order by Id
### DELETE /api/v1/contract/:symbol/order/:uuid
```http
DELETE /api/v1/contract/BTC1/order/adcb4c70-b72a-11e6-9b68-be1cfc0a27e0 HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:fbe7496da2d6f82657d15ad2bf997ca778704f814d8e4601159f4a5519d885e4
Nonce: 1482347623909
```
### 200 OK
```json
[
   "adcb4c70-b72a-11e6-9b68-be1cfc0a27e0"
]
```
<a name="contract-cancel-all"></a>
## Cancel All Orders
### DELETE /api/v1/contract/:symbol/order
```http
DELETE /api/v1/contract/BTC1/order HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:fbe7496da2d6f82657d15ad2bf997ca778704f814d8e4601159f4a5519d885e4
Nonce: 1482347623909
```
```json
[
   "adcb4c70-b72a-11e6-9b68-be1cfc0a27e0"
]
```
### 200 OK
```json
[
   "adcb4c70-b72a-11e6-9b68-be1cfc0a27e0"
]
```

<a name="contract-patch-order"></a>
## Combined create/update/cancel

The PATCH method uses the syntax for [RFC6902](https://tools.ietf.org/html/rfc6902). In addition to the standard ops, we have added `merge` and `split` for position management

|PATCH op|Order operation|
|---|---|
|add|Create new order|
|remove|Delete order|
|replace|Update order|
|split|Split position|
|merge|Merge positions

### PATCH /contract/:symbol/order
```http
PATCH /api/v1/contract/BTC1/order HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1482349148300
```
```json
[
   {
      "op":"remove",
      "path":"/0d71f940-c7b5-11e6-9906-9cd1c95275e5"
   },
   {
       "op":"replace",
       "value":[
           {
               "uuid":"cbf3a610-f6cd-11e6-bc1d-6c1a7dacf393",
               "price":1046.9
           }
       ]
   },
   {
       "op":    "add",
       "value": [
         {
           "userid":      "mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd",
           "side":        "buy",
           "quantity":    1,
           "price":       1035.3,
           "orderType":   "LMT",
           "clientid":    "b825ce03-fb16-4fd7-8fbe-e225803509a4",
           "stopPrice":   4.2,
           "crossMargin": false,
           "targetPrice": "NONE",
           "postOnly":    false
         }
       ]
   }
]
```
### 200 OK
```json
[
   {
      "op":"remove",
      "path":"/19b3a371-c7b5-11e6-a305-6ee5416bea55",
      "response":[
         "19b3a371-c7b5-11e6-a305-6ee5416bea55"
      ]
   },
   {
      "op":"remove",
      "path":"/0d71f940-c7b5-11e6-9906-9cd1c95275e5",
      "response":[
         "0d71f940-c7b5-11e6-9906-9cd1c95275e5"
      ]
   },
   {
       "op":       "replace",
       "response": [
         {
           "uuid":            "cb785b90-f6cd-11e6-88b2-f1d8ad444001",
           "userid":          "mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd",
           "side":            "buy",
           "quantity":        1,
           "filled":          0,
           "cancelled":       0,
           "price":           1048.7,
           "normalizedPrice": 1048.7,
           "averagePrice":    0,
           "entryTime":       1487530149292084,
           "eventTime":       1487527442377593,
           "status":          "open",
           "entryOrder":      {},
           "orderType":       "LMT",
           "stopPrice":       4.3,
           "targetPrice":     "NONE",
           "clientid":        "06b235a8-e9dd-4b25-a824-18f27d927402",
           "instrument":      "BTC1",
           "commission":      20000,
           "reward":          -2500,
           "cushion":         1,
           "reservedTicks":   2,
           "crossMargin":     false
         }
       ]
     },
     {
         "op":       "add",
         "response": [
           {
             "uuid":            "16f9fe70-f6d8-11e6-ad01-e5a16988c694",
             "userid":          "mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd",
             "side":            "buy",
             "quantity":        1,
             "filled":          0,
             "cancelled":       0,
             "price":           1035.3,
             "normalizedPrice": 1035.3,
             "averagePrice":    0,
             "entryTime":       1487531864023840,
             "eventTime":       1487531864023840,
             "status":          "open",
             "entryOrder":      {},
             "orderType":       "LMT",
             "stopPrice":       4.2,
             "targetPrice":     "NONE",
             "clientid":        "b825ce03-fb16-4fd7-8fbe-e225803509a4",
             "instrument":      "BTC1",
             "commission":      20000,
             "reward":          -2500,
             "cushion":         1,
             "reservedTicks":   2,
             "crossMargin":     false
           }
        ]
     }
]
```
<a name="contract-order-closed"></a>
## Closed (filled) Orders
### GET /api/v1/contract/:symbol/order/closed
```http
GET /api/v1/contract/BTC1/order/closed HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1481651130426
```
### 200 OK
```json
[
  {
    "uuid": "6cc52580-bb0c-11e6-b831-df21626bb966",
    "userid": "mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
    "side": "buy",
    "quantity": 3,
    "filled": 3,
    "cancelled": 0,
    "price": 752.2,
    "averagePrice": 752.2,
    "entryTime": 1480957272024245,
    "eventTime": 1480965089774447,
    "status": "closed",
    "entryOrder": {},
    "orderType": "LMT",
    "stopPrice": 2.8,
    "targetPrice": "NONE",
    "clientid": "6badc210-bb0c-11e6-b1b0-31a3e9373a6c",
    "instrument": "BTC1",
    "commission": 10000,
    "reward": -2500,
    "cushion": 1,
    "reservedTicks": 2,
    "crossMargin": false
  },
  {
    "uuid": "32e0eaf0-baa5-11e6-bb13-65d0268ef8f6",
    "userid": "mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
    "side": "sell",
    "quantity": 21,
    "filled": 21,
    "cancelled": 0,
    "price": 751.4,
    "averagePrice": 750.86666667,
    "entryTime": 1480915775617929,
    "eventTime": 1480915778107792,
    "status": "closed",
    "entryOrder": {
      "1f0c2a80-baa5-11e6-9558-951ab84e8daa": 1
    },
    "orderType": "STP",
    "stopPrice": 6.6,
    "targetPrice": "NONE",
    "instrument": "BTC1",
    "oco": "32e11200-baa5-11e6-a434-3f7d9d3258be",
    "maxStop": 750.7,
    "triggered": true,
    "entryPrice": 758,
    "entryPrices": [
      758,
      758,
      758,
      758,
      758,
      758
    ],
    "entryAmounts": [
      15918,
      12886,
      9096,
      5306,
      4548,
      1516
    ],
    "entryAmount": 0,
    "commission": 10000,
    "reward": -2500,
    "cushion": 1,
    "reservedTicks": 2,
    "crossMargin": false
  }
]
```
<a name="contract-order-cancelled"></a>
## Cancelled orders (with no fills)
### GET /api/v1/contract/:symbol/order/cancelled
```http
GET /api/v1/contract/BTC1/order/cancelled HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1481653294715
```
### 200 OK
```json
[
  {
    "uuid": "8a1cbe40-bb0c-11e6-b56f-e850d46d696a",
    "userid": "mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
    "side": "sell",
    "quantity": 2,
    "filled": 0,
    "cancelled": 2,
    "price": 745,
    "averagePrice": 0,
    "entryTime": 1480957321252323,
    "eventTime": 1480957321696555,
    "status": "cancelled",
    "entryOrder": {},
    "orderType": "LMT",
    "stopPrice": 2.7,
    "targetPrice": "NONE",
    "clientid": "89064530-bb0c-11e6-b1b0-31a3e9373a6c",
    "instrument": "BTC1",
    "reason": "Cancelled self-matching order",
    "commission": 10000,
    "reward": -2500,
    "cushion": 1,
    "reservedTicks": 2,
    "crossMargin": false
  },
  {
    "uuid": "32e11200-baa5-11e6-a434-3f7d9d3258be",
    "userid": "mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
    "side": "sell",
    "quantity": 21,
    "filled": 0,
    "cancelled": 21,
    "price": "NONE",
    "averagePrice": 0,
    "entryTime": 1480912936736294,
    "eventTime": 1480915778195181,
    "status": "cancelled",
    "entryOrder": {
      "1f0c2a80-baa5-11e6-9558-951ab84e8daa": 1
    },
    "orderType": "TGT",
    "stopPrice": 6.6,
    "targetPrice": "NONE",
    "instrument": "BTC1",
    "oco": "32e0eaf0-baa5-11e6-bb13-65d0268ef8f6",
    "entryPrice": 758,
    "entryPrices": [
      758,
      758,
      758,
      758,
      758,
      758
    ],
    "entryAmounts": [
      15918,
      12886,
      9096,
      5306,
      4548,
      1516
    ],
    "entryAmount": 0,
    "commission": 10000,
    "reward": -2500,
    "cushion": 1,
    "reservedTicks": 2,
    "crossMargin": false
  }
]

```
<a name="contract-orderbook"></a>
## Order Book
### GET /api/v1/contract/:symbol/orderbook
```http
GET /api/v1/contract/BTC1/orderbook HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1480947259178
```
### 200 OK
```json
{
   "bid":748,
   "ask":749.1,
   "buy":[
      {
         "price":748,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":747.9,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      }
   ],
   "sell":[
      {
         "price":749.1,
         "numberOfOrders":2,
         "totalQuantity":6,
         "instrument":"BTC1"
      },
      {
         "price":749.2,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      }
   ]
}
```
<a name="contract-recent-trade"></a>
## Recent Trades
### GET /api/v1/contract/:symbol/trade
```http
GET /api/v1/contract/BTC1/trade HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1480947260712
```
### 200 OK
```json
[
   {
      "date":1480965360,
      "price":752.1,
      "volume":1
   },
   {
      "date":1480965089,
      "price":752.2,
      "volume":3
   },
   {
      "date":1480915778,
      "price":751.7,
      "volume":2
   },
   {
      "date":1480915777,
      "price":750.7,
      "volume":4
   },
   {
      "date":1480895098,
      "price":767.5,
      "volume":2
   },
   {
      "date":1480496266,
      "price":739.9,
      "volume":5
   }
]
```
<a name="account"></a>
## User account
### GET /api/v1/account
```http
GET /api/v1/account HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1480947266323
```
### 200 OK
```json
{
    "displayMargin":0,
    "positions":{},
    "userid":"mk1n8MGrgMEVRHuLarJ6W4MKuZG8CYfh8i",
    "margin":0,
    "orders":{
        "BTCUSD7J14":{},
        "BTCUSD7J21":{}
    },
    "accountMargin":0
}
```
<a name="account-execution"></a>
## User Executions
### GET /api/v1/account/execution
```http
GET /api/v1/account/execution HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1480957451447
```
### 200 OK
```json
[{
  "userid": "mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk",
  "executionid": "27a99cb0-f5bd-11e6-9bc0-ab69e5d88384",
  "side": "sell",
  "orderType": "MKT",
  "orderid": "278ec1b0-f5bd-11e6-a389-363d200d248d",
  "price": 1063.9,
  "quantity": 1,
  "liquidity": "commission",
  "commission": 23498,
  "eventTime": 1487410344443683,
  "instrument": "BTCUSD7G24",
  "entryAmount": -46952766,
  "pnl": -44132
}, {
  "userid": "mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk",
  "executionid": "1f0c9080-f5bd-11e6-8fe3-628ba4ed8f57",
  "side": "buy",
  "orderType": "MKT",
  "orderid": "1ef6e5a0-f5bd-11e6-8279-f198eadae07e",
  "price": 1064.9,
  "quantity": 1,
  "liquidity": "commission",
  "commission": 23476,
  "eventTime": 1487410329992901,
  "instrument": "BTCUSD7G24",
  "entryAmount": 0,
  "pnl": 0
}]
```

<a name="account-margin"></a>
## Margin account balance
### GET /api/v1/account/margin
```http
GET /api/v1/account/margin HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1480957451447
```
### 200 OK
```
{
   "value":67350920
}
```
<a name="account-margin-move"></a>
## Add Margin (Move from Multisig to Margin)
Move specified amount of BTC from multisig account to margin account. Use this to ensure you have sufficient coins in your margin account to cover your positions and orders.
### POST /api/v1/account/margin
```http
POST /api/v1/account/margin HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:cbe864dca0c4a39f4247d241840fa46cf2cbd948cdc46b51ac1ef0a6e249ce39
Nonce: 1487489261278
```
```json
[{"txs":["0100000002687c0cf9d5e0dec13dab256fad30672b34c65fdeddcf9662bec7a1d9274308fa01000000920000473044022031ecaf36aa52b438c9c335d066209408aa7cfbe82120746849fc9f4783f06f7a0220208bb556e0dfbd86818de3a5fb7acb7aba0efdd1dc11950bfbe28d32edc4c5690147522103133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda721038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df3752aeffffffffc2585bc27effc1cb58b957e4dc71681b6180a8457679533f0a3b0a21a09835bf010000009200004730440220277154208a1062408175682e8a640edbcb46ae0056b39aebda3e2ce00f05679202204e1b5b248f2b010c1ee72eb68ea811e1464f94a5bb07d328fa8ba6744422f23a0147522103133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda721038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df3752aeffffffff03b8ca0e00000000001976a914c2db9d057d9988d2a7ee8e4887f851fc874a647a88ac809698000000000017a91427649de18dc419c47efdbfde57e0d0d12215f53d87541eaa010000000017a91427649de18dc419c47efdbfde57e0d0d12215f53d8700000000"]}]
```
### 200 OK
```json
{"txids":["351f2dedb630ddd6b34182eb9ddd0a15df7b95165ca2148e95e4dbb63e19bcaf"]}
```
<a name="account-margin-clear"></a>
## Clear Margin (Move to Multisig)
Move specified amount of BTC from margin account to multisig account. Coins in multisig account are provably safe from a possible server breach.
### /api/v1/account/margin/:amount
```http
DELETE /api/v1/account/margin/10000000 HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:b7156a8863712494903e66170cba78a4ce9b7412b72b12c00903b4ba191cfa67
Nonce: 1487490137968
```
### 200 OK
```json
{"txids":["351f2dedb630ddd6b34182eb9ddd0a15df7b95165ca2148e95e4dbb63e19bcaf"]}
```
<a name="account-position"></a>
## User positions
### GET /api/v1/position
```http
GET /api/v1/account/position HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1480965622146
```
### 200 OK
```
{
   "BTC1":{
      "userid":"mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
      "instrument":"BTC1",
      "averagePrice":752.175,
      "quantity":4,
      "entryAmount":-3008.7,
      "commission":0
   }
}
```
<a name="account-pnl"></a>
## User P&L
### GET /api/v1/account/pnl
```http
GET /api/v1/account/pnl HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1480947263028
```
### 200 OK
```json
{
   "pnl":{
      "userid":"mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
      "accountid":"2N8cxuZkeqMjufhP21M1hZexaPT2F8DZ87r",
      "pnl":-18132500,
      "commission":242500
   }
}
```

<a name="account-withdrawtx"></a>
## Withdraw from Multisig
### POST /api/v1/account/tx/withdraw
```http
POST /api/v1/account/tx/withdraw HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization:HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:8da600485b53e5ce4dacc9e302c8950d09376a1bbf3f30bfef3f78fdd42b252e
Nonce: 1487489119205
```
```json
{"tx":"01000000013a0204fc74b9448b8138a0a4007c212dd9c94d3afefe6356a0a31f0173a3fe83030000009200004730440220626e7b4af2b692274d0f7710737e0283b7a0d8a45da232837feda72874e592cc02200b13651c9b631a12cfb9656d637af2e1f50ae6fe7fcb82a5d29f2ee413852f070147522103133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda721038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df3752aeffffffff0240420f000000000017a9146d8873aa9fd5426f4704906697f3591b27c7f46b879460b9010000000017a91427649de18dc419c47efdbfde57e0d0d12215f53d8700000000"}
```
### 200 OK
```json
{
  "txid": "bf3598a0210a3b0a3f53797645a880611b6871dce457b958cbc1ff7ec25b58c2"
}
```

<a name="account-recoverytx"></a>
## Recovery Transaction
### GET /api/v1/account/tx/recovery
```http
GET /api/v1/account/tx/recovery HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1480947265266
```
### 200 OK
```json
{
   "tx":"01000000018d348442ac8fa041d6bf9bf1f99f701e2d46f703d7f90f3bbc3fb6e1c39865c2020000009300483045022100ae2678cb72ae04da31dce7867f02da35a16a352f838857dfa96567ed457635f702203fa6c8d610ed3cdd31821b00145408ffceab7c6a127d69a45fac6a8d4a185d2c010047522102453b9f78cf1d254840c8a7b87a058a665db0c1c51cc3edd33ff0ef3be98fb6842102babd831e59837b55a1e37ee48bcc928516c72baabff06afdfb0ab963b826414652aeffffffff017a2de400000000001976a9146b3fdb05dcf753ccbb377371beeba58d6c263a1788ac00000000"
}
```
