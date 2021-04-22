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
### Listen on the topic: 'orderbook'

Connect to the socket endpoint and listen on "orderbook".
A simple code illustration in python and a sample response is provided.

The entire orderbook is returned when listening on this topic. Filter down to the specific instrument as required.

The instruments currently supported are:

* 1 - BTCUSD (DAI)
* 2 - ETHUSD (DAI)
* 3 - BTCUSD (USDT)
* 4 - ETHUSD (USDT)
* 5 - DEFIUSD (USDT)


```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.connect('https://kovan.leverj.io', socketio_path='/futures/socket.io')
sio.on("orderbook", on_orderbook)

def on_orderbook(data):
        print(f'orderbook data: {data}')

```

### Response
```
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

<a name="futures-websocket-index"></a>
## Fetch indices
### Listen on the topic: 'index'

Connect to the socket endpoint and listen on "index".
A simple code illustration in python and a sample response is provided.

The value for all indices is returned in real time, as available. Filter down to the specific index as required.

The indices currently supported are:

* index_BTCUSD
* index_ETHUSD
* index_DEFI



```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.connect('https://kovan.leverj.io', socketio_path='/futures/socket.io')
sio.on("index", on_index)

def on_index(data):
        print(f'index data: {data}')

```

### Response
```
on_index data: {'date': 1618952192, 'topic': 'index_BTCUSD'}
on_index data: {'date': 1618952192, 'topic': 'index_DEFI'}
on_index data: {'date': 1618952192, 'topic': 'index_ETHUSD'}
on_index data: {'date': 1618952192, 'topic': 'index_LINK'}
on_index data: {'date': 1618952193, 'price': 2309.6, 'topic': 'index_ETHUSD', 'stale': False}
on_index data: {'date': 1618952193, 'price': 56854.1, 'topic': 'index_BTCUSD', 'stale': False}
on_index data: {'date': 1618952194, 'price': 56852.6, 'topic': 'index_BTCUSD', 'stale': False}
on_index data: {'date': 1618952195, 'price': 2309.2, 'topic': 'index_ETHUSD', 'stale': False}
on_index data: {'date': 1618952195, 'price': 56847.6, 'topic': 'index_BTCUSD', 'stale': False}
on_index data: {'date': 1618952196, 'price': 451.1, 'topic': 'index_DEFI', 'stale': False}
```

<a name="futures-websocket-connect"></a>
## Connect via websocket
### Connect to Leverj socket.io endpoint

Connect using one of the socket.io language bindings. 
An example in Python is included.

As a first step instantiate a socket.io client. Register an event listener for the "connect" event. This would allow you to be alerted on a successful connection to the websocket endpoint.

Use the Leverj host and path to connect to the websocket endpoint.

For kovan testnet the host value is `https://kovan.leverj.io` and path is `/futures/socket.io`. For livenet the path is the same but the host changes to `https://live.leverj.io`.


```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.on("connect", on_connect)
sio.connect('https://kovan.leverj.io', socketio_path='/futures/socket.io')

def on_connect(data):
    print('connected!)

```

### Response

If connected successfully, you should see the message "connected!".

```
**** response ****
connected!
```

<a name="futures-websocket-disconnect"></a>
## Disconnect from a websocket
### Disconnect from a connected Leverj socket.io endpoint

Disconnect using one of the socket.io language bindings. 
An example in Python is included.

Register an event listener for the "disconnect" event. This would allow you to be alerted when you successfully disconnect from an existing websocket connection.


```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.on("disconnect", on_disconnect)
sio.disconnect()

def on_disconnect(data):
    print('disconnected!)

```

### Response

If the socket connection is disconnected successfully, you should see the message "disconnected!".

```
**** response ****
disconnected!
```

<a name="futures-websocket-register"></a>
## Register
### Register on a connected Leverj socket.io endpoint

Registration allows you to authenticate and listen to your own personal events from protected endpoints.

As a first step instantiate a socket.io client. Connect and then register.

<aside class="warning">
Make sure to register at the <a href="https://kovan.leverj.io">Leverj Kovan Testnet</a> and at <a href="https://live.leverj.io">Leverj Live</a>. Download your Gluon API Key, which is accessible from your Gluon wallet. You will need the Gluon API Key to make calls to all protected endpoints.
</aside>

Please look at the [websocket client example]("https://github.com/leverj/leverj-pyclient/blob/develop/websocket_client_example.py") and the utility functions in [leverj.websocket.util.py] ("https://github.com/leverj/leverj-pyclient/blob/develop/leverj/websocket/util.py").

