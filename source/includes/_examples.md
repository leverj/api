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
### GET /all/info
```http
GET /api/v1/all/info HTTP/1.1
Accept: application/json
Host: test.leverj.io
```
### 200 OK
```
Coming soon!
```
<a name="all-spec"></a>
## Instrument Specs
### GET /all/spec
```http
GET /api/v1/all/spec HTTP/1.1
Accept: application/json
Host: test.leverj.io
```
### 200 OK
```json
{
    "instruments": [
        "FEEETH",
        "LEVETH"
    ],
    "parameter": {
        "LEVETH": {
            "symbol": "LEVETH",
            "address": "0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4",
            "name": "LEV/ETH",
            "decimals": 9,
            "reward": -2500,
            "commission": 10000,
            "instrument_status": "active",
            "ticksize": 6,
            "ticksperpoint": 1000000,
            "significantEtherDigits": 6,
            "significantTokenDigits": 1,
            "quoted_asset": "LEV",
            "quoted_asset_address": "0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4",
            "base_asset": "ETH",
            "base_asset_address": "0x0000000000000000000000000000000000000000"
        }
    }
}
```
<a name="all-config"></a>
## Exchange config (format subject to frequent change)
### GET /all/config
```http
GET /api/v1/all/config HTTP/1.1
Accept: application/json
Host: test.leverj.io
```
### 200 OK
```json
{
    "config": {
        "maxInputs": 50,
        "maxOrdersCreateUpdate": 100,
        "fee": {
            "maker": 1,
            "taker": 5,
            "factor": 10000,
            "weiPerFee": 1000000
        },
        "minimumNumberOfConfirmations": 12,
        "network": {
            "provider": "ropsten",
            "uri": "https://ropsten.infura.io",
            "etherscan": "https://ropsten.etherscan.io",
            "socket": "wss://ropsten.infura.io:443/ws",
            "id": 3,
            "registry": "0x835F739f3844590eec22ed1abBF768Bc69e529ce",
            "custodian": "0x31A5796d71c1f55cfed362faF1B60452bdbfc0Cc",
            "staking": "0xd36029d76af6fE4A356528e4Dc66B2C18123597D"
        },
        "geofence": {
            "block": [
                "US"
            ]
        },
        "noSignup": false
    },
    "instruments": {
        "LEVETH": {
            "symbol": "LEVETH",
            "address": "0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4",
            "name": "LEV/ETH",
            "decimals": 9,
            "reward": -2500,
            "commission": 10000,
            "instrument_status": "active",
            "ticksize": 6,
            "ticksperpoint": 1000000,
            "significantEtherDigits": 6,
            "significantTokenDigits": 1,
            "quoted_asset": "LEV",
            "quoted_asset_address": "0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4",
            "base_asset": "ETH",
            "base_asset_address": "0x0000000000000000000000000000000000000000"
        }
    },
    "assets": {
        "ETH": {
            "name": "ETHEREUM",
            "address": "0x0000000000000000000000000000000000000000",
            "symbol": "ETH",
            "decimals": 18,
            "asset_status": "active"
        },
        "LEV": {
            "name": "LEVERJ",
            "address": "0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4",
            "symbol": "LEV",
            "decimals": 9,
            "asset_status": "active"
        }
    }
}
```
<a name="instrument-recent-trade"></a>
## Recent trade data for an instrument (e.g. LEVETH)
### GET /instrument/:symbol/trade
```http
GET /api/v1/instrument/LEVETH/trade HTTP/1.1
Accept: application/json
Host: test.leverj.io
```
### 200 OK
```json
[
    {
        "date": 1529697648,
        "price": 0.000143,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697618,
        "price": 0.000143,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697593,
        "price": 0.000145,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697498,
        "price": 0.000138,
        "volume": 0.1,
        "instrument": "LEVETH"
    }
]
```

