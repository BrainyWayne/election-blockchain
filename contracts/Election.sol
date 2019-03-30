pragma solidity ^0.5.0;

contract Election {
    //Modelling a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //Associative array for ccounts that have voted
    mapping (uint => bool) public voters;

    //Associative array for candidates
    mapping(uint => Candidate) public candidates;

    //Store count of candidates
    uint public candidateCount;

    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    //Add new candidate
    function addCandidate(string memory _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }

    //Trigger event when vote is casted
    event votedEvent (
        uint indexed _candidateId
    );

    //Vote Casting
    function vote(uint _candidateId) public {
        //Check if voter hasn't aleady voted
        require(!voters[uint256(msg.sender)]);

        //Check whether the candidateId is valid
        require(_candidateId > 0 && _candidateId <= candidateCount);

        voters[uint256(msg.sender)] = true;

        candidates[_candidateId].voteCount++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }
}