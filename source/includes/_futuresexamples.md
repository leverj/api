# Examples (Futures)
Examples are structured as follows:

| Section         | Description                                                              |
| --------------- | ------------------------------------------------------------------------ |
| Endpoint        | The /api endpoint                                                        |
| Client Request  | Request using the zka client                                             |
| Server Response | JSON Response payload (abbreviated to partial data sets for readability) |

<a name="futures-all-info"></a>
## Exchange Basic Info
### GET /all/info
```shell
curl https://live.leverj.io/futures/api/v1/all/info
```

```python
response = requests.get('https://live.leverj.io/futures/api/v1/all/info')
response.json()
```

```javascript
zka.rest.get('/all/info').then(function(result) {console.log(result)})
```
### Response
Returns information on 
  
* last 24 hours volume, 
* last price, 
* bid, 
* ask,
* funding rate, and
* index

for each of the perpetual swap instruments.

BTCUSD perpetual swap has id 1 and ETHUSD perpetual swap has id 2.

```json
{
    "1": {
        "vol24H": {
            "qty": 0,
            "eth": 0,
            "priceChange": 0,
            "priceChangePercent": 0,
            "instrument": "1"
        },
        "lastPrice": 15072,
        "bid": 15532,
        "ask": 15688,
        "fundingRate": {
            "rate": "2098600000000000000",
            "start": 1605142800000,
            "end": 1605146400000,
            "instrument": "1",
            "indexPrice": 15596,
            "futurePrice": 15619
        },
        "index": {
            "date": 1605143249,
            "price": 15585,
            "topic": "index_BTCUSD"
        }
    },
    "2": {
        "vol24H": {
            "qty": 1.3,
            "eth": 596.4,
            "priceChange": -2.7,
            "priceChangePercent": -0.5869565217391,
            "instrument": "2"
        },
        "lastPrice": 457.3,
        "bid": 455.1,
        "ask": 459.7,
        "fundingRate": {
            "rate": "22000000000000000",
            "start": 1605142800000,
            "end": 1605146400000,
            "instrument": "2",
            "indexPrice": 457.8,
            "futurePrice": 458.4
        },
        "index": {
            "date": 1605143249,
            "price": 457.52,
            "topic": "index_ETHUSD"
        }
    }
}
```

<a name="futures-all-config"></a>
## Exchange config (format subject to frequent change)
### GET /all/config
```shell
curl https://live.leverj.io/futures/api/v1/all/config
```

```python
response = requests.get('https://live.leverj.io/futures/api/v1/all/config')
response.json()
```

```javascript
zka.rest.get('/all/config').then(function(result) {console.log(result)})
```
### Response
Returns configuration information about 
  
* fee, 
* smart contracts, 
* instruments, and 
* assets

### Response