<a name="instrument-chart"></a>
## Chart for instrument
### GET /instrument/:symbol/chart/:timeframe
```http
GET /api/v1/instrument/LEVETH/chart/5 HTTP/1.1
Accept: application/json
Host: test.leverj.io
```
### 200 OK
```json
[
    {
        "v": 0.2,
        "s": 0.0000231,
        "t": 1529704500,
        "o": 0.000131,
        "h": 0.000131,
        "l": 0.0001,
        "c": 0.0001,
        "instrument": "LEVETH"
    },
    {
        "v": 0.7000000000000001,
        "s": 0.0000917,
        "t": 1529704200,
        "o": 0.000102,
        "h": 0.00015,
        "l": 0.000102,
        "c": 0.00012,
        "instrument": "LEVETH"
    },
    {
        "v": 0.4,
        "s": 0.000042600000000000005,
        "t": 1529703900,
        "o": 0.000108,
        "h": 0.00011,
        "l": 0.0001,
        "c": 0.00011,
        "instrument": "LEVETH"
    },
    {
        "v": 0.8,
        "s": 0.0001308,
        "t": 1529703600,
        "o": 0.000169,
        "h": 0.000169,
        "l": 0.000149,
        "c": 0.000149,
        "instrument": "LEVETH"
    }
]
```

<a name="instrument-orderbook"></a>
## Order book for the instrument
### GET /instrument/:symbol/orderbook
```http
GET /api/v1/instrument/LEVETH/orderbook HTTP/1.1
Accept: application/json
Host: test.leverj.io
```
### 200 OK
```json
{
    "bid": 0.000107,
    "ask": 0.000123,
    "buy": [
        {
            "price": 0.000107,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.0001,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000098,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000096,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        }
    ],
    "sell": [
        {
            "price": 0.000123,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000136,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000166,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000184,
            "numberOfOrders": 2,
            "totalQuantity": 0.2,
            "instrument": "LEVETH"
        }
    ]
}
```

<a name="open-order-all"></a>
## Get all open orders
### GET /order
```http
GET /api/v1/order HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1481655922696
```

### 200 OK
```json
[
  {
    "uuid": "d3b22f20-7688-11e8-a699-5e68bf92f205",
    "accountId": "0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167",
    "side": "buy",
    "quantity": 0.1,
    "filled": 0,
    "cancelled": 0,
    "price": 0.000098,
    "entryTime": 1529719067410372,
    "eventTime": 1529719067410372,
    "status": "open",
    "orderType": "LMT",
    "instrument": "LEVETH",
    "makerFee": 0,
    "takerFee": 0,
    "useFEE": false,
    "reward": -2500,
    "timestamp": 1529719067326,
    "signature": "0x1b8bba98827d23062ce4782f7329397bdeb31af14a42bbd3116a025f33a74b33089194df05a09e888344120fc489de0339260d1b51aa6e59ef076db8a73e067b00",
    "token": "0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4"
  },
  {
    "uuid": "c0299d70-7689-11e8-a99b-cd95ac56fa0c",
    "accountId": "0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167",
    "side": "buy",
    "quantity": 0.1,
    "filled": 0,
    "cancelled": 0,
    "price": 0.00001,
    "entryTime": 1529719464136165,
    "eventTime": 1529719464136165,
    "status": "open",
    "orderType": "LMT",
    "instrument": "LEVETH",
    "makerFee": 0,
    "takerFee": 0,
    "useFEE": false,
    "reward": -2500,
    "timestamp": 1529719464081,
    "signature": "0xe4c1cf216bed6e7a6021150ed313d4fde54177d3e07363d315592caef6470779732ef6e79edecfca55ea916313147ab95f1d3af7ebe967f1f989fc30d27b069900",
    "token": "0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4"
  }
]
```
<a name="open-order-id"></a>
## Get open order by id
### GET /order/:uuid
```http
GET /api/v1/order/d3b22f20-7688-11e8-a699-5e68bf92f205 HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1481655922696
```
### 200 OK
```json
[
    {
    "uuid": "d3b22f20-7688-11e8-a699-5e68bf92f205",
    "accountId": "0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167",
    "side": "buy",
    "quantity": 0.1,
    "filled": 0,
    "cancelled": 0,
    "price": 0.000098,
    "entryTime": 1529719067410372,
    "eventTime": 1529719067410372,
    "status": "open",
    "orderType": "LMT",
    "instrument": "LEVETH",
    "makerFee": 0,
    "takerFee": 0,
    "useFEE": false,
    "reward": -2500,
    "timestamp": 1529719067326,
    "signature": "0x1b8bba98827d23062ce4782f7329397bdeb31af14a42bbd3116a025f33a74b33089194df05a09e888344120fc489de0339260d1b51aa6e59ef076db8a73e067b00",
    "token": "0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4"
  }
]
```

