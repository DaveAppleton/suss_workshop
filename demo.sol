pragma solidity ^0.4.23;

contract exchange {

    address public owner = msg.sender;

    event  Deposit(address indexed sender, uint amount);
    event  Withdraw(uint amount);
    

    function deposit() public payable {
        emit Deposit(msg.sender,msg.value);
    }

    function withdraw() public {
        require(msg.sender == owner);
        uint amount = address(this).balance;
        owner.transfer(amount);
        emit Withdraw(amount);
    }

}