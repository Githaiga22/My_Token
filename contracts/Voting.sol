// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./StringUtils.sol";

contract Voting {
    using StringUtils for string;

    address public owner;

    //  Custom Errors 
    error NotOwner();  //when an owner tries to add candidates
    error CandidateExists(string name);  //when a duplicate name is added
    error EmptyCandidateName(); //When someone tries to add a blank name
    error AlreadyVoted();
    error CandidateNotFound(string name);

    constructor() {
        owner = msg.sender;
    }

    struct Candidate {
        string name;
        uint voteCount;
    }

    string[] public candidateList;
    mapping(string => Candidate) public candidates;
    mapping(address => bool) public hasVoted;

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    function addCandidate(string memory _name) public onlyOwner {
        if (_name.isEmpty()) revert EmptyCandidateName();
        if (bytes(candidates[_name].name).length != 0) revert CandidateExists(_name);

        candidates[_name] = Candidate({name: _name, voteCount: 0});
        candidateList.push(_name);
    }

    function vote(string memory _name) public {
        if (hasVoted[msg.sender]) revert AlreadyVoted();
        if (bytes(candidates[_name].name).length == 0) revert CandidateNotFound(_name);

        candidates[_name].voteCount += 1;
        hasVoted[msg.sender] = true;
    }

    function getCandidateVotes(string memory _name) public view returns (uint) {
        if (bytes(candidates[_name].name).length == 0) revert CandidateNotFound(_name);
        return candidates[_name].voteCount;
    }

    function getAllCandidates() public view returns (string[] memory) {
        return candidateList;
    }
}
