// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract coins{
    address public owner;
    uint public total;
    uint ownerBal;
    
    //creating an event for send..
    event Send(address _from, address _to, uint _amount);

    //store the balance of every user.
    mapping(address=>uint)balances;


    constructor() payable{
        owner = msg.sender;
        total = 100;
        ownerBal = 100;
        balances[owner] = 100;
    }
    //modifer to check if, is allowed to mint new coins.
    modifier allow{
        require(msg.sender==owner, 'You are not authorised to mint');
        _;
    }
    //mint new coins 
    function mint(uint _coins) public allow{
        total+=_coins;
        ownerBal += _coins;
        balances[owner] = ownerBal;
    }

    //enough balance to transfer funds
    modifier enoughBal(uint _tosend, uint _avail){
        require(_avail>_tosend,'Not enough funds available');
        _;
    }
    
    //transfer function
    function transfer(address _to, uint _amount) public payable enoughBal(_amount,balances[msg.sender]){
        balances[_to] += _amount;
        balances[msg.sender] -= _amount; 
        emit Send(msg.sender, _to, _amount);
    }

    function checkMyBalance() public view returns(uint){
        return balances[msg.sender];
    }
    function checkBalance(address _of) public view returns(uint){
        return balances[_of];
    }
    
    //if we are creating a transfer function wherein, our balances are deducted and then we realise,
    //that the balance in the wallet is not enough then we can use "revert" keyword.
    /*
    //error message that needs to be shown...
    error insufficientBalance(uint _requested, uint _available);
    
    //inside the function...
    revert insufficientBalance({
        requested: _amount,
        available: msg.value
    });
    */
}