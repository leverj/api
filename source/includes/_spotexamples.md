# Examples (Spot)
Examples are structured as follows:

| Section         | Description                                                              |
| --------------- | ------------------------------------------------------------------------ |
| Endpoint        | The /api endpoint                                                        |
| Client Request  | Request using the zka client                                             |
| Server Response | JSON Response payload (abbreviated to partial data sets for readability) |

<a name="spot-all-info"></a>
## Exchange Basic Info
### GET /all/info
```shell
curl https://live.leverj.io/spot/api/v1/all/info
```

```python
response = requests.get('https://live.leverj.io/spot/api/v1/all/info')
response.json()
```

```javascript
zka.rest.get('/all/info').then(function(result) {console.log(result)})
```
### Response
Returns information on 
  
* last 24 hours volume, 
* last price, 
* bid, and 
* ask

for each of the spot pairs.

```json
{ FEEETH:
   { vol24H: { qty: 0, eth: 0, instrument: 'FEEETH' },
     bid: 0.000002 },
  LEVETH:
   { vol24H: { qty: 1.2, eth: 0.0001214, instrument: 'LEVETH' },
     lastPrice: 0.000102,
     bid: 0.000093,
     ask: 0.000102 } 
}
```

<a name="spot-all-config"></a>
## Exchange config (format subject to frequent change)
### GET /all/config
```shell
curl https://live.leverj.io/spot/api/v1/all/config
```

