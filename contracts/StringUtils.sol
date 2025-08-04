// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

library StringUtils {
    function isEmpty(string memory str) internal pure returns (bool) {
        return bytes(str).length == 0;
    }
}
