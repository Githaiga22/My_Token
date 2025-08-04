// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./StringUtils.sol";

contract CheckString {
    using StringUtils for string;

    function checkIfEmpty(string memory str) public pure returns (string memory) {
        if (str.isEmpty()) {
            return "The string is empty.";
        } else {
            return "The string is NOT empty.";
        }
    }
}
