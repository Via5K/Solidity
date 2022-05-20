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
