# Examples
Examples are structured as follows:

|Section|Description|
|---|---|
|Title|What the /api endpoint stands for|
|URL template|Any colon prepended tokens are url parameters|
|HTTP Request|Abbreviated HTTP request|
|Server Response|Including expected HTTP error code|

<a name="auth"></a>
## Loginless Auth
### POST /api/v1/auth
```
GET api/v1/auth/038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df37
Accept: application/json
```
### 200 OK
```json
{
"serverPublicKey": "03133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda7",
"userid": "mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk"
}
```
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
GET /api/v1/all/spec
Accept: application/json
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
Accept: application/json
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
Accept: application/json
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
```
POST /api/v1/contract/BTC1/order
Accept: application/json
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
      "postOnly":false,
      "instrument":"BTC1"
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
```
PUT /api/v1/contract/BTC1/order/open
Accept: application/json
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:26751dd64f75523257a3aeda5f2d59e68f4322500bcbc4beaa8ad27754ddd62b
Nonce: 1482348434637
```
```json
[
    {
       "uuid":"503eb8a0-c7b3-11e6-a1d4-539d1cb6cbbc",
       "userid":"mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd",
       "price":814.8
    }
]
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
<a name="contract-cancel-order"></a>
## Cancel order by Id
### DELETE /api/v1/contract/:symbol/order/:uuid
```
DELETE /api/v1/contract/BTC1/order/adcb4c70-b72a-11e6-9b68-be1cfc0a27e0
Accept: application/json
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
```
DELETE /api/v1/contract/BTC1/order
Accept: application/json
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
### PATCH /contract/:symbol/order
```
PATCH /api/v1/contract/BTC1/order
Accept: application/json
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1482349148300
```
```json
[
   {
      "op":"remove",
      "path":"/19b3a371-c7b5-11e6-a305-6ee5416bea55"
   },
   {
      "op":"remove",
      "path":"/0d71f940-c7b5-11e6-9906-9cd1c95275e5"
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
   }
]
```

