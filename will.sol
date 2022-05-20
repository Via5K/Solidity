// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract Will{
    address owner;
    uint fortune;
    bool dead;
    address payable[] family;
    mapping(address=>uint)amount;

    constructor() payable{
        dead = false;
        owner = msg.sender;
        fortune = msg.value;
    }

    modifier isOwner{
        require(msg.sender==owner,'Not owner, Sorry!!');
        _;
    }
    modifier isDead{
        require(dead==true,'Not dead! Wait for the person to be dead');
        _;
    }

    function setAmount(address payable _family, uint _amount) public isOwner{
        amount[_family] = _amount;
        family.push(_family);
    }

    function sendMoney() private isDead{
        for(uint i=0;i<family.length;i++){
            family[i].transfer(amount[family[i]]);
        }
    }
    function kill() public{
        dead = true;
        sendMoney();
    }
}


//Sample Family Addresses....
/****
0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
0xdD870fA1b7C4700F2BD7f44238821C26f7392148
0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB

// And, note that We exoect ether in amount but, it takes as smmalest unit of ether i.e wei So we need to multiply with 10^18
****/