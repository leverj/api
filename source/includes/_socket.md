# Socket API
The socket.io API can be used for high speed order management. Notifications of server-side events are also received through the socket interface. Socket API calls are also authenticated using the loginless zero-knowledge authentication system. The loginless socket API will transparently perform authenticated requests for you.

## Socket Request and Response
The Socket API uses the same request response format of the REST API but adds some additional envelope to pass headers. Since socket responses are asynchronous, you may optionally supply a `requestid` field in the `headers` so you can co-relate the response.

### Request Serialization Format (create order sent on topic `POST /order`)
```json
{
  "headers": {
    "requestid": "13ca323b-c2a7-4359-ab35-4a6a1f1de7ea",
    "Authorization": "HMAC mjNCXZT2k8oYRRu4mrRwFfcFWZoF6J5hi2:41fbd3f4a0c28780e11232061c1ae872adbcf91c78961c2aee900c2a4c79309c",
    "Nonce": 1491177913277
  },
  "method": "POST",
  "uri": "/order",
  "params": {
    "instrument": "BTCUSD7J07"
  },
  "body": [{
    "userid": "mjNCXZT2k8oYRRu4mrRwFfcFWZoF6J5hi2",
    "side": "buy",
    "quantity": 1,
    "price": 1103,
    "orderType": "LMT",
    "clientid": "9fdda9ee-667a-4341-b317-072a923a753a",
    "stopPrice": 19.7,
    "crossMargin": false,
    "targetPrice": "NONE",
    "postOnly": false
  }]
}
```

### Response Serialization Format on event `order_add`
Responses also follow the REST format but have an additional envelope containing the `requestid` and socket `topic`

```json
{
  "result": [{
    "uuid": "35cab340-1801-11e7-a281-495834a76145",
    "userid": "mjNCXZT2k8oYRRu4mrRwFfcFWZoF6J5hi2",
    "side": "buy",
    "quantity": 1,
    "filled": 0,
    "cancelled": 0,
    "price": 1103,
    "normalizedPrice": 45330916,
    "averagePrice": 0,
    "entryTime": 1491177913461088,
    "eventTime": 1491177913461088,
    "status": "open",
    "entryOrder": {},
    "orderType": "LMT",
    "stopPrice": 19.7,
    "targetPrice": "NONE",
    "clientid": "9fdda9ee-667a-4341-b317-072a923a753a",
    "instrument": "BTCUSD7J07",
    "commission": 0.0005,
    "reward": 0,
    "cushion": 2,
    "reservedTicks": 2,
    "crossMargin": false,
    "marginPerQty": 918953
  }],
  "methodName": "createOrders",
  "requestid": "13ca323b-c2a7-4359-ab35-4a6a1f1de7ea",
  "topic": "order_add"
}
```

## Loginless socket

The node.js and python loginless APIs will enable you to send and receive messages over socket transparently adding the necessary `Authorization` and `Nonce` headers and passes the request on the topic `method + uri`.

### Registering to listen to events
To request notifications for server and user events, register socket with server.

```
loginless.socket.register()
```

### Stop listening to events
To stop listening to events for this user, for example to change user account, unregister from the server

```
loginless.socket.unregister()
// change account
```

## Socket Order Management
All REST order management can also be done over sockets. The `loginless.socket` library automatically adds `Authorization` and `Nonce` headers .

### Create New orders

```coffeescript
loginless.socket.send({
  method: "POST",
  uri: "/order",
  headers: { "requestid": "13ca323b-c2a7-4359-ab35-4a6a1f1de7ea" },
  body: [{
    "userid": "mjNCXZT2k8oYRRu4mrRwFfcFWZoF6J5hi2",
    "side": "buy",
    "quantity": 1,
    "price": 1103,
    "orderType": "LMT",
    "clientid": "9fdda9ee-667a-4341-b317-072a923a753a",
    "stopPrice": 19.7,
    "crossMargin": false,
    "targetPrice": "NONE",
    "postOnly": false
  }]
})
```

