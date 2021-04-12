## Conference

A simple Ethereum smart contract and lightwallet example.


### Updates

Current code uses *Truffle v0.5.16*


### Install

Install [ganache-cli]

```
$ npm install -g ganache-cli
```

Install [truffle](https://github.com/consensys/truffle):

```
$ npm install -g truffle
```

If you don't have solc you can get it [here](https://github.com/ethereum/go-ethereum/wiki/Contract-Tutorial#using-an-online-compiler)

### Run

Run testrpc in one console window:

```
$ ganache-cli
```
In another console window run truffle from project root directory:

```
$ truffle compile
$ truffle migrate
$ truffle test
$ truffle serve // server at localhost:8080
```