<a name="open-create-order"></a>
## Create New Order
### POST /order
```http
POST /api/v1/order HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: 'SIGN 0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167.0x5641C10fC028a5385dEC3A89f0a61f98DfBfCd30.28.0x37a8fbcf67406dbd68d825763727eebaf95aba915fcd0eb361f45163242c2b66.0x0f989ae4615b1ca4981fab0325b79ecb75aa943736af2ef279b4f0f3671ee837'
Nonce: 1529719510312
```
```json
[
    {
        "orderType": "LMT",
        "price": 0.00001,
        "accountId": "0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167",
        "instrument": "LEVETH",
        "side":"buy",
        "quantity": 0.1
    }
]
```
### 200 OK
```json
[
  {
    "uuid": "dbb46570-7689-11e8-84d2-e6bad3a82d26",
    "accountId": "0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167",
    "side": "buy",
    "quantity": 0.1,
    "filled": 0,
    "cancelled": 0,
    "price": 0.00001,
    "entryTime": 1529719510343649,
    "eventTime": 1529719510343649,
    "status": "open",
    "orderType": "LMT",
    "instrument": "LEVETH",
    "makerFee": 0,
    "takerFee": 0,
    "useFEE": false,
    "reward": -2500,
    "timestamp": 1529719510312,
    "signature": "0xb229696627a3e82cd8d1ee79b173dc2084ccb6f358a7be385fa87197f9312bcd0fcc38d71d4fe4796fd7e56a21a5bc9284082c4ea1ddc107e77fba2a7845ba7000",
    "token": "0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4"
  }
]
```
<a name="open-update-order"></a>
## Update Orders
Only uuid and any fields that need to be changed should be sent. Only price can be updated at present. Non-changeable fields are ignored.
### PUT /order
```http
PUT /api/v1/order HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: 'SIGN 0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167.0x5641C10fC028a5385dEC3A89f0a61f98DfBfCd30.28.0x37a8fbcf67406dbd68d825763727eebaf95aba915fcd0eb361f45163242c2b66.0x0f989ae4615b1ca4981fab0325b79ecb75aa943736af2ef279b4f0f3671ee837'
Nonce: 1529719510312
```
```json
[
    {
       "uuid":"d3b22f20-7688-11e8-a699-5e68bf92f205",
       "price": 0.000088
    }
]
```
### 200 OK
```json
[
    {
    "uuid": "d3b22f20-7688-11e8-a699-5e68bf92f205",
    "accountId": "0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167",
    "side": "buy",
    "quantity": 0.1,
    "filled": 0,
    "cancelled": 0,
    "price": 0.000088,
    "entryTime": 1529719067410372,
    "eventTime": 1529719067410372,
    "status": "open",
    "orderType": "LMT",
    "instrument": "LEVETH",
    "makerFee": 0,
    "takerFee": 0,
    "useFEE": false,
    "reward": -2500,
    "timestamp": 1529719067326,
    "signature": "0x1b8bba98827d23062ce4782f7329397bdeb31af14a42bbd3116a025f33a74b33089194df05a09e888344120fc489de0339260d1b51aa6e59ef076db8a73e067b00",
    "token": "0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4"
  }
]
```
<a name="open-cancel-order"></a>
## Cancel Specified orders
Specify orders to be deleted by comma separated uuids. Any stop orders deleted will trigger and result in closing of position.
### DELETE /order/:uuids
```http
DELETE /api/v1/order/adcb4c70-b72a-11e6-9b68-be1cfc0a27e0,50192f40-c7b3-11e6-ba51-b8bd8cf25f84 HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: 'SIGN 0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167.0x5641C10fC028a5385dEC3A89f0a61f98DfBfCd30.28.0x37a8fbcf67406dbd68d825763727eebaf95aba915fcd0eb361f45163242c2b66.0x0f989ae4615b1ca4981fab0325b79ecb75aa943736af2ef279b4f0f3671ee837'
Nonce: 1529719510312
```
### 200 OK
```json
[
   "d3b22f20-7688-11e8-a699-5e68bf92f205",
   "c0299d70-7689-11e8-a99b-cd95ac56fa0c"
]
```

