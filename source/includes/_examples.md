# Examples
Examples are structured as follows:

|Section|Description|
|---|---|
|Title|What the /api endpoint stands for|
|URL template|Any colon prepended tokens are url parameters|
|HTTP Request|Abbreviated HTTP request|
|Server Response|Including expected HTTP error code|

<a name="all-info"></a>
## Exchange Basic Info
### GET /api/v1/all/info
```
GET /api/v1/all/info
Accept: application/json
```
### 200 OK
```json
{
   "BTC1":{
      "vol24H":{
         "qty":152,
         "btc":115.8483,
         "instrument":"BTC1"
      },
      "openInterest":{
         "qty":7,
         "btc":5.261,
         "instrument":"BTC1"
      },
      "lastPrice":751.7,
      "indexPrice":748.6
   }
}
```
<a name="all-band"></a>
## Anti-Manipulation bands
### GET /api/v1/all/band
```
GET /api/v1/all/band
Accept: application/json
```
### 200 OK
```json
{
  "BTCUSD7G24": {
    "price": 1057.1,
    "min": 1047.1,
    "max": 1067.1,
    "instrument": "BTCUSD7G24"
  },
  "BTC1": {
    "price": 1057.1,
    "min": 1055.1,
    "max": 1059.1,
    "instrument": "BTC1"
  },
  "BTCUSD7H03": {
    "price": 1057.1,
    "min": 1047.1,
    "max": 1067.1,
    "instrument": "BTCUSD7H03"
  },
  "MBTCUSD7G190245": {
    "price": 1057.1,
    "min": 1047.1,
    "max": 1067.1,
    "instrument": "MBTCUSD7G190245"
  },
  "MBTCUSD7G190250": {
    "price": 1057.1,
    "min": 1047.1,
    "max": 1067.1,
    "instrument": "MBTCUSD7G190250"
  }
}

```
<a name="all-spec"></a>
## Contract Specs
### GET /api/v1/all/spec
```
{
   "method":"GET",
   "uri":"/api/spec",
   "nonce":1480947264503
}
```
### 200 OK
```json
{
   "instruments":{
      "all":{
         "Trading Hours":"24x7x365",
         "Listed Contracts":"Continuous",
         "Settlement Method":"Financial",
         "Termination of trading":"None, Automatic rollover",
         "Settlement Procedure":"P&L Equivalent BTC credited/debited to account",
         "Position Limits":"None at present. May be instituted as needed",
         "Price Limit or circuit":"None at present. May be instituted as needed"
      },
      "BTC1":{
         "Contract Unit":"BTC/USD",
         "Minimum price fluctuation":"0.1 USD = 0.0001 BTC",
         "Quote currency":"USD",
         "Type":"Quanto",
         "Margin & PNL currency":"BTC",
         "BTC value of 1 contract":"Price &times; 0.001 BTC",
         "USD value of 1 contract":"Price² &times; 0.001 BTC",
         "BTC P&L of 1 contract":"(SellPrice - BuyPrice) &times; 0.001 BTC",
         "Approx Leverage":"Price &times; 0.001 BTC / Margin<br> Example: 422 &times; 0.001 / (0.0001 &times; 20) = 211 <br>approx. Price &times; 10/(stop_ticks+10)",
         "Spot Anchor Price":"Spot anchor price is median of OKCoin, BitFinex and Bitstamp BTC/USD real-time spot price"
      }
   },
   "parameter":{
      "BTC1":{
         "symbol":"BTC1",
         "commission":10000,
         "reward":-2500,
         "margin":2100000,
         "stopcushion":1,
         "stopprice":1,
         "targetprice":2,
         "crossMarginInitialStop":10,
         "ticksize":1,
         "ticksperpoint":10,
         "tickvalue":10000,
         "bandUpperLimit":2,
         "bandLowerLimit":2,
         "introducerReward":500,
         "introducedReward":1000,
         "rewardsCalculationInterval":1440,
         "minMarketStop":1.6,
         "minLimitStop":1.6,
         "uplDecimalPlaces":4
      }
   }
}
```

