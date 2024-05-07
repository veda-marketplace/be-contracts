// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@chainlink/contracts/v0.8/ChainlinkClient.sol";
import {ConfirmedOwner} from "@chainlink/contracts/v0.8/shared/access/ConfirmedOwner.sol";
import {LinkTokenInterface} from "@chainlink/contracts/v0.8/shared/interfaces/LinkTokenInterface.sol";

contract APICaller is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 public result;

    address private oracle;
    bytes32 private jobId;
    uint256 private fee;

    /**
     * @notice Initialize the link token and target oracle
     */
    constructor(address _oracle, bytes32 _jobId, uint256 _fee, address _link) ConfirmedOwner(msg.sender) {
        _setChainlinkToken(_link);
        _setChainlinkOracle(_oracle);
        jobId = _jobId;
        fee = _fee; // Fee is in LINK
    }

    /**
     * Create a Chainlink request to retrieve API response, find the target data
     */
    function requestData(string memory _url) public returns (bytes32 requestId) {
        Chainlink.Request memory request = _buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        request._add("get", _url);
        request._add("path", "result");
        return _sendChainlinkRequest(request, fee);
    }

    /**
     * Receive the response in the form of uint256
     */
    function fulfill(bytes32 _requestId, uint256 _result) public recordChainlinkFulfillment(_requestId) {
        result = _result;
    }

    /**
     * Allow withdraw of Link tokens from the contract
     */
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(_chainlinkTokenAddress());
        require(link.transfer(msg.sender, link.balanceOf(address(this))), "Unable to transfer");
    }
}
