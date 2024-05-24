<<<<<<< HEAD
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

    
    function newProposal(address _target, bytes calldata _data) external {
        
        Proposal memory proposal = Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        });

        proposals.push(proposal);
    }
}
=======
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

    
    function newProposal(address _target, bytes calldata _data) external {
        
        Proposal memory proposal = Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        });

        proposals.push(proposal);
    }
}
>>>>>>> 2834b257ea2ef923bdce34b2f2b55ae6c70276a8
