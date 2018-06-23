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

<a name="instrument-order-id"></a>
## Specific order for a instrument
### GET /instrument/:symbol/order/:uuid
```http
GET /api/v1/instrument/LEVETH/order/d3b22f20-7688-11e8-a699-5e68bf92f205 HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: 'SIGN 0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167.0x5641C10fC028a5385dEC3A89f0a61f98DfBfCd30.28.0x37a8fbcf67406dbd68d825763727eebaf95aba915fcd0eb361f45163242c2b66.0x0f989ae4615b1ca4981fab0325b79ecb75aa943736af2ef279b4f0f3671ee837'
Nonce: 1529719510312
```
### 200 OK
```json
[
    {
    "uuid": "d3b22f20-7688-11e8-a699-5e68bf92f205",
    "accountId": "0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167",
    "side": "buy",
    "quantity": 1.0,
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
<a name="instrument-order-open"></a>
## Open Orders (including partially filled)
### GET /instrument/:symbol/order/open
```http
GET /api/v1/instrument/LEVETH/order/open HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: 'SIGN 0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167.0x5641C10fC028a5385dEC3A89f0a61f98DfBfCd30.28.0x37a8fbcf67406dbd68d825763727eebaf95aba915fcd0eb361f45163242c2b66.0x0f989ae4615b1ca4981fab0325b79ecb75aa943736af2ef279b4f0f3671ee837'
Nonce: 1529719510312
```
### 200 OK
```json
[
    {
    "uuid": "d3b22f20-7688-11e8-a699-5e68bf92f205",
    "accountId": "0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167",
    "side": "buy",
    "quantity": 0.5,
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
<a name="instrument-order-closed"></a>
## Closed Orders (including partially cancelled)
### GET /instrument/:symbol/order/closed?from=:uuid
```http
GET /api/v1/instrument/LEVETH/order/closed HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: 'SIGN 0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167.0x5641C10fC028a5385dEC3A89f0a61f98DfBfCd30.28.0x37a8fbcf67406dbd68d825763727eebaf95aba915fcd0eb361f45163242c2b66.0x0f989ae4615b1ca4981fab0325b79ecb75aa943736af2ef279b4f0f3671ee837'
Nonce: 1529719510312
```
### 200 OK
```json
[
    {
    "uuid": "d3b22f20-7688-11e8-a699-5e68bf92f205",
    "accountId": "0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167",
    "side": "buy",
    "quantity": 0.5,
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
<a name="instrument-order-cancelled"></a>
## Cancelled orders (with no fills)
### GET /instrument/:symbol/order/cancelled?from=:uuid
```http
GET /api/v1/instrument/LEVETH/order/cancelled HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: 'SIGN 0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167.0x5641C10fC028a5385dEC3A89f0a61f98DfBfCd30.28.0x37a8fbcf67406dbd68d825763727eebaf95aba915fcd0eb361f45163242c2b66.0x0f989ae4615b1ca4981fab0325b79ecb75aa943736af2ef279b4f0f3671ee837'
Nonce: 1529719510312
```
### 200 OK
```json
[
  {
    "uuid": "d3b22f20-7688-11e8-a699-5e68bf92f205",
    "accountId": "0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167",
    "side": "buy",
    "quantity": 0.5,
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

<a name="account"></a>
## User account
### GET /account
```http
GET /api/v1/account HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: 'SIGN 0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167.0x5641C10fC028a5385dEC3A89f0a61f98DfBfCd30.28.0x37a8fbcf67406dbd68d825763727eebaf95aba915fcd0eb361f45163242c2b66.0x0f989ae4615b1ca4981fab0325b79ecb75aa943736af2ef279b4f0f3671ee837'
Nonce: 1529719510312
```
### 200 OK
```
Coming soon!
```
<a name="account-execution"></a>
## User Executions
### GET /account/execution
```http
GET /api/v1/account/execution HTTP/1.1
Accept: application/json
Host: test.leverj.io
Authorization: 'SIGN 0x50F7a5CE920E2Ab517E6178CB1Edb90030f32167.0x5641C10fC028a5385dEC3A89f0a61f98DfBfCd30.28.0x37a8fbcf67406dbd68d825763727eebaf95aba915fcd0eb361f45163242c2b66.0x0f989ae4615b1ca4981fab0325b79ecb75aa943736af2ef279b4f0f3671ee837'
Nonce: 1529719510312
```
### 200 OK
```
Coming soon!
```