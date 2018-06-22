# Examples
Examples are structured as follows:

|Section|Description|
|---|---|
|Title|What the /api endpoint stands for|
|URL template|Any colon prepended tokens are url parameters|
|HTTP Request|Abbreviated HTTP request|
|Server Response|Including expected HTTP error code|

<a name="auth"></a>
## Get Loginless Server pubkey
If you have already registered your public key, for example by signing on via the trading site, you can use the public key from the json key file to get the server's public key. The server uses a different key for each user.
### GET /auth
### 200 OK
```http
GET /api/v1/auth/038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df37 HTTP/1.1
Accept: application/json
Host: live.coinpit.me
```
### 200 OK
```json
{
  "serverPublicKey": "03133b6286431a0a5251a464ced4a5dbf156e8631a01cdadda9e6fd448bfc7eda7",
  "userid": "mvuQJYbLDDMKsNtr2KLV6fqeYj5Zis1Xdk"
}
```
<a name="auth-register"></a>
## Register Loginless User
It is easiest to register on the trading site, but if you wish to programmatically register a user, you can do so by sending a signed message with your public key, country and IP of registration. During registration, your IP needs to match your country code. Our [SDK](#sdk) enables you to do the signatures easily.
### POST /auth
```http
POST /api/v1/auth/038657d14c91aef4c7b2b117cfd1ee18fb7a9e0b248f8168f16b1bad63f9e7df37 HTTP/1.1
Accept: application/json
Host: live.coinpit.me
```
```json
[
  {
    "message":"{\"publicKey\":\"039d43948b9ce88893f3f3cb61d1995142741418f86412f1d5fcc12a010a753ac8\",\"country\":\"DK\",\"timestamp\":1487534736607,\"ip\":\"127.0.0.1\",\"introducerid\":\"\"}",
    "signature":"IF3239UZOPfdU3Ko8Wxf1Ohu5v0SF8TiXhdd66Nb2S4XXDyftF4r7ev1y/S/SGULLX9VxEMi4CJEmtiGzrHDCf0="
  }
]
```
### 200 OK
```json
 {"userid":"my7hu7RZDhRRBFRHXgqDMbbtCNX8rokGS9","serverPublicKey":"03cfa0eb0226f9c189967f048ba575b989bded84bebf4042e08571384f12252408"}
```
<a name="all-info"></a>
## Exchange Basic Info
### GET /all/info
```http
GET /api/v1/all/info HTTP/1.1
Accept: application/json
Host: test.leverj.io
```
### 200 OK
```json
{
    "BTCUSD7J21":{
        "lastPrice":1218.2,
        "vol24H":{
            "instrument":"BTCUSD7J21",
            "btc":0,
            "qty":0
        },
        "bid":1223,
        "ask":1224.1,
        "indexPrice":1217.3,
        "openInterest":{
            "instrument":"BTCUSD7J21",
            "btc":3.35991635,
            "qty":40
        }
    },
    "BTCUSD7J14":{
        "lastPrice":1216.9,
        "vol24H":{
            "instrument":"BTCUSD7J14",
            "btc":2.95598808,
            "qty":36
        },
        "bid":1217.2,
        "ask":1217.9,
        "indexPrice":1217.3,
        "openInterest":{
            "instrument":"BTCUSD7J14",
            "btc":2.30003528,
            "qty":28
        }
    },
    "BTCUSD":{
        "aggregate":true,
        "vol24H":{
            "btc":2.95598808,
            "qty":36
        },
        "openInterest":{
            "btc":5.65995163,
            "qty":68
        },
        "indexPrice":1217.3
    }
}
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
        "FEEETH": {
            "symbol": "FEEETH",
            "address": "0x1dF65ad4e59391116C5b155723682ea0CEc68A86",
            "name": "FEE/ETH",
            "decimals": 9,
            "reward": -2500,
            "commission": 10000,
            "instrument_status": "active",
            "ticksize": 6,
            "ticksperpoint": 1000000,
            "significantEtherDigits": 6,
            "significantTokenDigits": 1,
            "quoted_asset": "LEV",
            "quoted_asset_address": "0x1dF65ad4e59391116C5b155723682ea0CEc68A86",
            "base_asset": "ETH",
            "base_asset_address": "0x0000000000000000000000000000000000000000"
        },
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
        "FEEETH": {
            "symbol": "FEEETH",
            "address": "0x1dF65ad4e59391116C5b155723682ea0CEc68A86",
            "name": "FEE/ETH",
            "decimals": 9,
            "reward": -2500,
            "commission": 10000,
            "instrument_status": "active",
            "ticksize": 6,
            "ticksperpoint": 1000000,
            "significantEtherDigits": 6,
            "significantTokenDigits": 1,
            "quoted_asset": "LEV",
            "quoted_asset_address": "0x1dF65ad4e59391116C5b155723682ea0CEc68A86",
            "base_asset": "ETH",
            "base_asset_address": "0x0000000000000000000000000000000000000000"
        },
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
        "FEE": {
            "name": "FEE",
            "address": "0x1dF65ad4e59391116C5b155723682ea0CEc68A86",
            "symbol": "FEE",
            "decimals": 9,
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
    },
    {
        "date": 1529697413,
        "price": 0.00016,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697408,
        "price": 0.000166,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697383,
        "price": 0.000157,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697383,
        "price": 0.000148,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697378,
        "price": 0.000124,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697318,
        "price": 0.000124,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697293,
        "price": 0.000178,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697258,
        "price": 0.000141,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697168,
        "price": 0.000141,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697108,
        "price": 0.000158,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529697083,
        "price": 0.000157,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696993,
        "price": 0.000152,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696903,
        "price": 0.000159,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696903,
        "price": 0.000168,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696903,
        "price": 0.000171,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696838,
        "price": 0.000159,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696778,
        "price": 0.000156,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696748,
        "price": 0.000156,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696718,
        "price": 0.000156,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696688,
        "price": 0.000162,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696658,
        "price": 0.000162,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696628,
        "price": 0.000164,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696598,
        "price": 0.000164,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696568,
        "price": 0.000164,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696508,
        "price": 0.000162,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696478,
        "price": 0.000177,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696448,
        "price": 0.000177,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696418,
        "price": 0.00018,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696388,
        "price": 0.00018,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696358,
        "price": 0.00018,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696238,
        "price": 0.000177,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696208,
        "price": 0.000176,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696118,
        "price": 0.000142,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529696034,
        "price": 0.000157,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695998,
        "price": 0.000147,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695973,
        "price": 0.000152,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695973,
        "price": 0.000161,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695968,
        "price": 0.000161,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695938,
        "price": 0.000157,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695908,
        "price": 0.000157,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695818,
        "price": 0.000157,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695788,
        "price": 0.000165,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695763,
        "price": 0.000172,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695728,
        "price": 0.000165,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695668,
        "price": 0.000165,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695608,
        "price": 0.000147,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695553,
        "price": 0.000143,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695523,
        "price": 0.000123,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695463,
        "price": 0.000169,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695428,
        "price": 0.00013,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695368,
        "price": 0.00013,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695343,
        "price": 0.000158,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695313,
        "price": 0.000139,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695313,
        "price": 0.000141,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695283,
        "price": 0.000175,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695283,
        "price": 0.000173,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695283,
        "price": 0.000172,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695278,
        "price": 0.000147,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695253,
        "price": 0.000139,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695253,
        "price": 0.000133,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529695008,
        "price": 0.000103,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694888,
        "price": 0.000124,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694858,
        "price": 0.000119,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694798,
        "price": 0.000119,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694768,
        "price": 0.000114,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694738,
        "price": 0.000119,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694498,
        "price": 0.00015,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694408,
        "price": 0.00015,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694378,
        "price": 0.000158,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694318,
        "price": 0.000158,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694288,
        "price": 0.000158,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694263,
        "price": 0.000171,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694258,
        "price": 0.000172,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694228,
        "price": 0.000172,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694198,
        "price": 0.000172,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694138,
        "price": 0.000176,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694083,
        "price": 0.000107,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694083,
        "price": 0.000149,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529694018,
        "price": 0.000176,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693963,
        "price": 0.000143,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693963,
        "price": 0.000166,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693958,
        "price": 0.000166,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693933,
        "price": 0.000174,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693808,
        "price": 0.000166,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693778,
        "price": 0.000166,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693753,
        "price": 0.000175,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693718,
        "price": 0.000165,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693663,
        "price": 0.000126,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693663,
        "price": 0.000113,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693598,
        "price": 0.000165,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693568,
        "price": 0.000165,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693538,
        "price": 0.000165,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693508,
        "price": 0.000111,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693453,
        "price": 0.000126,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693453,
        "price": 0.000135,
        "volume": 0.1,
        "instrument": "LEVETH"
    },
    {
        "date": 1529693418,
        "price": 0.000158,
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
    },
    {
        "v": 0.6000000000000001,
        "s": 0.0000843,
        "t": 1529703300,
        "o": 0.000158,
        "h": 0.000162,
        "l": 0.000118,
        "c": 0.000162,
        "instrument": "LEVETH"
    },
    {
        "v": 0.8,
        "s": 0.0001239,
        "t": 1529703000,
        "o": 0.00016,
        "h": 0.000181,
        "l": 0.000134,
        "c": 0.000134,
        "instrument": "LEVETH"
    },
    {
        "v": 0.9,
        "s": 0.00013240000000000002,
        "t": 1529702700,
        "o": 0.000108,
        "h": 0.000177,
        "l": 0.0001,
        "c": 0.00016,
        "instrument": "LEVETH"
    },
    {
        "v": 0.7000000000000001,
        "s": 0.0000823,
        "t": 1529702400,
        "o": 0.000128,
        "h": 0.000143,
        "l": 0.0001,
        "c": 0.000111,
        "instrument": "LEVETH"
    },
    {
        "v": 0.4,
        "s": 0.0000473,
        "t": 1529702100,
        "o": 0.000125,
        "h": 0.000134,
        "l": 0.000101,
        "c": 0.000113,
        "instrument": "LEVETH"
    },
    {
        "v": 0.8999999999999999,
        "s": 0.0001377,
        "t": 1529701800,
        "o": 0.00018,
        "h": 0.00018,
        "l": 0.000136,
        "c": 0.000136,
        "instrument": "LEVETH"
    },
    {
        "v": 0.5,
        "s": 0.00006620000000000001,
        "t": 1529701500,
        "o": 0.000107,
        "h": 0.000172,
        "l": 0.000104,
        "c": 0.000172,
        "instrument": "LEVETH"
    },
    {
        "v": 0.6,
        "s": 0.0000652,
        "t": 1529701200,
        "o": 0.000103,
        "h": 0.000118,
        "l": 0.000103,
        "c": 0.000107,
        "instrument": "LEVETH"
    },
    {
        "v": 0.7000000000000001,
        "s": 0.0000871,
        "t": 1529700900,
        "o": 0.000127,
        "h": 0.00013,
        "l": 0.000107,
        "c": 0.000125,
        "instrument": "LEVETH"
    },
    {
        "v": 0.8,
        "s": 0.0001051,
        "t": 1529700600,
        "o": 0.000181,
        "h": 0.000181,
        "l": 0.000107,
        "c": 0.000107,
        "instrument": "LEVETH"
    },
    {
        "v": 0.7000000000000001,
        "s": 0.00012330000000000002,
        "t": 1529700300,
        "o": 0.000183,
        "h": 0.000184,
        "l": 0.000163,
        "c": 0.000181,
        "instrument": "LEVETH"
    },
    {
        "v": 0.8,
        "s": 0.0001155,
        "t": 1529700000,
        "o": 0.000119,
        "h": 0.000184,
        "l": 0.000103,
        "c": 0.000183,
        "instrument": "LEVETH"
    },
    {
        "v": 0.30000000000000004,
        "s": 0.0000343,
        "t": 1529699700,
        "o": 0.000103,
        "h": 0.00012,
        "l": 0.000103,
        "c": 0.00012,
        "instrument": "LEVETH"
    },
    {
        "v": 0.7,
        "s": 0.0001077,
        "t": 1529699400,
        "o": 0.000153,
        "h": 0.00017,
        "l": 0.000141,
        "c": 0.00017,
        "instrument": "LEVETH"
    },
    {
        "v": 0.5,
        "s": 0.0000725,
        "t": 1529699100,
        "o": 0.000133,
        "h": 0.000179,
        "l": 0.000133,
        "c": 0.000139,
        "instrument": "LEVETH"
    },
    {
        "v": 1.1,
        "s": 0.000167,
        "t": 1529698800,
        "o": 0.000143,
        "h": 0.000176,
        "l": 0.000118,
        "c": 0.000133,
        "instrument": "LEVETH"
    },
    {
        "v": 0.4,
        "s": 0.0000644,
        "t": 1529698500,
        "o": 0.000176,
        "h": 0.000176,
        "l": 0.000156,
        "c": 0.000156,
        "instrument": "LEVETH"
    },
    {
        "v": 0.8,
        "s": 0.00013739999999999998,
        "t": 1529698200,
        "o": 0.000149,
        "h": 0.000181,
        "l": 0.000149,
        "c": 0.000163,
        "instrument": "LEVETH"
    },
    {
        "v": 0.4,
        "s": 0.000058399999999999997,
        "t": 1529697900,
        "o": 0.000143,
        "h": 0.000149,
        "l": 0.000143,
        "c": 0.000149,
        "instrument": "LEVETH"
    },
    {
        "v": 0.7999999999999999,
        "s": 0.00011619999999999999,
        "t": 1529697600,
        "o": 0.000124,
        "h": 0.000166,
        "l": 0.000124,
        "c": 0.000145,
        "instrument": "LEVETH"
    },
    {
        "v": 0.5,
        "s": 0.0000775,
        "t": 1529697300,
        "o": 0.000152,
        "h": 0.000178,
        "l": 0.000141,
        "c": 0.000178,
        "instrument": "LEVETH"
    },
    {
        "v": 0.8,
        "s": 0.0001277,
        "t": 1529697000,
        "o": 0.000156,
        "h": 0.000171,
        "l": 0.000152,
        "c": 0.000152,
        "instrument": "LEVETH"
    },
    {
        "v": 0.8999999999999999,
        "s": 0.0001512,
        "t": 1529696700,
        "o": 0.00018,
        "h": 0.00018,
        "l": 0.000162,
        "c": 0.000162,
        "instrument": "LEVETH"
    },
    {
        "v": 0.5,
        "s": 0.00008549999999999999,
        "t": 1529696400,
        "o": 0.000142,
        "h": 0.00018,
        "l": 0.000142,
        "c": 0.00018,
        "instrument": "LEVETH"
    },
    {
        "v": 0.8,
        "s": 0.0001249,
        "t": 1529696100,
        "o": 0.000157,
        "h": 0.000161,
        "l": 0.000147,
        "c": 0.000157,
        "instrument": "LEVETH"
    },
    {
        "v": 0.7,
        "s": 0.00010800000000000001,
        "t": 1529695800,
        "o": 0.000123,
        "h": 0.000172,
        "l": 0.000123,
        "c": 0.000165,
        "instrument": "LEVETH"
    },
    {
        "v": 1.2000000000000002,
        "s": 0.0001806,
        "t": 1529695500,
        "o": 0.000133,
        "h": 0.000175,
        "l": 0.00013,
        "c": 0.000169,
        "instrument": "LEVETH"
    },
    {
        "v": 0.1,
        "s": 0.0000103,
        "t": 1529695200,
        "o": 0.000124,
        "h": 0.000124,
        "l": 0.000103,
        "c": 0.000103,
        "instrument": "LEVETH"
    },
    {
        "v": 0.5,
        "s": 0.000059499999999999996,
        "t": 1529694900,
        "o": 0.00015,
        "h": 0.00015,
        "l": 0.000114,
        "c": 0.000124,
        "instrument": "LEVETH"
    },
    {
        "v": 0.4,
        "s": 0.0000616,
        "t": 1529694600,
        "o": 0.000158,
        "h": 0.000158,
        "l": 0.00015,
        "c": 0.00015,
        "instrument": "LEVETH"
    },
    {
        "v": 0.9000000000000001,
        "s": 0.0001453,
        "t": 1529694300,
        "o": 0.000176,
        "h": 0.000176,
        "l": 0.000107,
        "c": 0.000158,
        "instrument": "LEVETH"
    },
    {
        "v": 0.8,
        "s": 0.0001321,
        "t": 1529694000,
        "o": 0.000165,
        "h": 0.000175,
        "l": 0.000143,
        "c": 0.000143,
        "instrument": "LEVETH"
    },
    {
        "v": 0.9000000000000001,
        "s": 0.00012639999999999998,
        "t": 1529693700,
        "o": 0.000158,
        "h": 0.000165,
        "l": 0.000111,
        "c": 0.000126,
        "instrument": "LEVETH"
    },
    {
        "v": 0.6000000000000001,
        "s": 0.000079,
        "t": 1529693400,
        "o": 0.000148,
        "h": 0.000148,
        "l": 0.000116,
        "c": 0.000116,
        "instrument": "LEVETH"
    },
    {
        "v": 0.7000000000000001,
        "s": 0.0000983,
        "t": 1529693100,
        "o": 0.000111,
        "h": 0.000158,
        "l": 0.000111,
        "c": 0.000148,
        "instrument": "LEVETH"
    },
    {
        "v": 0.5,
        "s": 0.0000594,
        "t": 1529692800,
        "o": 0.000111,
        "h": 0.000123,
        "l": 0.000111,
        "c": 0.00012,
        "instrument": "LEVETH"
    },
    {
        "v": 0.30000000000000004,
        "s": 0.000039399999999999995,
        "t": 1529692500,
        "o": 0.00014,
        "h": 0.00014,
        "l": 0.000114,
        "c": 0.000114,
        "instrument": "LEVETH"
    },
    {
        "v": 1,
        "s": 0.0001351,
        "t": 1529692200,
        "o": 0.000131,
        "h": 0.000152,
        "l": 0.000112,
        "c": 0.00014,
        "instrument": "LEVETH"
    },
    {
        "v": 1,
        "s": 0.00014340000000000002,
        "t": 1529691900,
        "o": 0.000143,
        "h": 0.000156,
        "l": 0.000136,
        "c": 0.000136,
        "instrument": "LEVETH"
    },
    {
        "v": 0.7,
        "s": 0.0000988,
        "t": 1529691600,
        "o": 0.000136,
        "h": 0.000158,
        "l": 0.000136,
        "c": 0.000143,
        "instrument": "LEVETH"
    },
    {
        "v": 0.2,
        "s": 0.000029199999999999998,
        "t": 1529691300,
        "o": 0.00015,
        "h": 0.00015,
        "l": 0.000142,
        "c": 0.000142,
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
        },
        {
            "price": 0.000095,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000092,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000089,
            "numberOfOrders": 2,
            "totalQuantity": 0.2,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000088,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000079,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000073,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000072,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000067,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000065,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000059,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000055,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000051,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000046,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000042,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.00004,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000039,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000036,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000034,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.00003,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000027,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000026,
            "numberOfOrders": 2,
            "totalQuantity": 0.4,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000015,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000013,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000011,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000004,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
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
        },
        {
            "price": 0.000188,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.00019,
            "numberOfOrders": 2,
            "totalQuantity": 0.6,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000191,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.0002,
            "numberOfOrders": 2,
            "totalQuantity": 0.4,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000205,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000208,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.00021,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000211,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000213,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000215,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000216,
            "numberOfOrders": 1,
            "totalQuantity": 0.3,
            "instrument": "LEVETH"
        },
        {
            "price": 0.000217,
            "numberOfOrders": 1,
            "totalQuantity": 0.1,
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
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1480957451447
```

### 200 OK
```json
[
    {
        "clientid":"de12c110-c616-11e6-8cd0-fbf50c0d0231",
        "marginPerQty":27815,
        "stopPrice":2,
        "eventTime":1492903310910487,
        "uuid":"76d015e0-27b2-11e7-8df2-8467e413f756",
        "instrument":"BTCUSD7J28",
        "orderType":"LMT",
        "filled":0,
        "status":"open",
        "normalizedPrice":8326395,
        "price":1201,
        "entryTime":1492904077170872,
        "targetPrice":3,
        "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
        "cancelled":0,
        "averagePrice":0,
        "side":"buy",
        "quantity":10
    }
]
```
<a name="open-order-id"></a>
## Get open order by id
### GET /order/:uuid
```http
GET /api/v1/order/a5ab5320-27b2-11e7-96d8-d4ff6da48147 HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:7c3fa2fb0702bf1e4f9a94ca6c48cc250d95e078b42c339307096fbe679e2c84
Nonce: 1481655922696
```
### 200 OK
```json
[
    {
        "clientid":"de12c110-c616-11e6-8cd0-fbf50c0d0231",
        "marginPerQty":119512,
        "stopPrice":15,
        "eventTime":1492903389522334,
        "uuid":"a5ab5320-27b2-11e7-96d8-d4ff6da48147",
        "instrument":"BTCUSD7J28",
        "orderType":"LMT",
        "filled":0,
        "status":"open",
        "normalizedPrice":8325008,
        "price":1201.2,
        "entryTime":1492903389522334,
        "crossMargin":true,
        "targetPrice":3,
        "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
        "cancelled":0,
        "averagePrice":0,
        "side":"buy",
        "quantity":10
    }
]
```

<a name="open-create-order"></a>
## Create New Order
### POST /order
```http
POST /api/v1/order HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj:0ec8dce463f49532b2a32a2ae2ffadb9c1d637e3654c6b32f1773ddcc47f8819
Nonce: 1481655922696
```
```json
[
    {
        "orderType":"LMT",
        "price":1201.2,
        "clientid":"de12c110-c616-11e6-8cd0-fbf50c0d0231",
        "instrument":"BTCUSDW",
        "crossMargin":false,
        "side":"buy",
        "quantity":10
    }
]
```
### 200 OK
```json
[
    {
        "clientid":"de12c110-c616-11e6-8cd0-fbf50c0d0231",
        "marginPerQty":27815,
        "stopPrice":2,
        "eventTime":1492903397870121,
        "uuid":"aaa4f9d0-27b2-11e7-ae2c-bbcdf5153f0d",
        "instrument":"BTCUSD7J28",
        "orderType":"LMT",
        "filled":0,
        "status":"open",
        "normalizedPrice":8325008,
        "price":1201.2,
        "entryTime":1492903397870121,
        "crossMargin":false,
        "targetPrice":3,
        "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
        "cancelled":0,
        "averagePrice":0,
        "side":"buy",
        "quantity":10
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
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:26751dd64f75523257a3aeda5f2d59e68f4322500bcbc4beaa8ad27754ddd62b
Nonce: 1482348434637
```
```json
[
    {
       "uuid":"503eb8a0-c7b3-11e6-a1d4-539d1cb6cbbc",
       "price":814.8
    }
]
```
### 200 OK
```json
[
   {
      "uuid":"503eb8a0-c7b3-11e6-a1d4-539d1cb6cbbc",
      "userid":          "mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd",
      "side":"sell",
      "quantity":        1,
      "filled":          0,
      "cancelled":       0,
      "price":814.8,
      "averagePrice":    0,
      "entryTime":1482348434328077,
      "eventTime":1482348364074468,
      "status":          "open",
      "entryOrder":{
         "50192f40-c7b3-11e6-ba51-b8bd8cf25f84":1
      },
      "orderType":"STP",
      "stopPrice":7.2,
      "targetPrice":     "NONE",
      "instrument":      "BTCUSDW",
      "oco":"503eb8a1-c7b3-11e6-bbb6-4029c20f8e39",
      "maxStop":814,
      "entryPrice":822.3,
      "entryAmount":822.3,
      "commission":10000,
      "reward":          -2500,
      "cushion":         1,
      "reservedTicks":   2,
      "crossMargin":     false
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
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:fbe7496da2d6f82657d15ad2bf997ca778704f814d8e4601159f4a5519d885e4
Nonce: 1482347623909
```
### 200 OK
```json
[
   "adcb4c70-b72a-11e6-9b68-be1cfc0a27e0",
   "50192f40-c7b3-11e6-ba51-b8bd8cf25f84"
]
```

<a name="open-patch-order"></a>
## Combined create/update/cancel

The PATCH method uses the syntax for [RFC6902](https://tools.ietf.org/html/rfc6902). In addition to the standard ops, we have added `merge` and `split` for position management

|PATCH op|Order operation|
|---|---|
|add|Create new order|
|remove|Delete order|
|replace|Update order|
|split|Split position|
|merge|Merge positions

### PATCH /order
```http
PATCH /api/v1/order HTTP/1.1
Accept: application/json
Host: live.coinpit.me
Authorization: HMAC mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd:0d83676173fe248c8a765d86a551e827e1afe7749a688a836e957a7fde510d69
Nonce: 1482349148300
```
```json
[
   {
      "op":"remove",
      "value": ["0d71f940-c7b5-11e6-9906-9cd1c95275e5"]
   },
   {
       "op":"replace",
       "value":[
           {
               "uuid":"76d015e0-27b2-11e7-8df2-8467e413f756",
               "price":1100
           }
       ]
   },
   {
       "op":    "add",
       "value": [
         {
           "instrument": "BTCUSDW",
           "side":        "buy",
           "quantity":    1,
           "price":       1035.3,
           "orderType":   "LMT",
           "clientid":    "b825ce03-fb16-4fd7-8fbe-e225803509a4",
           "stopPrice":   4.2,
           "crossMargin": false,
           "targetPrice": "NONE",
           "postOnly":    false
         }
       ]
   }
]
```
### 200 OK
```json
[
  {
    "op": "remove",
    "statusCode": 200,
    "response": [
       "19b3a371-c7b5-11e6-a305-6ee5416bea55"
     ]
   },
  {
    "op": "replace",
    "statusCode": 200,
    "response": [
      {
        "clientid": "de12c110-c616-11e6-8cd0-fbf50c0d0231",
        "marginPerQty": 27815,
        "stopPrice": 2,
        "eventTime": 1492903310910487,
        "uuid": "76d015e0-27b2-11e7-8df2-8467e413f756",
        "instrument": "BTCUSD7J28",
        "orderType": "LMT",
        "commission": 0.0005,
        "entryOrder": {},
        "filled": 0,
        "status": "open",
        "normalizedPrice": 9090909,
        "price": 1100,
        "entryTime": 1492922049174770,
        "cushion": 2,
        "targetPrice": 3,
        "reservedTicks": 2,
        "userid": "mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
        "cancelled": 0,
        "reward": 0,
        "averagePrice": 0,
        "side": "buy",
        "quantity": 10
          }
      ]
   },
  {
    "op": "add",
    "statusCode": 200,
    "response": [
      {
        "uuid": "16f9fe70-f6d8-11e6-ad01-e5a16988c694",
        "userid": "mfxWFDho5Aa2TTnxKRZNRgBED6GP8C9gDd",
        "side": "buy",
        "quantity": 1,
        "filled": 0,
        "cancelled": 0,
        "price": 1035.3,
        "normalizedPrice": 1035.3,
        "averagePrice": 0,
        "entryTime": 1487531864023840,
        "eventTime": 1487531864023840,
        "status": "open",
        "entryOrder": {},
        "orderType": "LMT",
        "stopPrice": 4.2,
        "targetPrice": "NONE",
        "clientid": "b825ce03-fb16-4fd7-8fbe-e225803509a4",
        "instrument": "BTCUSDW",
        "commission": 20000,
        "reward": -2500,
        "cushion": 1,
        "reservedTicks": 2,
        "crossMargin": false
         }
      ]
   }
]
```

### Using PATCH to merge positions
To merge positions, send both target and stop orders. They will be replaced with new stop and target orders that represent the merged positions.

```http
PATCH https://live.coinpit.me/api/v1/order HTTP/1.1
Nonce: 1493072997331
Host: live.coinpit.me
Accept: application/json
Authorization: HMAC mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj:68cd2d30a15e1ac140cdcb335ce9e9e922ea1af573ab0f19728cd9e8a4e9d839
```
```json
[
  {
    "value": [
            "6f5d5160-293d-11e7-99a0-55b28e36f889",
            "6d74bb40-293d-11e7-bbbe-3aa4c229b3fd"
        ],
    "op": "merge"
    }
]
```
### 200 OK
```json
[
    {
        "statusCode":200,
        "response":{
            "removed":[
                "6f5d5160-293d-11e7-99a0-55b28e36f889",
                "6f5d7870-293d-11e7-9d90-39954eec9913",
                "6d74bb40-293d-11e7-bbbe-3aa4c229b3fd",
                "6d74e250-293d-11e7-8f0b-615850a8fdc3"
            ],
            "added":[
                {
                    "entryOrder":{},
                    "normalizedEntryPrice":7923302,
                    "stopPrice":2,
                    "eventTime":1493072997157693,
                    "entryAmount":158477972,
                    "uuid":"8bb29550-293d-11e7-b2cd-49c1c6dde9fb",
                    "oco":"8bb44300-293d-11e7-a7d6-d6ba1ddb48bc",
                    "commission":null,
                    "orderType":"STP",
                    "instrument":"BTCUSD7J28",
                    "maxStop":1251.1,
                    "normalizedMaxStop":7992966,
                    "filled":0,
                    "status":"open",
                    "entryPrice":1262.1,
                    "normalizedPrice":7980209,
                    "price":1253.1,
                    "entryTime":1493072997157693,
                    "executionPrice":0,
                    "crossMargin":false,
                    "targetPrice":3,
                    "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
                    "cancelled":0,
                    "reward":null,
                    "averagePrice":0,
                    "side":"sell",
                    "quantity":20
                },
                {
                    "normalizedEntryPrice":7923302,
                    "stopPrice":2,
                    "eventTime":1493072997168228,
                    "executionPrice":0,
                    "uuid":"8bb44300-293d-11e7-a7d6-d6ba1ddb48bc",
                    "oco":"8bb29550-293d-11e7-b2cd-49c1c6dde9fb",
                    "commission":null,
                    "orderType":"TGT",
                    "instrument":"BTCUSD7J28",
                    "entryOrder":{},
                    "filled":0,
                    "status":"open",
                    "entryPrice":1262.1,
                    "normalizedPrice":7904513,
                    "price":1265.1,
                    "entryTime":1493072997168228,
                    "entryAmount":158477972,
                    "crossMargin":false,
                    "targetPrice":3,
                    "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
                    "cancelled":0,
                    "reward":null,
                    "averagePrice":0,
                    "side":"sell",
                    "quantity":20
                }
            ]
        },
        "op":"merge"
    }
]
```
### Using PATCH to split a position
Send the UUID of the stop order representing the position to be split and the quantity to be split off.

```http
PATCH https://live.coinpit.me/api/v1/order HTTP/1.1
Nonce: 1493073253043
Host: live.coinpit.me
Accept: application/json
Authorization: HMAC mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj:db6e359ae9adc4c8aa17487d539082b5a6ced147dd81e83180210a388b2d3657
```
```json
[
    {
        "quantity":10,
        "value":[
            "8bb29550-293d-11e7-b2cd-49c1c6dde9fb"
        ],
        "op":"split"
    }
]
```
### 200 OK
```json
[
    {
        "statusCode":200,
        "response":[
            {
                "entryOrder":{},
                "normalizedEntryPrice":7923930,
                "stopPrice":2,
                "eventTime":1493072997157693,
                "entryAmount":79244952,
                "uuid":"8bb29550-293d-11e7-b2cd-49c1c6dde9fb",
                "oco":"8bb44300-293d-11e7-a7d6-d6ba1ddb48bc",
                "commission":null,
                "orderType":"STP",
                "instrument":"BTCUSD7J28",
                "maxStop":1251.1,
                "normalizedMaxStop":7992966,
                "filled":0,
                "status":"open",
                "entryPrice":1262,
                "normalizedPrice":7980209,
                "price":1253.1,
                "entryTime":1493072997157693,
                "executionPrice":0,
                "crossMargin":false,
                "targetPrice":3,
                "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
                "cancelled":10,
                "reward":null,
                "averagePrice":0,
                "side":"sell",
                "quantity":20
            },
            {
                "normalizedEntryPrice":7923930,
                "stopPrice":2,
                "eventTime":1493072997168228,
                "executionPrice":0,
                "uuid":"8bb44300-293d-11e7-a7d6-d6ba1ddb48bc",
                "oco":"8bb29550-293d-11e7-b2cd-49c1c6dde9fb",
                "commission":null,
                "orderType":"TGT",
                "instrument":"BTCUSD7J28",
                "entryOrder":{},
                "filled":0,
                "status":"open",
                "entryPrice":1262,
                "normalizedPrice":7904513,
                "price":1265.1,
                "entryTime":1493072997168228,
                "entryAmount":79244952,
                "crossMargin":false,
                "targetPrice":3,
                "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
                "cancelled":10,
                "reward":null,
                "averagePrice":0,
                "side":"sell",
                "quantity":20
            },
            {
                "entryOrder":{},
                "normalizedEntryPrice":7922675,
                "stopPrice":2,
                "eventTime":1493072997157693,
                "entryAmount":79233020,
                "uuid":"241dbf90-293e-11e7-9093-9cf21d0dd434",
                "oco":"241e0db0-293e-11e7-bfe1-d12137b73cf6",
                "commission":null,
                "orderType":"STP",
                "instrument":"BTCUSD7J28",
                "maxStop":1251.1,
                "normalizedMaxStop":7992966,
                "filled":0,
                "status":"open",
                "entryPrice":1262.2,
                "normalizedPrice":7980209,
                "price":1253.1,
                "entryTime":1493072997157693,
                "executionPrice":0,
                "crossMargin":false,
                "targetPrice":3,
                "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
                "cancelled":0,
                "reward":null,
                "averagePrice":0,
                "side":"sell",
                "quantity":10
            },
            {
                "normalizedEntryPrice":7922675,
                "stopPrice":2,
                "eventTime":1493072997168228,
                "executionPrice":0,
                "uuid":"241e0db0-293e-11e7-bfe1-d12137b73cf6",
                "oco":"241dbf90-293e-11e7-9093-9cf21d0dd434",
                "commission":null,
                "orderType":"TGT",
                "instrument":"BTCUSD7J28",
                "entryOrder":{},
                "filled":0,
                "status":"open",
                "entryPrice":1262.2,
                "normalizedPrice":7904513,
                "price":1265.1,
                "entryTime":1493072997168228,
                "entryAmount":79233020,
                "crossMargin":false,
                "targetPrice":3,
                "userid":"mx5YeJZSJbrENq24PLzW8BYHUxJb48Ttfj",
                "cancelled":0,
                "reward":null,
                "averagePrice":0,
                "side":"sell",
                "quantity":10
            }
        ],
        "op":"split"
    }
]
```
<a name="contract-order-id"></a>
## Specific order for a contract
### GET /contract/:symbol/order/:uuid
```http
GET /api/v1/contract/BTCUSDW/order/ec9a2f00-27de-11e7-a957-c11c2594f049 HTTP/1.1
Accept: application/json
Host: live.coinpit.me
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
Host: live.coinpit.me
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
Host: live.coinpit.me
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
Host: live.coinpit.me
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
Host: live.coinpit.me
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
Host: live.coinpit.me
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
Host: live.coinpit.me
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
Host: live.coinpit.me
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
