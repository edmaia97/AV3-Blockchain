// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Auth {
    struct User {
        bytes32 name;
    }

    mapping (address => User) private users;

    uint private id;

    modifier onlyExistingUser {
        require(
            users[msg.sender].name != 0x0,
            "Usuario nao registrado"
        );
        _;
    }

    modifier onlyValidName(bytes32 name) {
        require(
            name != 0x0,
            "Nome de usuario invalido"
        );
        _;
    }

    function login() public view onlyExistingUser returns (bytes32) {
        return (users[msg.sender].name);
    }

    function register(
        bytes32 name
    ) public payable onlyValidName(name) returns(bytes32) {
        if (users[msg.sender].name == 0x0) {
            users[msg.sender].name = name;
            return (users[msg.sender].name);
        }
        return (users[msg.sender].name);
    }

    function update(
        bytes32 name
    ) public payable onlyValidName(name) onlyExistingUser returns(bytes32) {
        if (users[msg.sender].name != 0x0){
            users[msg.sender].name = name;
            return (users[msg.sender].name);
        }
        return (users[msg.sender].name);
    }
}