```json
{
    "config": {
        "maxInputs": 50,
        "maxOrdersCreateUpdate": 20,
        "fee": {
            "default": {
                "maker": 0,
                "taker": 5
            },
            "factor": 10000
        },
        "estimatedTokenTransferFee": "100000",
        "network": {
            "provider": "mainnet",
            "etherscan": "https://etherscan.io",
            "id": 1,
            "appId": 3,
            "gluon": "0x75ACe7a086eA0FB1a79e43Cc6331Ad053d8C67cB",
            "legacyTokensExtension": "0xDA88EfA53c85Afa30564bb651A2E76b99a232082",
            "lev": "0x0F4CA92660Efad97a9a70CB0fe969c755439772C",
            "registryLogic": "0x385827aC8d1AC7B2960D4aBc303c843D9f87Bb0C",
            "registryData": "0x0fC25C7931679B838209c484d49Df0Cb9E633C41",
            "stakeLogic": "0xe517af2457E0dD285ed22Ee4440b265f203D1B0d",
            "stakeLogicV1": "0x88Ac1E78b8a7D2B457Cb030978F71EdeE541bD5b",
            "stakeData": "0xaB3AC436D66CBEeDc734ed2c1562c3a213c9bc77",
            "derivativesLogic": "0xDfBFe895e07e5115773Cb9631CB2148114589caC",
            "derivativesData": "0x563052914Fd973a2305763269A106a7B0B6D50Cc"
        },
        "minimumDepositConfirmations": 25,
        "geofence": {
            "block": ["US", "PR", "AS", "VI", "GU", "UM", "SC", "CU", "SY", "SD", "IR", "KP", "UA:40", "UA:43"]
        },
        "noSignup": false,
        "maintenance": false,
        "tradingDisabled": false,
        "depositGasLimit": 160000,
        "gasPriceMultiplier": 1.5,
        "default": {
            "instrument": "1"
        },
        "markets": {
            "DAI": true
        },
        "legacyTokensExtensionSupport": {
            "USDT": true
        },
        "defaultDisplayPair": "DAIUSDC"
    },
    "instruments": {
        "1": {
            "id": "1",
            "symbol": "BTCUSD",
            "name": "BTC/USD",
            "status": "active",
            "tickSize": 1,
            "quoteSignificantDigits": 0,
            "baseSignificantDigits": 4,
            "baseSymbol": "BTC",
            "quoteSymbol": "DAI",
            "maxLeverage": 100,
            "topic": "index_BTCUSD",
            "quote": {
                "name": "DAI",
                "address": "0x6B175474E89094C44Da98b954EedeAC495271d0F",
                "symbol": "DAI",
                "decimals": 18
            }
        },
        "2": {
            "id": "2",
            "symbol": "ETHUSD",
            "name": "ETH/USD",
            "status": "active",
            "tickSize": 0.1,
            "quoteSignificantDigits": 1,
            "baseSignificantDigits": 2,
            "baseSymbol": "ETH",
            "quoteSymbol": "DAI",
            "maxLeverage": 50,
            "topic": "index_ETHUSD",
            "quote": {
                "name": "DAI",
                "address": "0x6B175474E89094C44Da98b954EedeAC495271d0F",
                "symbol": "DAI",
                "decimals": 18
            }
        }
    },
    "assets": {
        "DAI": {
            "name": "DAI",
            "address": "0x6B175474E89094C44Da98b954EedeAC495271d0F",
            "symbol": "DAI",
            "decimals": 18
        },
        "L2": {
            "name": "L2",
            "address": "0xBbff34E47E559ef680067a6B1c980639EEb64D24",
            "symbol": "L2",
            "decimals": 18
        }
    },
    "user": {
        "ip": "<IP Address>",
        "country": ["<country>", "<province>"]
    }
}
```
<a name="futures-instrument-recent-trade"></a>
## Recent trade data for an instrument (e.g. LEVETH)
### GET /instrument/:symbol/trade
```javascript
zka.rest.get('/instrument/LEVETH/trade').then(function(result) {console.log(result)})
```
### Response
```javascript
[ { date: 1550710792,
    price: 0.000102,
    volume: 0.2,
    instrument: 'LEVETH',
    side: 'buy' },
  { date: 1550708634,
    price: 0.000101,
    volume: 1,
    instrument: 'LEVETH',
    side: 'buy' },
  { date: 1550687614,
    price: 0.0001,
    volume: 1,
    instrument: 'LEVETH',
    side: 'buy' },
  { date: 1550682148,
    price: 0.0001,
    volume: 92,
    instrument: 'LEVETH',
    side: 'sell' },
  { date: 1550682147,
    price: 0.0001,
    volume: 6,
    instrument: 'LEVETH',
    side: 'buy' },
  { date: 1550682142,
    price: 0.0001,
    volume: 94,
    instrument: 'LEVETH',
    side: 'sell' } 
]
```