```python
def register(originator_credentials):
    request_body = {"accountId": originator_credentials.get(
        'accountId'), "apiKey": originator_credentials.get('apiKey')}
    request = {
        "method": "GET",
        "uri": "/register",
        "headers": {},
        "body": json.dumps(request_body),
        "params": {}
    }
    return request

request = register(originator_credentials)

# protected_endpoint_request util method adds required signature headers and formats the request
protected_request_payload = protected_endpoint_request(request, originator_credentials)
    
```

### Response

You will not receive an explicit response on successful registration. If the registration fails you will not receive data from protected endpoints.


<a name="futures-websocket-unregister"></a>
## Unregister
### Stop listening for events from Leverj socket.io protected endpoint

Unregister is analogous to logout.

Once you successfully unregister, you will stop listening to data from events for protected endpoints that need authorization.


```python
def unregister(originator_credentials):
    request_body = {"accountId": originator_credentials.get(
        'accountId'), "apiKey": originator_credentials.get('apiKey')}
    request = {
        "method": "GET",
        "uri": "/unregister",
        "headers": {},
        "body": json.dumps(request_body),
        "params": {}
    }
    return request

request = unregister(originator_credentials)

# protected_endpoint_request util method adds required signature headers and formats the request
protected_request_payload = protected_endpoint_request(request, originator_credentials)

```

### Response

You will not receive an explicit response on unregistration.


<a name="futures-websocket-create-order"></a>
## Create Order
### Create an order and send it via websocket

Before you create an order, take a moment to look at the product specification at https://leverj.io/. Leverj Futures offers perpetual swap contracts. These are linear contracts, where margin and settelment is in stablecoins. Both DAI and USDT margined and settled contracts are available for BTCUSD and ETHUSD. The DEFIUSD contract is offered only with USDT as the margin and settlement currency.