<a name="contract-order-closed"></a>
## Closed (filled) Orders
### GET /api/v1/contract/:symbol/order/closed
```
GET /api/v1/contract/BTC1/order/closed
Accept: application/json
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
Accept: application/json
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
```
GET /api/v1/contract/BTC1/orderbook
Accept: application/json
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
Accept: application/json
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
Accept: application/json
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
Accept: application/json
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
```
GET /api/v1/account/margin
Accept: application/json
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
Note this will change to return just txid
### POST /api/v1/account/margin
```
POST /api/v1/account/margin
Accept: application/json
Authorization: HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:cbe864dca0c4a39f4247d241840fa46cf2cbd948cdc46b51ac1ef0a6e249ce39
Nonce: 1487489261278
```
```json
[{"txs":["0100000002687c0cf9d5e0dec13dab256fad30672b34c65fdeddcf9662bec7a1d9274308fa01000000920000473044022031ecaf36aa52b438c9c335d066209408aa7cfbe82120746849fc9f4783f06f7a0220208bb556e0dfbd86818de3a5fb7acb7aba0efdd1dc11950bfbe28d32edc4c5690147522103133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda721038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df3752aeffffffffc2585bc27effc1cb58b957e4dc71681b6180a8457679533f0a3b0a21a09835bf010000009200004730440220277154208a1062408175682e8a640edbcb46ae0056b39aebda3e2ce00f05679202204e1b5b248f2b010c1ee72eb68ea811e1464f94a5bb07d328fa8ba6744422f23a0147522103133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda721038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df3752aeffffffff03b8ca0e00000000001976a914c2db9d057d9988d2a7ee8e4887f851fc874a647a88ac809698000000000017a91427649de18dc419c47efdbfde57e0d0d12215f53d87541eaa010000000017a91427649de18dc419c47efdbfde57e0d0d12215f53d8700000000"]}]
```
### 200 OK
```json
{"signedTxs":["0100000002687c0cf9d5e0dec13dab256fad30672b34c65fdeddcf9662bec7a1d9274308fa01000000da00483045022100fa9be09ce1ed0bd5186c653df8b98af4ee20aa9583b7b36d85959271f87556e0022007cf59f239def0dc9e5513c2afe66a0f1cb5c499243bd6302acbfe3cb66cb6a701473044022031ecaf36aa52b438c9c335d066209408aa7cfbe82120746849fc9f4783f06f7a0220208bb556e0dfbd86818de3a5fb7acb7aba0efdd1dc11950bfbe28d32edc4c5690147522103133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda721038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df3752aeffffffffc2585bc27effc1cb58b957e4dc71681b6180a8457679533f0a3b0a21a09835bf01000000da00483045022100bf1b8c32d8e97f5101aa7c7477f10a81ca82f123e72522e852045d2e6442165d02202d00dd9c524c1cd3c3adae34b06f10a7da89a6a83fafad42e0e0edf8cf3b35c9014730440220277154208a1062408175682e8a640edbcb46ae0056b39aebda3e2ce00f05679202204e1b5b248f2b010c1ee72eb68ea811e1464f94a5bb07d328fa8ba6744422f23a0147522103133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda721038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df3752aeffffffff03b8ca0e00000000001976a914c2db9d057d9988d2a7ee8e4887f851fc874a647a88ac809698000000000017a91427649de18dc419c47efdbfde57e0d0d12215f53d87541eaa010000000017a91427649de18dc419c47efdbfde57e0d0d12215f53d8700000000"]}
```
<a name="account-margin-clear"></a>
## Clear Margin (Move to Multisig)
Note: This returns server signed bitcoin transactions. This will change to return just the txid
### /api/v1/account/margin/:amount
```
DELETE /api/v1/account/margin/10000000
Accept: application/json
Authorization: HMAC mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk:b7156a8863712494903e66170cba78a4ce9b7412b72b12c00903b4ba191cfa67
Nonce: 1487490137968
```
### 200 OK
```json
{"signedTxs":["010000000268fbf38cb0053da4f467c8f0ba8a344899b6117cf7476f6fb87909125a64075f020000006a4730440220762e217bc2db9ee00e7000d33e782659e41e23c10720fe2efb4ab89e3f4ac4ba022029a708e7be6179a766b6b05fb511a3dfd6dbdfe406a279a09a6dc1f1caa6d94d012103133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda7ffffffff13911223f5a8e66804ea30b563536334af26be167da226f34ecdc7174b37e7ef010000006b483045022100cbc696eea90853fcda9aa1100786bd2c077c9247e9286a7dedbbeb2f9227f7ea02200db3cd10012e2ae305046e1877ee400c1d18dce73ab4599bc835547d77e2c22e012103133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda7ffffffff02104d98000000000017a91427649de18dc419c47efdbfde57e0d0d12215f53d87b546b000000000001976a914c2db9d057d9988d2a7ee8e4887f851fc874a647a88ac00000000"]}
```
<a name="account-position"></a>
## User positions
### GET /api/v1/position
```
GET /api/v1/account/position
Accept: application/json
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
Accept: application/json
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
Accept: application/json
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
### GET /api/v1/account/recoverytx
```
GET /api/v1/account/recoverytx
Accept: application/json
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1480947265266
```
### 200 OK
```json
{
   "tx":"01000000018d348442ac8fa041d6bf9bf1f99f701e2d46f703d7f90f3bbc3fb6e1c39865c2020000009300483045022100ae2678cb72ae04da31dce7867f02da35a16a352f838857dfa96567ed457635f702203fa6c8d610ed3cdd31821b00145408ffceab7c6a127d69a45fac6a8d4a185d2c010047522102453b9f78cf1d254840c8a7b87a058a665db0c1c51cc3edd33ff0ef3be98fb6842102babd831e59837b55a1e37ee48bcc928516c72baabff06afdfb0ab963b826414652aeffffffff017a2de400000000001976a9146b3fdb05dcf753ccbb377371beeba58d6c263a1788ac00000000"
}
```