### Update Orders
```coffeescript
  loginless.socket.send({
    "method": "PUT",
    "uri": "/order",
    "headers": { "requestid": "09ca323b-c2a7-4359-ab35-4a6a1f1de7ea" },
    "body": [{
      "price": 1103,
      "clientid": "9fdda9ee-667a-4341-b317-072a923a753a",
    }]
})
```
### PATCH: Combined create/delete/update
The PATCH method uses the syntax for [RFC6902](https://tools.ietf.org/html/rfc6902). In addition to the standard ops, we have added `merge` and `split` for position management

|PATCH op|Order operation|
|---|---|
|add|Create new order|
|remove|Delete order|
|replace|Update order|
|split|Split position|
|merge|Merge positions

```coffeescript
loginless.socket.send({
  "method": "PATCH",
  "uri": "/order",
  "headers": { "requestid": "f4ca323b-c2a7-4359-ab35-4a6a1f1de7ea" },
  "body": [{
        "op":"remove",
        "path":"/0d71f940-c7b5-11e6-9906-9cd1c95275e5"
     },
     {
         "op":"replace",
         "value":[{
                 "uuid":"cbf3a610-f6cd-11e6-bc1d-6c1a7dacf393",
                 "price":1046.9
             }]
     },
      {
          "op":    "add",
          "value": [{
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
            }]
      }
    ]
})
```

### Merge multiple positions
```coffeescript
loginless.socket.send({
  "method": "PATCH",
  "uri": "/order",
  "headers": { "requestid": "bcda323b-c2a7-4359-ab35-4a6a1f1de7ea" },
  "body": [{
    "op": "merge",
    "from": ["0d71f940-c7b5-11e6-9906-9cd1c95275e5", "cbf3a610-f6cd-11e6-bc1d-6c1a7dacf393"]
  }]
})
```

### Split positions

```coffeescript
loginless.socket.send({
  "method": "PATCH",
  "uri": "/order",
  "headers": { "requestid": "faaa323b-c2a7-4359-ab35-4a6a1f1de7ea" },
  "body": [{
    "op": "split",
    "from": "cbf3a610-f6cd-11e6-bc1d-6c1a7dacf393",
    "quantity": 3
  }]
})
```

## Socket Events

### General Sitewide events
|Event|Meaning|
-----|-----
|[advisory](#event-advisory)|General advisory regarding exchange
|[config](#event-config)|Server Configuration has changed.
|[readonly](#event-readonly)|Server is in read-only maintenance mode.
|[server_time](#event-server_time)|Unix timestamp on server. Useful for adjusting clock skew if needed.
|[version](#event-version)|Version of the client code

### Instrument related events
|Event|Meaning|
-----|-----
|[delivery_price](#event-delivery_price)|Estimated delivery price
|[difforderbook](#event-difforderbook)|Quantity and size for changed prices only (real-time)
|[orderbook](#event-orderbook)|Entire orderbook (every minute)
|[priceband](#event-priceband)|Trading Band where trades can take place
|[instruments](#event-instruments)|Current tradable instruments
|[open_interest](#event-open_interest)|Open interest
|[trade](#event-trade)|Execution data when a trade occurs.
|[volume_24h](#event-volume_24h)|Volume over the last 24 hrs

### Socket.io connection related events

These events are standard [socket.io connection events](https://socket.io/docs/client-api/#event-connect_error).

|Event|Meaning|
-----|-----
|connect_error|There was an error trying to connect
|connect_timeout|Can't seem to reach server
|reconnect|Attempting reconnect (usually after laptop is reopened)
|reconnect_error|Failed to reconnect (bad wifi?)
|reconnect_failed|Failed to reconnect (bad wifi?)

### Account related events
|Event|Meaning|
-----|-----
|[auth_error](#event-auth_error)|You are using the wrong key or your clock is off
|[account](#event-account)|Your account info with margin, P&L and orders
|[affiliate](#event-affiliate)|Affiliate info
|[settlement](#event-settlement)|There has been an on-chain settlement

### Trading related events
|Event|Meaning|HTTP
-----|-----|----
|[order_add](#event-order_add)|create order request|POST
|[order_del](#event-order_del)|delete order request|DELETE
|[order_update](#event-order_update)|Update order request|PUT
|[order_patch](#event-order_patch)|Multi-operation request|PATCH
|[order_closed](#event-order_closed)|Order was filled completely|
|[order_error](#event-order_error)|There was an error processing your order|
|[order_execution](#event-order_execution)|Order was filled partially or completely|

## Sitewide Events

<a name="event-advisory"></a>
### advisory
```json
{
  "id": "advisoryid",
  "advice": "There will be a 24 hour settlement delay"
}
```
<a name="event-config"></a>
### config
Server config has changed. See [REST API](#all-config)

<a name="event-readonly"></a>
### readonly
```json
{
  "readonly": true
}
```
<a name="event-server_time"></a>
### server_time
```json
1492927290621
```
<a name="event-version"></a>
### version
```json
{
  "version": "23733f8923"
}
```

## Instrument Related events

<a name="event-delivery_price"></a>
### delivery_price
```json
{
  "BTCUSD7K05": 1237,
  "BTCUSD7J28": 1237
}
```

<a name="event-difforderbook"></a>
### difforderbook
```json
{
  "instrument": "BTCUSD7K05",
  "buy": {
    "1244.8": {
      "price": 1244.8,
      "numberOfOrders": 0,
      "totalQuantity": 0,
      "instrument": "BTCUSD7K05"
    },
    "1244.7": {
      "price": 1244.7,
      "numberOfOrders": 1,
      "totalQuantity": 20,
      "instrument": "BTCUSD7K05"
    }
  },
  "sell": {},
  "bid": 1245.2,
  "ask": 1246.4
}
```
<a name="event-orderbook"></a>
### orderbook
```json
{
  "BTCUSD7K05": {
    "bid": 1245.2,
    "ask": 1246.4,
    "buy": [{
      "price": 1245.2,
      "numberOfOrders": 1,
      "totalQuantity": 20,
      "instrument": "BTCUSD7K05"
    }, {
      "price": 1245.1,
      "numberOfOrders": 1,
      "totalQuantity": 20,
      "instrument": "BTCUSD7K05"
    }],
    "sell": [{
      "price": 1246.4,
      "numberOfOrders": 1,
      "totalQuantity": 20,
      "instrument": "BTCUSD7K05"
    }, {
      "price": 1246.5,
      "numberOfOrders": 1,
      "totalQuantity": 20,
      "instrument": "BTCUSD7K05"
    }]
  },
  "BTCUSD7J28": {
    "bid": 1240,
    "ask": 1241.2,
    "buy": [{
      "price": 1240,
      "numberOfOrders": 1,
      "totalQuantity": 20,
      "instrument": "BTCUSD7J28"
    }, {
      "price": 1239.9,
      "numberOfOrders": 1,
      "totalQuantity": 20,
      "instrument": "BTCUSD7J28"
    }],
    "sell": [{
      "price": 1241.2,
      "numberOfOrders": 1,
      "totalQuantity": 20,
      "instrument": "BTCUSD7J28"
    }, {
      "price": 1241.3,
      "numberOfOrders": 1,
      "totalQuantity": 20,
      "instrument": "BTCUSD7J28"
    }]
  }
}
```
<a name="event-priceband"></a>
### priceband
```json
{
  "BTCUSD7K05": {
    "price": 1236.5,
    "lastProvider": "gemini",
    "used": 5,
    "providers": {
      "gemini": {
        "price": 1236.51,
        "time": 1492925983543
      },
      "okcoin": {
        "price": 1229.89,
        "time": 1492925905600
      },
      "coinbase": {
        "price": 1241.5,
        "time": 1492925968688
      },
      "bitfinex": {
        "price": 1345,
        "time": 1492925956683
      },
      "bitstamp": {
        "price": 1223.8,
        "time": 1492925871058
      }
    },
    "max": 1248.9,
    "min": 1224.1,
    "instrument": "BTCUSD7K05"
  },
  "BTCUSD7J28": {
    "price": 1236.5,
    "lastProvider": "gemini",
    "used": 5,
    "providers": {
      "gemini": {
        "price": 1236.51,
        "time": 1492925983543
      },
      "okcoin": {
        "price": 1229.89,
        "time": 1492925905600
      },
      "coinbase": {
        "price": 1241.5,
        "time": 1492925968688
      },
      "bitfinex": {
        "price": 1345,
        "time": 1492925956683
      },
      "bitstamp": {
        "price": 1223.8,
        "time": 1492925871058
      }
    },
    "max": 1248.9,
    "min": 1224.1,
    "instrument": "BTCUSD7J28"
  }
}
```
<a name="event-instruments"></a>
### instruments
The available instrument list has changed. A new contract may have been added, an old one dropped or a futures contract has rolled over (expired and new one created)

```json
{
  "BTCUSD7K05": {
    "type": "inverse",
    "template": "BTCUSD",
    "commission": 0.0005,
    "reward": 0,
    "stopcushion": 2,
    "stopprice": 2,
    "targetprice": 3,
    "crossMarginInitialStop": 15,
    "ticksize": 1,
    "ticksperpoint": 10,
    "contractusdvalue": 100,
    "bandUpperLimit": 0.01,
    "bandLowerLimit": 0.01,
    "introducerReward": 0,
    "introducedReward": 0,
    "rewardsCalculationInterval": 14400,
    "minMarketStop": 1.6,
    "minLimitStop": 1.6,
    "uplDecimalPlaces": 8,
    "externalFeed": "coinpit-index#BTCUSD",
    "expiryClass": "weekly",
    "maxLeverage": 100,
    "symbol": "BTCUSD7K05",
    "start": 1492794900000,
    "expiry": 1494004500000,
    "next": "BTCUSD7K12",
    "status": "active"
  },
  "BTCUSD7J28": {
    "type": "inverse",
    "template": "BTCUSD",
    "commission": 0.0005,
    "reward": 0,
    "stopcushion": 2,
    "stopprice": 2,
    "targetprice": 3,
    "crossMarginInitialStop": 15,
    "ticksize": 1,
    "ticksperpoint": 10,
    "contractusdvalue": 100,
    "bandUpperLimit": 0.01,
    "bandLowerLimit": 0.01,
    "introducerReward": 0,
    "introducedReward": 0,
    "rewardsCalculationInterval": 14400,
    "minMarketStop": 1.6,
    "minLimitStop": 1.6,
    "uplDecimalPlaces": 8,
    "externalFeed": "coinpit-index#BTCUSD",
    "expiryClass": "weekly",
    "maxLeverage": 100,
    "symbol": "BTCUSD7J28",
    "start": 1492190100000,
    "expiry": 1493399700000,
    "next": "BTCUSD7K05",
    "status": "active"
  }
}
```

<a name="event-open_interest"></a>
### open_interest
```json
{
  "BTCUSD7J28": {
    "qty": 41,
    "btc": 3.29861387,
    "instrument": "BTCUSD7J28"
  }
}
```
<a name="event-trade"></a>
### trade

```json
{
  "date": 1492925983,
  "price": 1236.5,
  "volume": 0,
  "instrument": "BTCUSD7K05"
}
```
<a name="event-volume_24h"></a>
### volume_24h

```json
{
  "BTCUSD7K05": {
    "qty": 0,
    "btc": 0,
    "instrument": "BTCUSD7K05"
  },
  "BTCUSD7J28": {
    "qty": 0,
    "btc": 0,
    "instrument": "BTCUSD7J28"
  }
}
```

## Account related events

<a name="event-auth_error"></a>
### auth_error
```json
{
  "error": "Authentication error. Nonce stale"
}
```
<a name="event-account"></a>
### account
```json
{
  "account": {
    "orders": {
      "BTCUSD7K05": {},
      "BTCUSD7J28": {
        "c70af2e0-27ef-11e7-9105-85071ed4b987": {
          "uuid": "c70af2e0-27ef-11e7-9105-85071ed4b987",
          "userid": "mjNCXZT2k8oYRRu4mrRwFfcFWZoF6J5hi2",
          "side": "sell",
          "quantity": 1,
          "filled": 0,
          "cancelled": 0,
          "price": 1228.7,
          "normalizedPrice": 8138683,
          "averagePrice": 0,
          "entryTime": 1492929644814486,
          "eventTime": 1492929644814486,
          "status": "open",
          "entryOrder": {
            "c7024050-27ef-11e7-b103-690a3b9a9f71": 1
          },
          "orderType": "STP",
          "stopPrice": 15.4,
          "targetPrice": "NONE",
          "instrument": "BTCUSD7J28",
          "oco": "c70b19f0-27ef-11e7-a30f-c593750e3cb0",
          "maxStop": 1226.7,
          "entryPrice": 1243.2,
          "entryAmount": 8043758,
          "commission": 0.0005,
          "reward": 0,
          "cushion": 2,
          "reservedTicks": 2,
          "crossMargin": false,
          "normalizedEntryPrice": 8043758,
          "normalizedMaxStop": 8151952
        },
        "c70b19f0-27ef-11e7-a30f-c593750e3cb0": {
          "uuid": "c70b19f0-27ef-11e7-a30f-c593750e3cb0",
          "userid": "mjNCXZT2k8oYRRu4mrRwFfcFWZoF6J5hi2",
          "side": "sell",
          "quantity": 1,
          "filled": 0,
          "cancelled": 0,
          "price": "NONE",
          "normalizedPrice": "NONE",
          "averagePrice": 0,
          "entryTime": 1492929644815281,
          "eventTime": 1492929644815281,
          "status": "open",
          "entryOrder": {
            "c7024050-27ef-11e7-b103-690a3b9a9f71": 1
          },
          "orderType": "TGT",
          "stopPrice": 15.4,
          "targetPrice": "NONE",
          "instrument": "BTCUSD7J28",
          "oco": "c70af2e0-27ef-11e7-9105-85071ed4b987",
          "entryPrice": 1243.2,
          "entryAmount": 8043758,
          "commission": 0.0005,
          "reward": 0,
          "cushion": 2,
          "reservedTicks": 2,
          "crossMargin": false,
          "normalizedEntryPrice": 8043758
        }
      },
      "MBTCUSD7J230645": {},
      "MBTCUSD7J230650": {}
    },
    "positions": {
      "BTCUSD7J28": {
        "userid": "mjNCXZT2k8oYRRu4mrRwFfcFWZoF6J5hi2",
        "instrument": "BTCUSD7J28",
        "averagePrice": 1243.2,
        "quantity": 1,
        "entryAmount": -8043758,
        "commission": 0
      }
    },
    "pnl": {
      "userid": "mjNCXZT2k8oYRRu4mrRwFfcFWZoF6J5hi2",
      "accountid": "2MvZ31TkfyNhe26PdSxVaDHGQ73te9eNsfM",
      "pnl": -4022,
      "commission": 4022
    },
    "margin": 214668166,
    "displayMargin": 214668166,
    "accountMargin": 214784404,
    "userid": "mjNCXZT2k8oYRRu4mrRwFfcFWZoF6J5hi2"
  }
}
```
<a name="event-affiliate"></a>

### affiliate
Affiliate balance has changed. (Temporarily disabled)

<a name="event-settlement"></a>

### settlement

Indicates a settlement has occurred at this timestamp.

```json
1492929905529
```


## Trading related events

<a name="event-order_add"></a>
### order_add
```json
{
  "result": [{
    "uuid": "c9899630-27e9-11e7-899a-ef2b4de19b63",
    "userid": "mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk",
    "side": "buy",
    "quantity": 56,
    "filled": 0,
    "cancelled": 0,
    "price": 1226.4,
    "normalizedPrice": 8153947,
    "averagePrice": 0,
    "entryTime": 1492927072019986,
    "eventTime": 1492927072019986,
    "status": "open",
    "entryOrder": {},
    "orderType": "LMT",
    "stopPrice": 22.2,
    "targetPrice": "NONE",
    "clientid": "05f06edb-07ad-41b1-9b19-1bc94ee88d48",
    "instrument": "BTCUSD7J28",
    "commission": 0.0005,
    "reward": 0,
    "cushion": 2,
    "reservedTicks": 2,
    "crossMargin": false,
    "marginPerQty": 164137
  }],
  "requestid": "6ffa07e6-72bb-46a6-85f2-d5e2b33a19ea"
}
```
<a name="event-order_del"></a>
### order_del
```json
{
  "result": ["c9899630-27e9-11e7-899a-ef2b4de19b63"],
  "requestid": "3630eb81-f8cf-4cd2-aa30-1af1a35ceb23"
}
```
<a name="event-order_update"></a>
### order_update
```json
{
  "result": [{
    "uuid": "c9899630-27e9-11e7-899a-ef2b4de19b63",
    "userid": "mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk",
    "side": "buy",
    "quantity": 20,
    "filled": 0,
    "cancelled": 0,
    "price": 10000000,
    "normalizedPrice": 1000,
    "averagePrice": 0,
    "entryTime": 1492927971592021,
    "eventTime": 1492926742986517,
    "status": "open",
    "entryOrder": {
      "3630eb81-f8cf-4cd2-aa30-31f1a35ceb23": 10
    },
    "orderType": "STP",
    "stopPrice": 15,
    "targetPrice": 1.1,
    "instrument": "BTCUSD7K05",
    "oco": "0000eb81-f8cf-4cd2-aa30-1af1a35ceb23",
    "maxStop": 10000002,
    "entryPrice": 1247.9,
    "entryAmount": 160262840,
    "commission": 0.0005,
    "reward": 0,
    "cushion": 2,
    "reservedTicks": 2,
    "crossMargin": true,
    "normalizedEntryPrice": 8013463,
    "normalizedMaxStop": 1000
  }]
}
```
<a name="event-order_patch"></a>
### order_patch
```json
{
  "result": [{
    "op": "replace",
    "response": [{
      "uuid": "f55da690-27ec-11e7-9cdc-162c83ed5b42",
      "userid": "mzW114gYZGfa49BPm87hfB7zt1QdcRQeCw",
      "side": "buy",
      "quantity": 1,
      "filled": 0,
      "cancelled": 0,
      "price": 1246.7,
      "normalizedPrice": 8021176,
      "averagePrice": 0,
      "entryTime": 1492928605494265,
      "eventTime": 1492928434041100,
      "status": "open",
      "entryOrder": {
        "d3836451-2559-11e7-bb02-cd2d81d82f6b": 1
      },
      "orderType": "TGT",
      "stopPrice": 15,
      "targetPrice": 1.1,
      "instrument": "BTCUSD7J28",
      "oco": "f55d7f80-27ec-11e7-8044-39e1b67933d6",
      "entryPrice": 1247.8,
      "entryAmount": 8014105,
      "commission": 0.0005,
      "reward": 0,
      "cushion": 2,
      "reservedTicks": 2,
      "crossMargin": true,
      "normalizedEntryPrice": 8014105
    }],
    "statusCode": 200
  }],
  "requestid": "caa31739-6067-43f2-acef-411e187fcbe3"
}
```
<a name="event-order_error"></a>
### order_error
```json
{
  "error": {
    "message": "Orders must be a list"
  },
  "requestid": "9999b86e-7db0-4d54-b4b3-01c1c1c66305"
}
```
<a name="event-order_execution"></a>
### order_execution
```json
{
  "userid": "mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk",
  "executionid": "f5576502-27ec-11e7-89a2-61b4b036d3ce",
  "side": "buy",
  "orderType": "MKT",
  "orderid": "f5506020-27ec-11e7-b01a-831908d49bb9",
  "price": 1247.8,
  "quantity": 1,
  "liquidity": "commission",
  "commission": 4007,
  "eventTime": 1492928434001042,
  "instrument": "BTCUSD7J28",
  "entryAmount": 0,
  "pnl": 0
}
```
