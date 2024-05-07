// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/APICaller.sol";

contract MyScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address _oracle = vm.envAddress("CHAINLINK_ORACLE_ADDRESS");
        address _link = vm.envAddress("CHAINLINK_LINK_ADDRESS");
        bytes32 _jobId = vm.envBytes32("CHAINLINK_JOB_ID");
        uint256 _fee = vm.envUint("CHAINLINK_FEE");

        APICaller caller = new APICaller(_oracle, _jobId, _fee, _link);
        
        vm.stopBroadcast();
    }
}