Leverj supports a number of advanced order types. Please read [Leverj Futures Order Types](https://blog.leverj.io/leverj-futures-order-types-204d903eb76f) for details.

The following attributes are supported for an order:

| Attribute/Property | Description                                                                                                                                                                                           |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| accountId          | Account address of the trader. Credentials or APIKey has this information                                                                                                                             |
| originator         | APIKey. Credentials or APIKey has this information                                                                                                                                                    |
| instrument         | The instrument id                                                                                                                                                                                     |
| price              | Price at which you want to buy or sell. Adjust price precision basis supported `quoteSignificantDigits` for the instrument                                                                            |
| quantity           | Amount you want to buy or sell. Adjust quantity precision basis supported `baseSignificantDigits` for the instrument                                                                                  |
| marginPerFraction  | Perpetual swaps are leveraged contracts so you could put down substantially less margin than the notional value you buy or sell. This is the margin in lowest denomination of base significant digits |
| side               | Order side. Choices are "buy" or "sell"                                                                                                                                                               |
| orderType          | Multiple order types are supported. LMT, MKT, SMKT, SLMT are supported                                                                                                                                |
| timestamp          | Timestamp when order is created. Make sure to have this in milliseconds                                                                                                                               |
| quote              | Address of the quote currency                                                                                                                                                                         |
| isPostOnly         | Boolean value to flag is it's a post only order                                                                                                                                                       |
| reduceOnly         | Boolean value to flag is it's a reduce only order                                                                                                                                                     |
| clientOrderId      | User generated order id that could be used to query the status of an order                                                                                                                            |
| triggerPrice       | Trigger price when an order is activated. For example, a stop-limit orders gets activated only when the stop order trigger price is reached                                                           |
| indexSanity        | A sanity check to define what variance from the index should be allowed                                                                                                                               |

Once you create an order. You need to sign it. A signed order becomes the body of a request that needs to be transformed for a protected websocket request.

Once you have a protected request ready, you emit it from the websocket client to the Leverj endpoint for creating orders. Multiple orders can be created in a single call.

Example code for Python is included.

Start by looking at the [order creation and signing functions](https://github.com/leverj/leverj-pyclient/blob/develop/leverj/client.py#L166). Then look at the method for created [a protected request](https://github.com/leverj/leverj-pyclient/blob/develop/leverj/websocket/util.py#L14) order creation payload. A working example is available in [websocket_client_example.py](https://github.com/leverj/leverj-pyclient/blob/develop/websocket_client_example.py).


```python
def get_margin_per_fraction(self, orderInstrument, price, leverage):
    estimated_entry_price = price
    max_leverage = orderInstrument['maxLeverage']
    if leverage > max_leverage:
        self.logger.info(
            f'You have specified a leverage of {leverage} but the max leverage allowed on this instrument is {max_leverage}.')
    base_significant_digits = orderInstrument['baseSignificantDigits']
    decimals = orderInstrument['quote']['decimals']
    multiplier = Decimal(
        pow(Decimal(10), Decimal(decimals - base_significant_digits)))
    intermediate_value = Decimal((Decimal(
        estimated_entry_price) * multiplier) / Decimal(leverage)).to_integral_exact()
    return int(Decimal(intermediate_value) * Decimal(pow(Decimal(10), Decimal(base_significant_digits))))

def create_futures_order(self, side, price, triggerPrice, quantity, orderInstrument, orderType, leverage, orderAccountId, originatorApiKey, secret, reduceOnly=False):
    price_precision = orderInstrument.get('quoteSignificantDigits')
    quantity_precision = orderInstrument.get('baseSignificantDigits')
    # default leverage is set to 1.0 which means you aren't using any leverage. If you want 5K DAI position to control 10K DAI worth of BTC, use leverage of 2
    order = {
        'accountId': orderAccountId,
        'originator': originatorApiKey,
        'instrument': orderInstrument['id'],
        'price': round_with_precision(price, price_precision),
        'quantity': round_with_precision(quantity, quantity_precision),
        'marginPerFraction': str(self.get_margin_per_fraction(orderInstrument, price, leverage)),
        'side': side,
        'orderType': orderType,
        'timestamp': int(time.time()*1000000),
        'quote': orderInstrument['quote']['address'],
        'isPostOnly': False,
        'reduceOnly': reduceOnly,
        'clientOrderId': 1,
        'triggerPrice': round_with_precision(triggerPrice, price_precision),
        'indexSanity': MAX_INDEX_VARIANCE
    }
    order['signature'] = futures.sign_order(
        order, orderInstrument, secret)
    return order

def create_order(originator_credentials):
    client = Client('./resources/config/kovan.leverj.io/c21b18-64bdd3.json')
    client.set_api_url('https://kovan.leverj.io/futures/api/v1')
    all_config = client.get_all_config()
    logging.debug(f'all info: {all_config}')
    instruments = all_config.get('instruments')
    BTCDAI_instrument = instruments.get('1')
    print(f'BTCDAI_instrument: {BTCDAI_instrument}')
    futures_order = client.create_futures_order('buy', 55394, 55394, 0.02, BTCDAI_instrument, 'LMT', 2.0, originator_credentials.get(
        'accountId'), originator_credentials.get('apiKey'), originator_credentials.get('secret'))
    print(f'futures_order: {futures_order}')
    body = json.dumps([futures_order], separators=(',', ':'))
    request = {
        "method": "POST",
        "uri": "/order",
        "headers": {"requestid": str(uuid.uuid4())},
        "body": body,
        "params": {"instrument": BTCDAI_instrument.get('id')}
    }
    return request

request = create_order(originator_credentials)

# protected_endpoint_request util method adds required signature headers and formats the request
protected_request_payload = protected_endpoint_request(request, originator_credentials)


```

### Response

On successful order creation you should receive the newly created order as data on the `order_add` topic.

```
**** response ****
on_order_add: {'result': [{'uuid': '9c8e9a00-a304-11eb-be7d-fc18fda03052', 'accountId': '0xc21b183A8050D1988117B86408655ff974d021A0', 'side': 'buy', 'quantity': 0.02, 'filled': 0, 'averagePrice': 0, 'cancelled': 0, 'price': 53863, 'triggerPrice': 53863, 'marginPerFraction': '26931500000000000000000', 'entryTime': 1619052576672616, 'eventTime': 1619052576672616, 'status': 'open', 'orderType': 'LMT', 'instrument': '1', 'timestamp': 1619052575006805, 'signature': '0x015f2a9a3841cefc6d49e41d82f0f31fee1d6bea8bc77a14aebed36c834040ca70ebd4f94c4f50ca3bd2c93efda5bd36194924be978701d76742f84635bea4221c', 'clientOrderId': 1, 'originator': '0x64bdd35077Ce078aC7B87Cfb381d7F50059BDb16', 'isPostOnly': False, 'quote': '0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa', 'triggered': False, 'reduceOnly': False}]}
```

<a name="futures-websocket-update-order"></a>
## Connect via websocket
### Connect to Leverj socket.io endpoint

Connect using one of the socket.io language bindings. 
An example in Python is included.

As a first step instantiate a socket.io client. Register an event listener for the "connect" event. This would allow you to be alerted on a successful connection to the websocket endpoint.

Use the Leverj host and path to connect to the websocket endpoint.

For kovan testnet the host value is `https://kovan.leverj.io` and path is `/futures/socket.io`. For livenet the path is the same but the host changes to `https://live.leverj.io`.


```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.on("connect", on_connect)
sio.connect('https://kovan.leverj.io', socketio_path='/futures/socket.io')

def on_connect(data):
    print('connected!)

```

### Response

If connected successfully, you should see the message "connected!".

```
**** response ****
connected!
```

<a name="futures-websocket-cancel-order"></a>
## Cancel Order
### Create an order cancel request and send it via websocket

You will need the `uuid` for the orders you want to cancel. Once you have the `uuids` of the orders, create a request body with the following payload:

request_body = [{"op": "remove", "value": uuids}]

`uuids` are in a list. In the example python code there is only 1 element in this list.

Then generate a request dictionary or map as follows:

request = {
        "method": "PATCH",
        "uri": "/order",
        "headers": {"requestid": str(uuid.uuid4())},
        "body": json.dumps(request_body),
        "params": {"instrument": <instrument_symbol>}
    }

Format this request using the protected_endpoint_request function in [leverj.websocket.util.py](https://github.com/leverj/leverj-pyclient/blob/develop/leverj/websocket/util.py#L14) and then emit the event and data to send an order cancellation request to the server.

```python
def cancel_order(uuids, originator_credentials):
    client = Client('./resources/config/kovan.leverj.io/c21b18-64bdd3.json')
    client.set_api_url('https://kovan.leverj.io/futures/api/v1')
    all_config = client.get_all_config()
    instruments = all_config.get('instruments')
    BTCDAI_instrument = instruments.get('1')
    request_body = [{"op": "remove", "value": uuids}]
    request = {
        "method": "PATCH",
        "uri": "/order",
        "headers": {"requestid": str(uuid.uuid4())},
        "body": json.dumps(request_body),
        "params": {"instrument": BTCDAI_instrument.get('symbol')}
    }
    return request



uuids = ['9c8e9a00-a304-11eb-be7d-fc18fda03052']

 
request = cancel_order(uuids, originator_credentials)

# protected_endpoint_request util method adds required signature headers and formats the request
protected_request_payload = protected_endpoint_request(request, originator_credentials)
    print(protected_request_payload)

# emit from client to the connected websocket
websocket_client.sio.emit(protected_request_payload.get('event'), protected_request_payload.get('data'))


```

### Response

Once the order is cancelled, you will receive a confirmation if you are listening to `order_del`

```
**** response ****
on_order_del: {'result': '9c8e9a00-a304-11eb-be7d-fc18fda03052'}
```

<a name="futures-websocket-position"></a>
## Position
### Listen to position creation and any updates to an existing position

Make sure you are listening to `position` after coneecting and registering successfully. 


```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.on("position", on_account_balance)
sio.connect('https://kovan.leverj.io', socketio_path='/futures/socket.io')

def on_position(self, data):
    print(f'on_position: {data}')

```

### Response

If listening to `position` you should see information about your current positions when you receive data on this topic.

```
**** response ****
on_position: {'accountId': '0xc21b183A8050D1988117B86408655ff974d021A0', 'instrument': '1', 'notional': '538630000000000000000', 'margin': '269315000000000000000', 'size': '0.01', 'liquidationPrice': '27201', 'ranking': 269315000000, 'bankruptcyPrice': '26932', 'eventTime': 1619114054305, 'reservedFees': '215452000000000000'}
```

<a name="futures-websocket-liquidation"></a>
## Liquidation
### Listen to liquidation events

Make sure you are listening to `liquidation` after coneecting and registering successfully. 


```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.on("liquidation", on_account_balance)
sio.connect('https://kovan.leverj.io', socketio_path='/futures/socket.io')

def on_liquidation(self, data):
    print(f'on_liquidation: {data}')

```

### Response

If listening to `liquidation` you should see information when positions are liquidated.

```
**** response ****
TODO
```

<a name="futures-websocket-adl"></a>
## Auto Deleveraging (ADL)
### Listen to ADL events

Make sure you are listening to `adl` after coneecting and registering successfully. 


```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.on("adl", on_account_balance)
sio.connect('https://kovan.leverj.io', socketio_path='/futures/socket.io')

def on_adl(self, data):
    print(f'on_adl: {data}')

```

### Response

If listening to `adl` you should see information when positions are auto-deleveraged.

```
**** response ****
TODO
```

<a name="futures-websocket-order-execution"></a>
## Order Execution
### Listen for fills as orders are partially or fully matched

Make sure you are listening to `order_execution` after coneecting and registering successfully.


```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.on("order_execution", on_account_balance)
sio.connect('https://kovan.leverj.io', socketio_path='/futures/socket.io')

def on_order_execution(self, data):
    print(f'on_order_execution: {data}')

```

### Response

If listening to `order_execution` you should see a message or data point every time an existing order is partially or fully matched. You could track each and every fill by listening on this topic.

Sample response shows data for a partial match. Order was for same price but for 0.04 as the quantity. 0.01 of that order was matched in this case. Use `orderId` to match against open orders and track fills.

```
**** response ****
on_order_execution: {'instrument': '1', 'accountId': '0xc21b183A8050D1988117B86408655ff974d021A0', 'executionId': 'c0120ae0-a393-11eb-be58-92c3aa195f67', 'side': 'buy', 'orderType': 'LMT', 'orderId': '97ac02b0-a391-11eb-9afb-ab76d3b77c82', 'price': 53863, 'quantity': 0.01, 'commission': 0.107726, 'pnl': 0, 'eventTime': 1619114054286342}
```

<a name="futures-websocket-account-balance"></a>
## Account Balance
### Listen to account_balance

Make sure you are listening to `account_balance` after coneecting and registering successfully. 


```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.on("account_balance", on_account_balance)
sio.connect('https://kovan.leverj.io', socketio_path='/futures/socket.io')

def on_account_balance(self, data):
    print(f'on_account_balance: {data}')

```

### Response

If listening to `account_balance` you should see the entire set of balances when you receive data on this topic.

```
**** response ****
on_account_balance: {'0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa': {'accountId': '0xc21b183A8050D1988117B86408655ff974d021A0', 'assetAddress': '0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa', 'symbol': 'DAI', 'plasma': '17558903955615588889151', 'available': '17558903955615588889151', 'pending': '0'}, '0x6a4480B1c08A822Fed4b907AD09798ED79312a44': {'accountId': '0xc21b183A8050D1988117B86408655ff974d021A0', 'assetAddress': '0x6a4480B1c08A822Fed4b907AD09798ED79312a44', 'symbol': 'USDT', 'plasma': '16507310354', 'available': '16507310354', 'pending': '0'}, '0xF9990Bf4FFbc423b8a492771658eAade8A1E72D6': {'accountId': '0xc21b183A8050D1988117B86408655ff974d021A0', 'assetAddress': '0xF9990Bf4FFbc423b8a492771658eAade8A1E72D6', 'symbol': 'L2', 'plasma': '5500000000000000000000', 'available': '5500000000000000000000', 'pending': '0'}}
```

<a name="futures-websocket-funds-transfer"></a>
## Account Balance
### Listen to account_balance

Make sure you are listening to `account_balance` after coneecting and registering successfully. 


```python
sio = socketio.Client(logger=False, engineio_logger=False)
sio.on("account_balance", on_account_balance)
sio.connect('https://kovan.leverj.io', socketio_path='/futures/socket.io')

def on_account_balance(self, data):
    print(f'on_account_balance: {data}')

```

### Response

If listening to `account_balance` you should see the entire set of balances when you receive data on this topic.

```
**** response ****
on_account_balance: {'0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa': {'accountId': '0xc21b183A8050D1988117B86408655ff974d021A0', 'assetAddress': '0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa', 'symbol': 'DAI', 'plasma': '17558903955615588889151', 'available': '17558903955615588889151', 'pending': '0'}, '0x6a4480B1c08A822Fed4b907AD09798ED79312a44': {'accountId': '0xc21b183A8050D1988117B86408655ff974d021A0', 'assetAddress': '0x6a4480B1c08A822Fed4b907AD09798ED79312a44', 'symbol': 'USDT', 'plasma': '16507310354', 'available': '16507310354', 'pending': '0'}, '0xF9990Bf4FFbc423b8a492771658eAade8A1E72D6': {'accountId': '0xc21b183A8050D1988117B86408655ff974d021A0', 'assetAddress': '0xF9990Bf4FFbc423b8a492771658eAade8A1E72D6', 'symbol': 'L2', 'plasma': '5500000000000000000000', 'available': '5500000000000000000000', 'pending': '0'}}
```