// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Ownable {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(
            msg.sender == owner,
            "Somente o dono do contrato pode executar essa funcao."
        );
        _;
    }

    modifier receiverIsNotContractOwner(address receiver) {
        require(
            receiver != owner,
            "O dono do contrato nao pode receber certificados."
        );
        _;
    }

    function getOwner() public view returns(address) {
        return owner;
    }
    
}