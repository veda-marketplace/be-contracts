// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/CopyrightAPICaller.sol";

contract CopyrightAPICallerScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        bytes32 _dontID = vm.envBytes32("CHAINLINK_DONT_ID");
        address _router = vm.envAddress("CHAINLINK_ROUTER");
        
        CopyrightAPICaller caller = new CopyrightAPICaller(_dontID, _router);
        
        vm.stopBroadcast();
    }
}