<a name="all-config"></a>
## Exchange/Contract Config
### GET /api/v1/all/config
```
GET /api/v1/all/config
Accept: application/json
```
### 200 OK
```json
{
   "instrument":{
      "BTC1":{
         "symbol":"BTC1",
         "commission":10000,
         "reward":-2500,
         "margin":2100000,
         "stopcushion":1,
         "stopprice":1,
         "targetprice":2,
         "crossMarginInitialStop":10,
         "ticksize":1,
         "ticksperpoint":10,
         "tickvalue":10000,
         "bandUpperLimit":2,
         "bandLowerLimit":2,
         "introducerReward":500,
         "introducedReward":1000,
         "rewardsCalculationInterval":1440,
         "minMarketStop":1.6,
         "minLimitStop":1.6,
         "uplDecimalPlaces":4
      }
   },
   "default":{
      "instrument":"BTC1"
   },
   "network":"testnet",
   "maxInputs":50,
   "sendFundsTXfee":50000,
   "sendFundsMaxTXfee":1000000,
   "recoveryFeePerKB":25000,
   "minimumFee":50000,
   "maximumFee":150000,
   "feePerKB":50000,
   "feeCheckInterval":3600000,
   "feeChangeTolerance":0.05,
   "marginFeeThreshold":0.9,
   "sliceSize":10000000,
   "bitcoinDust":5430,
   "sliceThreshold":10,
   "reservedTicks":2,
   "maxOrdersCreateUpdate":100,
   "maxPositionsMerge":40,
   "blockchainapi":{
      "provider":"insight",
      "uri":"https://insight.coinpit.me/insight-api",
      "socketuri":"https://insight.coinpit.me"
   },
   "links":{
      "blockcypher":"https://live.blockcypher.com/btc-testnet",
      "blockexplorer":"https://testnet.blockexplorer.com",
      "blocktrail":"https://www.blocktrail.com/tBTC"
   },
   "geofence":{
      "block":[
         "UM"
      ],
      "valid":[

      ]
   },
   "noSignup":false
}
```
<a name="contract-chart"></a>
## Chart for contract
### /api/v1/contract/:symbol/chart/:timeframe
```
  GET /api/v1/contract/BTC1/chart/5
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
```
GET /api/v1/contract/BTC1/order
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
```
GET /api/v1/contract/BTC1/order/open/503eb8a0-c7b3-11e6-a1d4-539d1cb6cbbc
Accept: application/json
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
```
POST /api/v1/contract/BTC1/order
Accept: application/json
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
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
      "postOnly":false,
      "instrument":"BTC1"
   }
]
```
### 200 OK
```json
[
   "order_add",
   {
      "result":[
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
      ],
      "methodName":"createOrders",
      "requestid":"7ad8b572-0b4b-4ea2-a2fb-261130ec5b13",
      "topic":"order_add"
   }
]
```
<a name="contract-update-order"></a>
## Update Orders
### PUT /api/v1/contract/:symbol/order/open
```
PUT /api/v1/contract/BTC1/order/open
Accept: application/json
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:26751dd64f75523257a3aeda5f2d59e68f4322500bcbc4beaa8ad27754ddd62b
```
```json
[
   "PUT /order",
   {
      "headers":{
         "requestid":"f91e424a-978f-4cd2-9f14-02e21d914908",
         "authorization":"HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:26751dd64f75523257a3aeda5f2d59e68f4322500bcbc4beaa8ad27754ddd62b"
      },
      "method":"PUT",
      "uri":"/order",
      "params":{
         "instrument":"BTC1"
      },
      "body":{
         "orders":[
            {
               "uuid":"503eb8a0-c7b3-11e6-a1d4-539d1cb6cbbc",
               "userid":"mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd",
               "price":814.8
            }
         ]
      },
      "nonce":1482348434637,
      "current":1482348433200
   }
]
```
### 200 OK
```json
[
   "order_update",
   {
      "result":[
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
      ],
      "methodName":"updateOrders",
      "requestid":"f91e424a-978f-4cd2-9f14-02e21d914908",
      "topic":"order_update"
   }
]
```
<a name="contract-cancel-order"></a>
## Cancel order by Id
### DELETE /api/v1/contract/:symbol/order/:uuid
```
DELETE /api/v1/contract/BTC1/order/adcb4c70-b72a-11e6-9b68-be1cfc0a27e0
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:fbe7496da2d6f82657d15ad2bf997ca778704f814d8e4601159f4a5519d885e4
Nonce: 1482347623909
```
### 200 OK
```json
[
   "DELETE /order",
   {
      "headers":{
         "requestid":"12ddc14b-4515-4361-846e-8bfbdd0c4951",
         "authorization":"HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:fbe7496da2d6f82657d15ad2bf997ca778704f814d8e4601159f4a5519d885e4"
      },
      "method":"DELETE",
      "uri":"/order",
      "params":{
         "instrument":"BTC1"
      },
      "body":[
         "adcb4c70-b72a-11e6-9b68-be1cfc0a27e0"
      ],
      "nonce":1482347623909,
      "current":1482347622820
   }
]
```
<a name="contract-cancel-all"></a>
## Cancel All Orders
### DELETE /api/v1/contract/:symbol/order
```
DELETE /api/v1/contract/BTC1/order
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:fbe7496da2d6f82657d15ad2bf997ca778704f814d8e4601159f4a5519d885e4
Nonce: 1482347623909
```
```json
[
   "DELETE /order",
   {
      "headers":{
         "requestid":"12ddc14b-4515-4361-846e-8bfbdd0c4951",
         "authorization":"HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:fbe7496da2d6f82657d15ad2bf997ca778704f814d8e4601159f4a5519d885e4"
      },
      "method":"DELETE",
      "uri":"/order",
      "params":{
         "instrument":"BTC1"
      },
      "body":[
         "adcb4c70-b72a-11e6-9b68-be1cfc0a27e0"
      ],
      "nonce":1482347623909,
      "current":1482347622820
   }
]
```
### 200 OK
```json
[
   "order_del",
   {
      "result":[
         "adcb4c70-b72a-11e6-9b68-be1cfc0a27e0"
      ],
      "methodName":"cancelOrder",
      "requestid":"12ddc14b-4515-4361-846e-8bfbdd0c4951",
      "topic":"order_del"
   }
]
```

<a name="contract-patch-order"></a>
## Combined create/update/cancel
### PATCH /contract/:symbol/order
```
PATCH /api/v1/contract/BTC1/order
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1482349148300
```
```json
[
   "PATCH /contract/BTC1/order",
   {
      "headers":{
         "requestid":"92569941-69d6-4c86-bafc-694558157a48",
         "authorization":"HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69"
      },
      "method":"PATCH",
      "uri":"/order",
      "params":{
         "instrument":"BTC1"
      },
      "body":[
         {
            "op":"remove",
            "path":"/19b3a371-c7b5-11e6-a305-6ee5416bea55"
         },
         {
            "op":"remove",
            "path":"/0d71f940-c7b5-11e6-9906-9cd1c95275e5"
         }
      ],
      "nonce":1482349148300,
      "current":1482349147200
   }
]
```
### 200 OK
```json
[
   "order_patch",
   {
      "result":[
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
         }
      ],
      "methodName":"patchOrders",
      "requestid":"92569941-69d6-4c86-bafc-694558157a48",
      "topic":"order_patch"
   }
]
```

<a name="contract-order-closed"></a>
## Closed (filled) Orders
### GET /api/v1/contract/:symbol/order/closed
```
GET /api/v1/contract/BTC1/order/closed
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
```
GET /api/v1/contract/BTC1/order/cancelled
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
```
GET /api/v1/contract/BTC1/orderbook
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
```
GET /api/v1/contract/BTC1/trade
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
```
GET /api/v1/account
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1480947266323
```
### 200 OK
```json
{
   "orders":[

   ],
   "positions":{

   },
   "pnl":{
      "userid":"mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
      "accountid":"2N8cxuZkeqMjufhP21M1hZexaPT2F8DZ87r",
      "pnl":-18132500,
      "commission":242500
   },
   "margin":67350920,
   "displayMargin":67350920
}
```
<a name="account-execution"></a>
## User Executions
### GET /api/v1/account/execution
```
GET /api/v1/account/execution
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1480957451447
```
### 200 OK
```json
[

]
```

<a name="account-margin"></a>
## Margin account balance
### GET /api/v1/account/margin
```
GET /api/v1/account/margin
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
### Request - TBD
### Response - TBD
<a name="account-margin-clear"></a>
## Clear Margin (Move to Multisig)
### Request - TBD
### Response - TBD
<a name="account-position"></a>
## User positions
### GET /api/v1/position
```
GET /api/v1/account/position
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
```
GET /api/v1/account/pnl
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
### POST /api/v1/account/withdrawtx
```
POST /api/withdrawtx
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1481654361400
```
### 200 OK
```json
{
  "txid": "67b69d42fd8f6c7e233513513642110e81a6fd4ae6f1b70f07f49d803cc2c274"
}
```

<a name="account-recoverytx"></a>
## Recovery Transaction
### GET /api/v1/account/recoverytx
```
GET /api/v1/account/recoverytx
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1480947265266
```
### 200 OK
```json
{
   "tx":"01000000018d348442ac8fa041d6bf9bf1f99f701e2d46f703d7f90f3bbc3fb6e1c39865c2020000009300483045022100ae2678cb72ae04da31dce7867f02da35a16a352f838857dfa96567ed457635f702203fa6c8d610ed3cdd31821b00145408ffceab7c6a127d69a45fac6a8d4a185d2c010047522102453b9f78cf1d254840c8a7b87a058a665db0c1c51cc3edd33ff0ef3be98fb6842102babd831e59837b55a1e37ee48bcc928516c72baabff06afdfb0ab963b826414652aeffffffff017a2de400000000001976a9146b3fdb05dcf753ccbb377371beeba58d6c263a1788ac00000000"
}
```
