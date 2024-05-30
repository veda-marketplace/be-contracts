# avalanche fuji testnet

| contract name | location | Chainlink Function Subscription | Subscription ID |
|- |- | - | - |
| AnalyticsAPICaller| [0xF4B227ed6aC46371B880d280a782E1E2813e7CA2](https://testnet.snowtrace.io/address/0xF4B227ed6aC46371B880d280a782E1E2813e7CA2) | [9038](https://functions.chain.link/fuji/9038)
| CopyrightAPICaller| [0x7854F35413AF8e42b1633eB4244CD7d0528663E5](https://testnet.snowtrace.io/address/0x7854F35413AF8e42b1633eB4244CD7d0528663E5) | [9039](https://functions.chain.link/fuji/9039)

## how to deploy

> source .env.fuji

> forge create --rpc-url $RPC_URL --constructor-args $CHAINLINK_DON_ID $CHAINLINK_ROUTER --private-key $PRIVATE_KEY src/AnalyticsAPICaller.sol:AnalyticsAPICaller

> forge create --rpc-url $RPC_URL --constructor-args $CHAINLINK_DON_ID $CHAINLINK_ROUTER --private-key $PRIVATE_KEY src/CopyrightAPICaller.sol:CopyrightAPICaller

## how to verify

> source .env.fuji

> forge verify-contract 0xF4B227ed6aC46371B880d280a782E1E2813e7CA2 src/AnalyticsAPICaller.sol:AnalyticsAPICaller --verifier-url 'https://api.routescan.io/v2/network/testnet/evm/43113/etherscan' --etherscan-api-key "verifyContract" --num-of-optimizations 200 --compiler-version 0.8.25 --constructor-args $(cast abi-encode "constructor(bytes32, address)" $CHAINLINK_DON_ID $CHAINLINK_ROUTER)

> forge verify-contract 0x7854F35413AF8e42b1633eB4244CD7d0528663E5 src/CopyrightAPICaller.sol:CopyrightAPICaller --verifier-url 'https://api.routescan.io/v2/network/testnet/evm/43113/etherscan' --etherscan-api-key "verifyContract" --num-of-optimizations 200 --compiler-version 0.8.25 --constructor-args $(cast abi-encode "constructor(bytes32, address)" $CHAINLINK_DON_ID $CHAINLINK_ROUTER)

# polygon amoy testnet

| contract name | location |
|- |- |
| AnalyticsAPICaller| [0x80a1371d9e4B4ec269073eB7168c538287078f40](https://amoy.polygonscan.com/address/0x80a1371d9e4b4ec269073eb7168c538287078f40) | [269](https://functions.chain.link/polygon-amoy/269) |
| CopyrightAPICaller| [0x1437EA0b3985D37B8E0314bd4A51B56a0040353e](https://amoy.polygonscan.com/address/0x1437EA0b3985D37B8E0314bd4A51B56a0040353e) | [271](https://functions.chain.link/polygon-amoy/271) |

## how to deploy

> source .env.polygon

> forge create --rpc-url $RPC_URL --constructor-args $CHAINLINK_DON_ID $CHAINLINK_ROUTER --private-key $PRIVATE_KEY src/AnalyticsAPICaller.sol:AnalyticsAPICaller

> forge create --rpc-url $RPC_URL --constructor-args $CHAINLINK_DON_ID $CHAINLINK_ROUTER --private-key $PRIVATE_KEY src/CopyrightAPICaller.sol:CopyrightAPICaller

## how to verify

> source .env.polygon

> forge verify-contract 0xe0A7D1414aC8D0a9EEAA07c1F91c26D4896baC74 src/AnalyticsAPICaller.sol:AnalyticsAPICaller --verifier-url 'https://api-testnet.polygonscan.com/api/contract/verifysourcecode' --etherscan-api-key "verifyContract" --num-of-optimizations 200 --compiler-version 0.8.25 --constructor-args $(cast abi-encode "constructor(bytes32, address)" $CHAINLINK_DON_ID $CHAINLINK_ROUTER)

> forge verify-contract 0x1437EA0b3985D37B8E0314bd4A51B56a0040353e src/CopyrightAPICaller.sol:CopyrightAPICaller --verifier-url 'https://www.oklink.com/api/v5/explorer/AMOY_TESTNET/api/contract/verifysourcecode' --etherscan-api-key "verifyContract" --num-of-optimizations 200 --compiler-version 0.8.25 --constructor-args $(cast abi-encode "constructor(bytes32, address)" $CHAINLINK_DON_ID $CHAINLINK_ROUTER)
