

pragma solidity ^0.8.18;

contract nkaultoken{
    string public tokenName = "Nakul";
    string public tokenAbbr = "NAK";

    address owner;

    mapping(address => uint) record;

    constructor(){
        owner = msg.sender;
    }

    function getBalance() external view returns (uint){
        return record[msg.sender];
    }

    function mint(address to, uint amount) external {
        require(msg.sender == owner,"Only owner can mint tokens");
        record[to] += amount;
    }

    function transferTo(address to, uint amount) external{
        require(record[msg.sender] >= amount,"Insufficient balance in the account");
        record[to] += amount;
        record[msg.sender] -= amount;
    }

    function burn(uint amount) external {
        require(record[msg.sender] >= amount,"Insufficient balance in the account");
        record[msg.sender] -= amount;
    }
}