<a name="instrument-chart"></a>
## Chart for instrument
### GET /instrument/:symbol/chart/:timeframe
```javascript
zka.rest.get('/instrument/LEVETH/chart/5').then(function(result) {console.log(result)})
```
### Response
```javascript
[ { v: 0,
    s: 0,
    t: 1550794200,
    o: 0.000102,
    h: 0.000102,
    l: 0.000102,
    c: 0.000102,
    i: 'LEVETH' },
  { v: 0,
    s: 0,
    t: 1550793900,
    o: 0.000102,
    h: 0.000102,
    l: 0.000102,
    c: 0.000102,
    i: 'LEVETH' },
  { v: 0,
    s: 0,
    t: 1550793600,
    o: 0.000102,
    h: 0.000102,
    l: 0.000102,
    c: 0.000102,
    i: 'LEVETH' },
  { v: 0,
    s: 0,
    t: 1550793300,
    o: 0.000102,
    h: 0.000102,
    l: 0.000102,
    c: 0.000102,
    i: 'LEVETH' },
  { v: 0,
    s: 0,
    t: 1550793000,
    o: 0.000102,
    h: 0.000102,
    l: 0.000102,
    c: 0.000102,
    i: 'LEVETH' },
  { v: 0,
    s: 0,
    t: 1550792700,
    o: 0.000102,
    h: 0.000102,
    l: 0.000102,
    c: 0.000102,
    i: 'LEVETH' }
]
```

<a name="instrument-orderbook"></a>
## Order book for the instrument
### GET /instrument/:symbol/orderbook
```javascript
zka.rest.get('/instrument/LEVETH/orderbook').then(function(result) {console.log(result)})
```
### Response
```javascript
{ bid: 0.000093,
  ask: 0.000102,
  buy:
   [ { price: 0.000093,
       numberOfOrders: 1,
       totalQuantity: 100,
       instrument: 'LEVETH' },
     { price: 0.000092,
       numberOfOrders: 1,
       totalQuantity: 100,
       instrument: 'LEVETH' }],
  sell:
   [ { price: 0.000102,
       numberOfOrders: 1,
       totalQuantity: 0.2,
       instrument: 'LEVETH' },
     { price: 0.000103,
       numberOfOrders: 1,
       totalQuantity: 100,
       instrument: 'LEVETH' }] 
}
```

<a name="open-order-all"></a>
## Get all open orders
### GET /order
```javascript
zka.rest.get('/order').then(function(result) {console.log(result)})
```

### Response
```javascript
[ { uuid: '77bb9a50-3639-11e9-aa67-1b934017d41a',
    accountId: '0xE239Caeb4A6eCe2567fa5307f6b5D95149a5188F',
    side: 'buy',
    quantity: 9,
    filled: 0,
    averagePrice: 0,
    cancelled: 0,
    price: 0.001209,
    entryTime: 1550795606133888,
    eventTime: 1550795606133888,
    status: 'open',
    orderType: 'LMT',
    instrument: 'LEVETH',
    timestamp: 1550795605937000,
    signature:
     '0x2de825f6315f3a712f0b69c36b690918466889edcebbd86e086c4b5e8715c9fa2bd4e74bf0cb263d2c5464b7eba5777f94246989d4f98707c9f44aa891b4743900',
    token: '0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4',
    clientOrderId: 'ac60c4f4-bd6b-40a4-ae1d-bbef604d0bb7',
    originator: '0x12d80a4b0803Cf7D462EDF36963429B6aCfA3fFa' },
  { uuid: 'b7bf15a0-3639-11e9-b2cc-fe32bd3894ee',
    accountId: '0xE239Caeb4A6eCe2567fa5307f6b5D95149a5188F',
    side: 'buy',
    quantity: 8,
    filled: 0,
    averagePrice: 0,
    cancelled: 0,
    price: 0.001213,
    entryTime: 1550795713530585,
    eventTime: 1550795713530585,
    status: 'open',
    orderType: 'LMT',
    instrument: 'LEVETH',
    timestamp: 1550795713339000,
    signature:
     '0x962f348852da325d8663d25ee922f67b278929d500b68234ee0e294d0b4f7e601a957c8798a7fb6d26fb2bc477d3c30293790d9a64e68a3e87d6ae433432b33d01',
    token: '0xAa7127e250E87476FdD253f15e86A4Ea9c4c4BD4',
    clientOrderId: 'a0da5818-b0a3-4e39-b8eb-f5f7f7384bfe',
    originator: '0x12d80a4b0803Cf7D462EDF36963429B6aCfA3fFa' } 
]
```

