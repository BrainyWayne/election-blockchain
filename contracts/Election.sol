pragma solidity ^0.5.0;

contract Election {
    //Modelling a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //Associative array for candidates
    mapping(uint => Candidate) public candidates;

    //Store count of candidates
    uint public candidateCount;

    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }
}