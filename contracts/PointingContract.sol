//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

interface IPointingContract{
    function addPoint(uint _point) external;
    function getPoint(address _user) external view returns (uint);
}

contract PointingContract{
    uint public point;

    mapping(address => uint) userPoints;

    function addPoint(uint _point) public {
        require(_point > 0, "Point must be greater than 0");
        userPoints[msg.sender] += _point;
    }

    function getPoint(address _user) public view returns (uint) {
        return userPoints[_user];
    }
}