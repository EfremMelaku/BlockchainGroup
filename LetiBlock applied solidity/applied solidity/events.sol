// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    
    Proposal[] public proposals;

    mapping(uint => mapping(address => bool)) public votes;
    mapping(uint => mapping(address => bool)) public hasVoted;

    event ProposalCreated(uint proposalId);

    event VoteCast(uint proposalId, address voter);

    function newProposal(address _target, bytes calldata _data) external {
        Proposal memory proposal = Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        });
        proposals.push(proposal);

        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool support) external {
        require(proposalId < proposals.length, "Invalid proposalId");

        Proposal storage proposal = proposals[proposalId];

        if (hasVoted[proposalId][msg.sender]) {
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
    }
}
