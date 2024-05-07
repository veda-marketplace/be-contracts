// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {AnnotationAPICaller} from "../src/AnnotationAPICaller.sol";

contract AnnotationAPICallerTest is Test {
    AnnotationAPICaller public caller;

    bytes32 constant NULL_BYTES32 = keccak256(abi.encodePacked(""));

    function setUp() public {
        caller = new AnnotationAPICaller(
            0x6090149792dAAeE9D1D568c9f9a6F6B46AA29eFD, //sepolia testnet
            'ca98366cc7314957b8c012c72f05aeeb',
            300000,
            0x779877A7B0D9E8603169DdbD7836e478b4624789
        );
    }

    function test_requestData() public {
        string[] memory args = new string[](1);
        args[0] = "0x05";
        bytes32 requestId = caller.requestData(
            "https://be-analytics-api-gl5bbi32cq-ts.a.run.app/api/identify/QmTHcV6mGxHGeeXCnYtV129eRiR8Exni4sT8dDikBWBgzY"
        );
        assertNotEq(requestId, NULL_BYTES32);
    }
}
