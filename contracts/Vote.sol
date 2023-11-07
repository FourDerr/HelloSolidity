// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Vote {

  struct candidate{
    string name;
    uint votecount;
  }

  candidate[] public candidates;
  mapping(address => bool) public hasvote;
  event NewcandidateProposed(address newcandidate,uint timestamp);

  function proposecandidate(string memory name) public{
    candidates.push(candidate(name,0));
    emit NewcandidateProposed(msg.sender, block.timestamp);
  }

  event voted(address voter , uint timestamp);
  function vote(uint candidateindex)public{
    require(hasvote[msg.sender] == false,"You Have Already Vote");//checked Never vote yet
    require(candidateindex < candidates.length, "Invalid Candidate Index");// checked have candidate or not
    hasvote[msg.sender] = true;// send that you has been vote
    candidates[candidateindex].votecount++;
    emit voted(msg.sender, block.timestamp);

  }

  function getwinner() public view returns (string memory name)
  {

  }

  constructor() public {
  }
}
