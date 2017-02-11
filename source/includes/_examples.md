# Examples
# Unprotected /api/v1/all

## GET /config
### Request
```JSON
{
   "method":"GET",
   "uri":"/api/config",
   "nonce":1480947267895
}
```
### Response
```JSON
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
## GET /info
### Request
```JSON
{
   "method":"GET",
   "uri":"/api/info",
   "nonce":1480947267135
}
```
### Response
```JSON
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



## GET /api/v1/contract/BTC1/chart
### Request
```JSON
{
  "method": "GET",
  "uri": "/api/chart/5?instrument=BTC1",
  "nonce": 1481655922696
}
```
### Response
```JSON
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

## PATCH /order
### Request
```JSON
[
   "PATCH /order",
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
### Response
```JSON
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
<a name="updateorder"></a>
## PUT /order
### Request
```JSON
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
### Response
```JSON
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
<a name="deleteorder"></a>
## DELETE /order
### Request
```JSON
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
### Response
```JSON
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
<a name="createorder"></a>
## POST /order
### Request
```JSON
[
   "POST /order",
   {
      "headers":{
         "requestid":"7ad8b572-0b4b-4ea2-a2fb-261130ec5b13",
         "authorization":"HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84"
      },
      "method":"POST",
      "uri":"/order",
      "params":{
         "instrument":"BTC1"
      },
      "body":[
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
      ],
      "nonce":1482171221212,
      "current":1482171219873
   }
]
```
### Response
```JSON
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

<a name="cancelledorder"></a>
## GET /cancelledorder
### Request
```JSON
{
  "method": "GET",
  "uri": "/api/cancelledorder?instrument=BTC1",
  "nonce": 1481653294715
}
```
### Response
```JSON
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
  },
  {
    "uuid": "80014020-baa3-11e6-b423-f75f085cca6a",
    "userid": "mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
    "side": "sell",
    "quantity": 1,
    "filled": 0,
    "cancelled": 1,
    "price": 770,
    "averagePrice": 0,
    "entryTime": 1480912302259708,
    "eventTime": 1480912641177914,
    "status": "cancelled",
    "entryOrder": {
      "7fd3c780-baa3-11e6-a50e-8b6fc221fc51": 1
    },
    "orderType": "TGT",
    "stopPrice": 6.6,
    "targetPrice": "NONE",
    "instrument": "BTC1",
    "oco": "80011910-baa3-11e6-8907-736af9d94f2e",
    "entryPrice": 759.5,
    "entryPrices": [
      759.5
    ],
    "entryAmounts": [
      759.5
    ],
    "entryAmount": 0,
    "commission": 10000,
    "reward": -2500,
    "cushion": 1,
    "reservedTicks": 2,
    "crossMargin": false
  },
  {
    "uuid": "62cbd561-baa3-11e6-8a90-403146e9015d",
    "userid": "mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
    "side": "buy",
    "quantity": 1,
    "filled": 0,
    "cancelled": 1,
    "price": "NONE",
    "averagePrice": 0,
    "entryTime": 1480912158135052,
    "eventTime": 1480912203072774,
    "status": "cancelled",
    "entryOrder": {
      "629fbc50-baa3-11e6-a9f5-5138da94a0f7": 1
    },
    "orderType": "TGT",
    "stopPrice": 6.6,
    "targetPrice": "NONE",
    "instrument": "BTC1",
    "oco": "62cbd560-baa3-11e6-a645-0efbbd423d0b",
    "entryPrice": 758.4,
    "entryPrices": [
      758.4
    ],
    "entryAmounts": [
      758.4
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
<a name="closedorder"></a>
## GET /closedorder
### Request
```JSON
{
  "method": "GET",
  "uri": "/api/closedorder?instrument=BTC1",
  "nonce": 1481651130426
}
```
### Response
```JSON
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
    "uuid": "7cf5d9a0-bb0b-11e6-ad8c-feca0c133dfb",
    "userid": "mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
    "side": "buy",
    "quantity": 1,
    "filled": 1,
    "cancelled": 0,
    "price": 752.1,
    "averagePrice": 752.1,
    "entryTime": 1480956869690928,
    "eventTime": 1480965360353987,
    "status": "closed",
    "entryOrder": {},
    "orderType": "LMT",
    "stopPrice": 2.8,
    "targetPrice": "NONE",
    "clientid": "7bdfd5c0-bb0b-11e6-91e6-571f03ad5182",
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
  },
  {
    "uuid": "1f0c2a80-baa5-11e6-9558-951ab84e8daa",
    "userid": "mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
    "side": "buy",
    "quantity": 50,
    "filled": 21,
    "cancelled": 29,
    "price": 758,
    "averagePrice": 758,
    "entryTime": 1480912903465034,
    "eventTime": 1480912939570371,
    "status": "closed",
    "entryOrder": {},
    "orderType": "LMT",
    "stopPrice": 6.6,
    "targetPrice": "NONE",
    "clientid": "1e1b3ad0-baa5-11e6-85b2-d75a18795b36",
    "instrument": "BTC1",
    "commission": 10000,
    "reward": -2500,
    "cushion": 1,
    "reservedTicks": 2,
    "crossMargin": false
  },
  {
    "uuid": "80011910-baa3-11e6-8907-736af9d94f2e",
    "userid": "mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
    "side": "sell",
    "quantity": 1,
    "filled": 1,
    "cancelled": 0,
    "price": 752.9,
    "averagePrice": 758.1,
    "entryTime": 1480912207138010,
    "eventTime": 1480912641075168,
    "status": "closed",
    "entryOrder": {
      "7fd3c780-baa3-11e6-a50e-8b6fc221fc51": 1
    },
    "orderType": "STP",
    "stopPrice": 6.6,
    "targetPrice": "NONE",
    "instrument": "BTC1",
    "oco": "80014020-baa3-11e6-b423-f75f085cca6a",
    "maxStop": 752.1,
    "flatten": true,
    "entryPrice": 759.5,
    "entryPrices": [
      759.5
    ],
    "entryAmounts": [
      759.5
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
<a name="trade"></a>
## GET /trade
### Request
```JSON
{
   "method":"GET",
   "uri":"/api/trade?instrument=BTC1",
   "nonce":1480947260712
}
```
### Response
```JSON
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
<a name="recoverytx"></a>
## GET /recoverytx
### Request
```JSON
{
   "method":"GET",
   "uri":"/api/recoverytx",
   "nonce":1480947265266
}
```
### Response
```JSON
{
   "tx":"01000000018d348442ac8fa041d6bf9bf1f99f701e2d46f703d7f90f3bbc3fb6e1c39865c2020000009300483045022100ae2678cb72ae04da31dce7867f02da35a16a352f838857dfa96567ed457635f702203fa6c8d610ed3cdd31821b00145408ffceab7c6a127d69a45fac6a8d4a185d2c010047522102453b9f78cf1d254840c8a7b87a058a665db0c1c51cc3edd33ff0ef3be98fb6842102babd831e59837b55a1e37ee48bcc928516c72baabff06afdfb0ab963b826414652aeffffffff017a2de400000000001976a9146b3fdb05dcf753ccbb377371beeba58d6c263a1788ac00000000"
}
```
<a name="pnl"></a>
## GET /pnl
### Request
```JSON
{
   "method":"GET",
   "uri":"/api/pnl",
   "nonce":1480947263028
}
```
### Response
```JSON
{
   "pnl":{
      "userid":"mqJ36LnDCjRavP1wwsieBTxHAb9R5grwsy",
      "accountid":"2N8cxuZkeqMjufhP21M1hZexaPT2F8DZ87r",
      "pnl":-18132500,
      "commission":242500
   }
}
```
<a name="userdetails"></a>
## GET /userdetails
### Request
```JSON
{
   "method":"GET",
   "uri":"/api/userdetails",
   "nonce":1480947266323
}
```
### Response
```JSON
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
<a name="spec"></a>
## GET /spec
### Request
```JSON
{
   "method":"GET",
   "uri":"/api/spec",
   "nonce":1480947264503
}
```
### Response
```JSON
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
<a name="position"></a>
## GET /position
### Request
```JSON{
   "method":"GET",
   "uri":"/api/position",
   "nonce":1480965622146
}
```
### Response
```JSON
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
<a name="margin"></a>
## GET /margin
### Request
```JSON
{
   "method":"GET",
   "uri":"/api/margin",
   "nonce":1480947261484
}
```
### Response
```JSON
{
   "value":67350920
}
```
<a name="order"></a>
## GET /order
### Request
```JSON
{
   "method":"GET",
   "uri":"/api/order?instrument=BTC1",
   "nonce":1480957451447
}
```

### Response:
```JSON
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
<a name="orderbook"></a>
## GET /orderbook
### Request
```JSON
{
   "method":"GET",
   "uri":"/api/orderbook?instrument=BTC1",
   "nonce":1480947259178
}
```
### Response
```JSON
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
      },
      {
         "price":747.8,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":747.7,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":747.6,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":747.5,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":747.4,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":747.3,
         "numberOfOrders":1,
         "totalQuantity":2,
         "instrument":"BTC1"
      },
      {
         "price":747.2,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":747.1,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":747,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":746.9,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":746.8,
         "numberOfOrders":1,
         "totalQuantity":4,
         "instrument":"BTC1"
      },
      {
         "price":746.7,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":746.6,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":746.5,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":746.4,
         "numberOfOrders":1,
         "totalQuantity":3,
         "instrument":"BTC1"
      },
      {
         "price":746.3,
         "numberOfOrders":1,
         "totalQuantity":3,
         "instrument":"BTC1"
      },
      {
         "price":746.2,
         "numberOfOrders":1,
         "totalQuantity":4,
         "instrument":"BTC1"
      },
      {
         "price":746.1,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":741,
         "numberOfOrders":1,
         "totalQuantity":10,
         "instrument":"BTC1"
      },
      {
         "price":739.9,
         "numberOfOrders":1,
         "totalQuantity":10,
         "instrument":"BTC1"
      },
      {
         "price":580.6,
         "numberOfOrders":1,
         "totalQuantity":1,
         "instrument":"BTC1"
      },
      {
         "price":"NONE",
         "numberOfOrders":1,
         "totalQuantity":7,
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
      },
      {
         "price":749.3,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":749.4,
         "numberOfOrders":1,
         "totalQuantity":3,
         "instrument":"BTC1"
      },
      {
         "price":749.5,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":749.6,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":749.7,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":749.8,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":749.9,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":750,
         "numberOfOrders":1,
         "totalQuantity":1,
         "instrument":"BTC1"
      },
      {
         "price":750.1,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":750.2,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":750.3,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":750.4,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":750.5,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":750.6,
         "numberOfOrders":1,
         "totalQuantity":4,
         "instrument":"BTC1"
      },
      {
         "price":750.7,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":750.8,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":750.9,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":751,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":751.1,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTC1"
      },
      {
         "price":"NONE",
         "numberOfOrders":1,
         "totalQuantity":1,
         "instrument":"BTC1"
      }
   ]
}
```
<a name="withdrawtx"></a>
## POST /withdrawtx
### Request
```JSON
{
  "method": "POST",
  "uri": "/api/withdrawtx",
  "nonce": 1481654361400
}
```
### Response
```JSON
{
  "txid": "67b69d42fd8f6c7e233513513642110e81a6fd4ae6f1b70f07f49d803cc2c274"
}
````