<a name="contract-order-id"></a>
## Specific order for a contract
### GET /contract/:symbol/order/:uuid
```http
GET /api/v1/contract/BTCUSDW/order/ec9a2f00-27de-11e7-a957-c11c2594f049 HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1481651130426
```
### 200 OK
```json
[
    {
        "marginPerQty":65905,
        "stopPrice":5,
        "eventTime":1492922406384773,
        "uuid":"ec9a2f00-27de-11e7-a957-c11c2594f049",
        "instrument":"BTCUSD7J28",
        "orderType":"LMT",
        "commission":0.0005,
        "entryOrder":{},
        "filled":0,
        "status":"open",
        "normalizedPrice":9670245,
        "price":1034.1,
        "entryTime":1492922406384773,
        "cushion":2,
        "crossMargin":false,
        "targetPrice":"NONE",
        "reservedTicks":2,
        "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
        "cancelled":0,
        "reward":0,
        "averagePrice":0,
        "side":"buy",
        "quantity":1
    }
]
```
<a name="contract-order-open"></a>
## Open Orders (including partially filled)
### GET /contract/:symbol/order/open
```http
GET /api/v1/contract/BTCUSDW/order/open HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1481651130426
```
### 200 OK
```json
[
    {
        "marginPerQty":65905,
        "stopPrice":5,
        "eventTime":1492922406384773,
        "uuid":"ec9a2f00-27de-11e7-a957-c11c2594f049",
        "instrument":"BTCUSD7J28",
        "orderType":"LMT",
        "commission":0.0005,
        "entryOrder":{},
        "filled":0,
        "status":"open",
        "normalizedPrice":9670245,
        "price":1034.1,
        "entryTime":1492922406384773,
        "cushion":2,
        "crossMargin":false,
        "targetPrice":"NONE",
        "reservedTicks":2,
        "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
        "cancelled":0,
        "reward":0,
        "averagePrice":0,
        "side":"buy",
        "quantity":1
    }
]
```
<a name="contract-order-closed"></a>
## Closed Orders (including partially cancelled)
### GET /contract/:symbol/order/closed?from=:uuid
```http
GET /api/v1/contract/BTCUSDW/order/closed HTTP/1.1
Accept: application/json
Host: test.leverj.io
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
    "instrument": "BTCUSDW",
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
### GET /contract/:symbol/order/cancelled?from=:uuid
```http
GET /api/v1/contract/BTCUSDW/order/cancelled HTTP/1.1
Accept: application/json
Host: test.leverj.io
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
    "instrument": "BTCUSDW",
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
    "instrument": "BTCUSDW",
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
### GET /contract/:symbol/orderbook
```http
GET /api/v1/contract/BTCUSDW/orderbook HTTP/1.1
Accept: application/json
Host: test.leverj.io
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
         "instrument":"BTCUSDW"
      },
      {
         "price":747.9,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTCUSDW"
      }
   ],
   "sell":[
      {
         "price":749.1,
         "numberOfOrders":2,
         "totalQuantity":6,
         "instrument":"BTCUSDW"
      },
      {
         "price":749.2,
         "numberOfOrders":1,
         "totalQuantity":5,
         "instrument":"BTCUSDW"
      }
   ]
}
```
<a name="contract-recent-trade"></a>
## Recent Trades
### GET /contract/:symbol/trade
```http
GET /api/v1/contract/BTCUSDW/trade HTTP/1.1
Accept: application/json
Host: test.leverj.io
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
### GET /account
```http
GET /api/v1/account HTTP/1.1
Accept: application/json
Host: test.leverj.io
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
### GET /account/execution
```http
GET /api/v1/account/execution HTTP/1.1
Accept: application/json
Host: test.leverj.io
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