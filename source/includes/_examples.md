# Examples
Examples are structured as follows:

|Section|Description|
|---|---|
|Endpoint|The /api endpoint|
|Client Request|Request using the zka client|
|Server Response|JSON Response payload (abbreviated to partial data sets for readability)|

<a name="all-info"></a>
## Exchange Basic Info
### GET /all/info
```javascript
zka.rest.get('/all/info').then(function(result) {console.log(result)})
```
### Response
```javascript
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

<a name="all-config"></a>
## Exchange config (format subject to frequent change)
### GET /all/config
```javascript
zka.rest.get('/all/config').then(function(result) {console.log(result)})
```
### Response
```javascript
{ config:
   { maxInputs: 50,
     maxOrdersCreateUpdate: 100,
     fee:
      { maker: 0, taker: 20, factor: 10000, weiPerNanoFee: 1000000 },
     estimatedTokenTransferFee: '100000',
     network:
      { provider: 'mainnet',
        etherscan: 'https://etherscan.io',
        id: 1,
        registry: '0x7B70aCD346892736f9f6c7F4f196B07400a50Da0',
        custodian: '0xCE00901a0638d758D6f89d59dFa32120D2259B0C',
        staking: '0xeF4224FBE45b60F661aFBb6C7eb072EAFc6D5621' },
     geofence: { block: [Array] },
     noSignup: false },
  instruments:
   { FEEETH:
      { symbol: 'FEEETH',
        name: 'FEE/ETH',
        status: 'active',
        ticksize: 8,
        ticksperpoint: 100000000,
        baseSignificantDigits: 8,
        quoteSignificantDigits: 1,
        base: [Object],
        quote: [Object] },
     LEVETH:
      { symbol: 'LEVETH',
        name: 'LEV/ETH',
        status: 'active',
        ticksize: 8,
        ticksperpoint: 100000000,
        baseSignificantDigits: 8,
        quoteSignificantDigits: 1,
        base: [Object],
        quote: [Object] },
     ETHDAI:
      { symbol: 'ETHDAI',
        name: 'ETH/DAI',
        status: 'active',
        ticksize: 1,
        ticksperpoint: 10,
        baseSignificantDigits: 1,
        quoteSignificantDigits: 4,
        base: [Object],
        quote: [Object] } },
  assets:
   { ETH:
      { name: 'ETHEREUM',
        address: '0x0000000000000000000000000000000000000000',
        symbol: 'ETH',
        decimals: 18 },
     LEV:
      { name: 'LEVERJ',
        address: '0x0F4CA92660Efad97a9a70CB0fe969c755439772C',
        symbol: 'LEV',
        decimals: 9 },
     DAI:
      { name: 'DAI',
        address: '0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359',
        symbol: 'DAI',
        decimals: 18 },
     FEE:
      { name: 'FEE',
        address: '0xffe4a5A685eFc53F45Bf50F3DAB45ded1B028134',
        symbol: 'FEE',
        decimals: 9 
      } } 
}
```
<a name="instrument-recent-trade"></a>
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