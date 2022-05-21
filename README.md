# Solidity - Introduction

## Some important Methods
Solidity has some improtant methods that helps a lot.
* msg.sender => captures the address of the person who is sending the message.
* msg.value => returns the total assets in the wallet of the message sender.
* .transfer() => personAddress.transfer(amount) transfers the money to the personAddress wallet and the money, assets transferred is: amount.


## Function()
Function in solidity are used to create a functionality. It can be used to implement a feature or calculate some tedious task and even used to reduce the code repeatability.

* For a function, visibility should be defined.
* if any parameters are passed, datatype should be defined.
* If has a return type, then we need to write ```returns(datatype)```


**Code Snippit**
```
function(uint _a, uint _b) public returns(uint){
    sum = _a + _b;
    return sum;
}
```

## Require
Require is a special type of keyword in solidity that makes sure a condition should be met in order to move forward.

**Code Snippit**
```
require(condition,'Error Message');
```
Herein, Condition is something like this: ```age>18```


## Modifiers
Modifiers are a kind of access restrictions in solidity. When we add a modifier in the function, the function starts to execute only if the modifier's conditions are met. Otherwise, the function will not run adn an error can be returned in form of a message.

**Code Snippit**
```
modifier adult(uint _age){
    require(_age>=18, 'You are still young to Vote');
    _;
}

```
Here if the condition is met, then it will move the control back to the original function. 
```_;``` means switch the control to the main fucntion.

## Loop
**for** loop is similar to any other programming language loop.

**Code Snippit**
```
for(uint i=0;i<5;i++){
    sum+=i;
}
```


## Visibility

Visibility are of 4 types in solidity.
1. public - Public allows a function to be called from another contract also.
2. private - Private hides the function from being accessed by anything else.
3. external - Can be called from another contract.
4. internal - Can be called in contract only.


## Mapping

Mapping is done in solidity with the help of mapping keyword.

```mapping(address=>uint)amount```
What we are defining here is this:

<table>
    <th>Address</th>
    <th>Money</th>
    <tr>
    <td>0xabc2--------------------</td>
    <td>20</td>
    </tr>
    <tr>
    <td>0xuieabf-------------------</td>
    <td>2</td>
    </tr>
    <tr>
    <td>0x11asf--------------------</td>
    <td>1</td>
    </tr>
    <tr>
    <td>0xa32skd--------------------</td>
    <td>10</td>
    </tr>
</table>


## Construtor
Constructo is the special function that runs once only. When the contract is deployed.

We can define things that are needed to be reset at first or once only inside a constructor.

Also, a constructor can be made ```payable```. By making it payable, we are allowing the constructor to access the value of money in the account using ```msg.value```.

## Payable
By writing payable keyword in front of any function or variable we allow that function to recieve and transfer the money.


## Revert 
Whenever we want to revert the transaction we use revert keyword, but in addition we also have to create a error.
```error UnknownUser(address _to, address _from)```
and along with this error message, we call the revert.
Let us assume that we have a function where this revert is being used.

```
revert UnknownUser({
    _to: currentAddress that is passed.
    _from: theAddress that is passed inside the function
});
```
This will be showed in the form of a error response.


## Truffle
Okay so this was almost the basic stuff that we need, apart from that we will cover the advance stuff as we move on..
But, setting truffle is one of the important thing.

We first need to install truffle.
And then have to create migrations file which will help us deploy our contracts on the Ganache Test Blockchain...

*Migrations.sol* This will contain the migration  contract


```
pragma solidity ^0.5.0;

/// @title Migrations contract 
/// @author Via5K
/// @dev Migrations are done in order or test network to run prooperly.
contract Migrations{
    address public owner;
    uint public last_completed_migration;

    constructor() public {
        owner = msg.sender;
    }

    modifier restricted{
        if(msg.sender == owner) _;
    }


    function setCompleted(uint completed) public restricted{
        last_completed_migration = completed;
    }
    function upgradeMigration(address _owner) public restricted{
        Migrations upgraded = Migrations(_owner);
        upgraded.setCompleted(last_completed_migration);
    }

}
```

Apart from this, we also have to setup the javascript file for the truffle migrations. And we will do that by creating a folder in root directory named: *1_initial_migration.js*

*1_initial_migration.js*

```
const Migrations = artifacts.require("Migrations");
//Migrations is the variable name where we are storing our contract which is also named as Migrations.

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};

```

Similarly we need to create a *deploy_contracts.js* file for the other contract. Here the file that will be included is the main file which links to all other contracts.


```
const Migrations = artifacts.require("Migrations");
//Migrations is the variable name where we are storing our contract which is also named as Migrations.

module.exports = async function (deployer) {
  await.deployer.deploy(Migrations);
};
```

So, if you dont want to write the code, you can also use:
```truffle init``` This would have initialised the code for us.


So the first thing we need to do is compile our contracts.
0. ```truffle init```, This will create .js and a migrations file. Other than this if you want a contract to be deployed for ex: ```Tether.sol``` then creaet a file named: *2_deploy_contract.sol* and paste the same code as it was written in *1_initial_migrations.sol* and change variable and contract names.
1. ```truffle compile```
2. ```truffle migrate```: this will deploy the contracts. If successfull deployed, you can see the gas fees and contract addresses.
3. We can aslo check the details of the contract by running it. We can run it by typing: ```truffle console```
   1. ```t = await Tether.deployed()``` where i have written tether, it is the name of the contract. This should return **undefined**
   2. Now simply type ```t```, this would return a whole lot of list about the contract details.
   3. Now, we can run all the functions that we have defined inside the tether *ex:* ```t.name()```, ```t.decimals()``` etc.
4. 