```python
response = requests.get('https://live.leverj.io/spot/api/v1/all/config')
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


```json
{
    "config": {
        "maxInputs": 50,
        "maxOrdersCreateUpdate": 50,
        "fee": {
            "default": {
                "maker": 0,
                "taker": 0
            },
            "factor": 10000,
            "weiPerNanoFEE": 1000000,
            "DAIUSDC": {
                "maker": 0,
                "taker": 0
            }
        },
        "estimatedTokenTransferFee": "100000",
        "network": {
            "provider": "mainnet",
            "etherscan": "https://etherscan.io",
            "id": 1,
            "appId": 2,
            "gluon": "0x75ACe7a086eA0FB1a79e43Cc6331Ad053d8C67cB",
            "legacyTokensExtension": "0xDA88EfA53c85Afa30564bb651A2E76b99a232082",
            "lev": "0x0F4CA92660Efad97a9a70CB0fe969c755439772C",
            "registryLogic": "0x385827aC8d1AC7B2960D4aBc303c843D9f87Bb0C",
            "registryData": "0x0fC25C7931679B838209c484d49Df0Cb9E633C41",
            "stakeLogic": "0xe517af2457E0dD285ed22Ee4440b265f203D1B0d",
            "stakeLogicV1": "0x88Ac1E78b8a7D2B457Cb030978F71EdeE541bD5b",
            "stakeData": "0xaB3AC436D66CBEeDc734ed2c1562c3a213c9bc77",
            "spotLogic": "0x463cd03Db739B8A8c67adC8732f708A649478681",
            "spotData": "0x0d283D685F0A741C463846176e4c8EFF90D3F9EC"
        },
        "geofence": {
            "block": ["US", "PR", "AS", "VI", "GU", "UM", "SC", "CU", "SY", "SD", "IR", "KP", "UA:40", "UA:43"]
        },
        "noSignup": false,
        "maintenance": false,
        "tradingDisabled": false,
        "depositGasLimit": 160000,
        "gasPriceMultiplier": 1.5,
        "default": {
            "instrument": "LEVETH"
        },
        "minimumDepositConfirmations": 25,
        "markets": {
            "DAI": true,
            "ETH": true
        },
        "legacyTokensExtensionSupport": {
            "USDT": false
        },
        "defaultDisplayPair": "DAIUSDC"
    },
    "instruments": {
        "L2ETH": {
            "id": "L2ETH",
            "symbol": "L2ETH",
            "name": "L2/ETH",
            "status": "active",
            "ticksize": 6,
            "ticksperpoint": 1000000,
            "baseSignificantDigits": 1,
            "quoteSignificantDigits": 6,
            "base": {
                "name": "L2",
                "address": "0xBbff34E47E559ef680067a6B1c980639EEb64D24",
                "symbol": "L2",
                "decimals": 18
            },
            "quote": {
                "name": "ETH",
                "address": "0x0000000000000000000000000000000000000000",
                "symbol": "ETH",
                "decimals": 18
            },
            "convertSymbol": "ETH"
        },
        "LINKETH": {
            "id": "LINKETH",
            "symbol": "LINKETH",
            "name": "LINK/ETH",
            "status": "active",
            "ticksize": 6,
            "ticksperpoint": 1000000,
            "baseSignificantDigits": 1,
            "quoteSignificantDigits": 6,
            "base": {
                "name": "LINK",
                "address": "0x514910771AF9Ca656af840dff83E8264EcF986CA",
                "symbol": "LINK",
                "decimals": 18
            },
            "quote": {
                "name": "ETH",
                "address": "0x0000000000000000000000000000000000000000",
                "symbol": "ETH",
                "decimals": 18
            },
            "convertSymbol": "ETH"
        },
        "ETHDAI": {
            "id": "ETHDAI",
            "symbol": "ETHDAI",
            "name": "ETH/DAI",
            "status": "active",
            "ticksize": 2,
            "ticksperpoint": 100,
            "baseSignificantDigits": 4,
            "quoteSignificantDigits": 2,
            "base": {
                "name": "ETH",
                "address": "0x0000000000000000000000000000000000000000",
                "symbol": "ETH",
                "decimals": 18
            },
            "quote": {
                "name": "DAI",
                "address": "0x6B175474E89094C44Da98b954EedeAC495271d0F",
                "symbol": "DAI",
                "decimals": 18
            },
            "convertSymbol": "ETH"
        },
        "DAIUSDC": {
            "id": "DAIUSDC",
            "symbol": "DAIUSDC",
            "name": "DAI/USDC",
            "status": "active",
            "ticksize": 4,
            "ticksperpoint": 10000,
            "baseSignificantDigits": 4,
            "quoteSignificantDigits": 4,
            "base": {
                "name": "DAI",
                "address": "0x6B175474E89094C44Da98b954EedeAC495271d0F",
                "symbol": "DAI",
                "decimals": 18
            },
            "quote": {
                "name": "USDC",
                "address": "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48",
                "symbol": "USDC",
                "decimals": 6
            },
            "convertSymbol": "DAI"
        }
    },
    "assets": {
        "ETH": {
            "name": "ETH",
            "address": "0x0000000000000000000000000000000000000000",
            "symbol": "ETH",
            "decimals": 18
        },
        "LINK": {
            "name": "LINK",
            "address": "0x514910771AF9Ca656af840dff83E8264EcF986CA",
            "symbol": "LINK",
            "decimals": 18
        },
        "DAI": {
            "name": "DAI",
            "address": "0x6B175474E89094C44Da98b954EedeAC495271d0F",
            "symbol": "DAI",
            "decimals": 18
        },
        "USDC": {
            "name": "USDC",
            "address": "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48",
            "symbol": "USDC",
            "decimals": 6
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
<a name="spot-instrument-recent-trade"></a>
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

<a name="open-create-order"></a>
## Create New Order
### POST /order
```javascript
// install @leverj/adapter 
// npm i @leverj/adapter
const adapter = require("@leverj/adapter/src/OrderAdapter")

// create new order object


function createNewOrder(side, price, quantity, orderInstrument, orderAccountId, secret) {
  let order = {
    orderType: 'LMT',
    side,
    price: price.toFixed(orderInstrument.baseSignificantDigits) - 0,
    quantity: quantity.toFixed(orderInstrument.termSignificantDigits) - 0,
    timestamp: Date.now() * 1e3,
    accountId: orderAccountId,
    token: orderInstrument.address,
    instrument: orderInstrument.symbol
  }
  order.signature = adapter.sign(order, orderInstrument, secret)
  return order
}


// get instrument information for LEVETH
// create LEVETH buy order

zka.rest.get('/all/config').then(function (result) {
  const instruments = result.instruments
  const LEVETH_instrument = instruments['LEVETH']
  console.log(LEVETH_instrument)
  const newOrder = createNewOrder('buy', 0.001229, 20, LEVETH_instrument, accountId, secret)
  try {
    zka.rest.post('/order', {}, [newOrder]).catch(console.error)
  } catch (e) {
    console.error(e)
  }
})

```

<a name="account"></a>
## User account
### GET /account
```javascript
zka.rest.get('/account').then(function(result) {console.log(result)})
```
### Response
```javascript
{ orders:
   { FEEETH: {},
     LEVETH:
      { '77bb9a50-3639-11e9-aa67-1b934017d41a': [Object],
        'b7bf15a0-3639-11e9-b2cc-fe32bd3894ee': [Object] } },
  accountId: '0xE239Caeb4A6eCe2567fa5307f6b5D95149a5188F',
  apiKeys: { '0x12d80a4b0803Cf7D462EDF36963429B6aCfA3fFa': true },
  preference: {},
  exited: {} 
}
```
<a name="account-execution"></a>
## User Executions
### GET /account/execution
```javascript
zka.rest.get('/account/execution').then(function(result) {console.log(result)})
```
### Response
```javascript
[ { accountId: '0xE239Caeb4A6eCe2567fa5307f6b5D95149a5188F',
    executionid: '7dd3a952-3639-11e9-bd86-99376ce577bd',
    side: 'buy',
    orderType: 'LMT',
    orderid: '7d30b290-3639-11e9-8dbe-58e2283f8f2a',
    price: 0.001228,
    quantity: 1,
    liquidity: 'commission',
    commission: 0.000002456,
    eventTime: 1550795616358063,
    instrument: 'LEVETH' },
  { accountId: '0xE239Caeb4A6eCe2567fa5307f6b5D95149a5188F',
    executionid: '7d9a22c2-3639-11e9-92a4-74585b482779',
    side: 'buy',
    orderType: 'LMT',
    orderid: '7d30b290-3639-11e9-8dbe-58e2283f8f2a',
    price: 0.001227,
    quantity: 1,
    liquidity: 'commission',
    commission: 0.000002454,
    eventTime: 1550795615980826,
    instrument: 'LEVETH' },
  { accountId: '0xE239Caeb4A6eCe2567fa5307f6b5D95149a5188F',
    executionid: '7d396520-3639-11e9-805a-71319d7431df',
    side: 'buy',
    orderType: 'LMT',
    orderid: '7d30b290-3639-11e9-8dbe-58e2283f8f2a',
    price: 0.001226,
    quantity: 1,
    liquidity: 'commission',
    commission: 0.000002452,
    eventTime: 1550795615346724,
    instrument: 'LEVETH' } 
]
```