<a name="futures-websocket-orderbook"></a>
## Fetch all futures order books
### List on the topic: 'orderbook'

Connect to the socket endpoint and listen on "orderbook".
A simple code illustration in python and a sample response is provided.

```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.connect('https://kovan.leverj.io', socketio_path='/futures/socket.io')
sio.on("orderbook", on_orderbook)

def on_orderbook(data):
        print(f'orderbook data: {data}')

```

### Response
```python
{
    '1': {
        'buy': [],
        'sell': []
    },
    '2': {
        'buy': [],
        'sell': []
    },
    '3': {
        'bid': 56904,
        'ask': 56914,
        'buy': [{
            'price': 56904,
            'numberOfOrders': 1,
            'totalQuantity': 0.01,
            'instrument': '3'
        }, {
            'price': 56899,
            'numberOfOrders': 1,
            'totalQuantity': 0.01,
            'instrument': '3'
        }, {
            'price': 56894,
            'numberOfOrders': 1,
            'totalQuantity': 0.01,
            'instrument': '3'
        }, {
            'price': 56889,
            'numberOfOrders': 1,
            'totalQuantity': 0.01,
            'instrument': '3'
        }, {
            'price': 56884,
            'numberOfOrders': 1,
            'totalQuantity': 0.01,
            'instrument': '3'
        }],
        'sell': [{
            'price': 56914,
            'numberOfOrders': 1,
            'totalQuantity': 0.01,
            'instrument': '3'
        }, {
            'price': 56919,
            'numberOfOrders': 1,
            'totalQuantity': 0.01,
            'instrument': '3'
        }, {
            'price': 56924,
            'numberOfOrders': 1,
            'totalQuantity': 0.01,
            'instrument': '3'
        }, {
            'price': 56929,
            'numberOfOrders': 1,
            'totalQuantity': 0.01,
            'instrument': '3'
        }, {
            'price': 56934,
            'numberOfOrders': 1,
            'totalQuantity': 0.01,
            'instrument': '3'
        }]
    },
    '4': {
        'bid': 1718.5,
        'ask': 1720.5,
        'buy': [{
            'price': 1718.5,
            'numberOfOrders': 1,
            'totalQuantity': 1.65,
            'instrument': '4'
        }, {
            'price': 1717.9,
            'numberOfOrders': 1,
            'totalQuantity': 0.57,
            'instrument': '4'
        }, {
            'price': 1717.4,
            'numberOfOrders': 1,
            'totalQuantity': 0.22,
            'instrument': '4'
        }, {
            'price': 1716.9,
            'numberOfOrders': 1,
            'totalQuantity': 0.04,
            'instrument': '4'
        }],
        'sell': [{
            'price': 1720.5,
            'numberOfOrders': 1,
            'totalQuantity': 1.65,
            'instrument': '4'
        }, {
            'price': 1721,
            'numberOfOrders': 1,
            'totalQuantity': 0.57,
            'instrument': '4'
        }, {
            'price': 1721.6,
            'numberOfOrders': 1,
            'totalQuantity': 0.22,
            'instrument': '4'
        }, {
            'price': 1722.1,
            'numberOfOrders': 1,
            'totalQuantity': 0.04,
            'instrument': '4'
        }]
    }
}
```


<aside class="notice">
TODO
</aside>