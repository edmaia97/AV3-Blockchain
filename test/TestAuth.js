const Auth = artifacts.require("Auth");

contract("Auth", (accounts) => {
    it("registra e faz login", function() {
        return Auth.deployed().then(function(instance) {
            authenticationInstance = instance;

            const name = web3.utils.asciiToHex('arroz')
            return authenticationInstance.register(name, {from: accounts[9]});
        }).then(function() {
            return authenticationInstance.login({from: accounts[9]});
        }).then(function(userName) {
            assert.equal(web3.utils.hexToAscii(userName), 'arroz', "The user was not signed up.");
        });
    });

});