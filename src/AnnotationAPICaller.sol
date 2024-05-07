// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@chainlink/contracts/v0.8/ChainlinkClient.sol";

contract AnnotationAPICaller is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    uint256 public result;

    address private oracle;
    bytes32 private jobId;
    uint256 private fee;

    constructor(address _oracle, bytes32 _jobId, uint256 _fee, address _link) {
        setChainlinkToken(_link);
        oracle = _oracle;
        jobId = _jobId;
        fee = _fee; // Fee is in LINK
    }

    function requestData(string memory _url) public returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        request.add("get", _url);
        request.add("path", "result");
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfill(bytes32 _requestId, uint256 _result) public recordChainlinkFulfillment(_requestId) {
        result = _result;
    }
}