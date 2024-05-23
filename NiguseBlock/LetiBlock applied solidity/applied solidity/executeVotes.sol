// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
    }
    
    Proposal[] public proposals;

    mapping(uint => mapping(address => bool)) public votes;
    mapping(uint => mapping(address => bool)) public hasVoted;

    mapping(address => bool) public isMember;

    event ProposalCreated(uint proposalId);

    event VoteCast(uint proposalId, address voter);

    event ProposalExecuted(uint proposalId);

    constructor(address[] memory members) {
        isMember[msg.sender] = true;

        for (uint i = 0; i < members.length; i++) {
            isMember[members[i]] = true;
        }
    }

    modifier onlyMember() {
        require(isMember[msg.sender], "Not an allowed member");
        _;
    }

    function newProposal(address _target, bytes calldata _data) external onlyMember {
        Proposal memory proposal = Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0,
            executed: false
        });
        proposals.push(proposal);

        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool support) external onlyMember {
        require(proposalId < proposals.length, "Invalid proposalId");

        Proposal storage proposal = proposals[proposalId];

        require(!proposal.executed, "Proposal already executed");

        if (hasVoted[proposalId][msg.sender]) {
            // Get the previous vote
            bool previousVote = votes[proposalId][msg.sender];

            if (previousVote != support) {
                if (previousVote) {
                    proposal.yesCount--;
                } else {
                    proposal.noCount--;
                }
            }
        } else {
            hasVoted[proposalId][msg.sender] = true;
        }

        votes[proposalId][msg.sender] = support;

        if (support) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        emit VoteCast(proposalId, msg.sender);

        if (proposal.yesCount >= 10) {
            // Execute the proposal
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Proposal execution failed");

            proposal.executed = true;

            emit ProposalExecuted(proposalId);
        }
    }
}
