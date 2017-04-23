# Socket API
The socket.io API can be used for high speed order management. Notifications of server-side events are also received through the socket interface. Socket API calls are also authenticated using the loginless zero-knowledge authentication system. The loginless socket API will transparently perform authenticated requests for you.

## Socket Request and Response
The Socket API uses the same request response format of the REST API but adds some additional envelope to pass headers. Since socket responses are asynchronous, supply a `requestid` field in the `headers` so you can co-relate the response.

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
```
loginless.socket.send({
  method: "POST",
  uri: "/order",
  headers: { requestid: '13ca323b-c2a7-4359-ab35-4a6a1f1de7ea' },
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
  }],
  params: { instrument: 'BTCUSD7J14' }
})
```

### Update Orders
```
  loginless.socket.send({
    method: "PUT",
    uri: "/order",
    headers: { requestid: '09ca323b-c2a7-4359-ab35-4a6a1f1de7ea' },
    body: [{
      "price": 1103,
      "clientid": "9fdda9ee-667a-4341-b317-072a923a753a",
    }],
    params: { instrument: BTCUSD7J14 }
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

```
loginless.socket.send({
  method: 'PATCH',
  uri: '/order',
  headers: { requestid: 'f4ca323b-c2a7-4359-ab35-4a6a1f1de7ea' },
  body: [{
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
    ],
    params: { instrument: BTCUSD7J14 }
})
```

### Merge multiple positions
```
loginless.socket.send({
  method: 'PATCH',
  uri: '/order',
  headers: { requestid: 'bcda323b-c2a7-4359-ab35-4a6a1f1de7ea' },
  body: [{
    op: "merge",
    from: ['0d71f940-c7b5-11e6-9906-9cd1c95275e5', 'cbf3a610-f6cd-11e6-bc1d-6c1a7dacf393']
  }],
  params: { instrument: BTCUSD7J14 }
})
```

### Split positions

```
loginless.socket.send({
  method: 'PATCH',
  uri: '/order',
  headers: { requestid: 'faaa323b-c2a7-4359-ab35-4a6a1f1de7ea' },
  body: [{
    op: "split",
    from: 'cbf3a610-f6cd-11e6-bc1d-6c1a7dacf393',
    quantity: 3
  }],
  params: { instrument: BTCUSD7J14 }
})
```

### Flatten Account (Close all positions and orders)
```
loginless.socket.send({
  method: "DELETE",
  uri: "/order",
  headers: { requestid: '09de23b-c2a7-4359-ab35-4a6a1f1de7ea' },
  body: [],
  params: { instrument: BTCUSD7J14 }
})
```

## Socket Events

### General Sitewide events
|Event|Meaning|
-----|-----
|advisory|General advisory regarding exchange
|config|Configuration has changed.
|readonly|Server is in read-only maintenance mode.
|server_time|Unix timestamp on server. Useful for adjusting clock skew if needed.
|upgrade|App has upgraded
|version|Version of the client code

### Instrument related events
|Event|Meaning|
-----|-----
|volume_24h|Volume over the last 24 hrs
|delivery_price|Estimated delivery price
|difforderbook|Quantity and size for changed prices only (real-time)
|orderbook|Entire orderbook (every minute)
|priceband|Trading Band where trades can take place
|instruments|Current tradable instruments
|open_interest|Open interest
|trade|Execution data when a trade occurs.

### Authentication and connection related events
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
|auth_error|You are using the wrong key or your clock is off
|account|Your account info with margin, P&L and orders
|affiliate|Affiliate info
|settlement|There has been an on-chain settlement

### Trading related events
|Event|Meaning|HTTP
-----|-----|----
|order_add|create order request|POST
|order_del|delete order request|DELETE
|order_del_all|Deleting all orders|DELETE
|order_update|Update order request|PUT
|order_patch|Multi-operation request|PATCH
|order_closed|Order was filled completely|
|order_cancelled|Order was cancelled|
|order_error|There was an error processing your order|
|order_execution|Order was filled partially or completely|

## Sitewide Events

      <!-- response: {
        requestid  : requestid
        error      : error,
      }

      response: {
        requestid : request.requestid,
        result    : result,
        userDetails: {}
        }
      }

      response: {
        userDetails: { pnl: { "BTCUSD7J14": 12}},
      }  -->
