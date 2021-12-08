// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Ownable.sol";

contract CertificateEmission is Ownable{
    uint public certCount;

    struct Certificate {
        bytes32 certIpfsHash;
        bytes32 description;
        bool active;
    }

    mapping (address => Certificate) public certificates;

    function newCertificate(
        address _receiver, 
        bytes32 _certIpfsHash, 
        bytes32 _description
    ) public onlyOwner receiverIsNotContractOwner(_receiver) {
        certificates[_receiver] = Certificate(_certIpfsHash, _description, true);
        certCount = certCount + 1;
    }

    function updateCertificateImage(
        address _receiver, 
        bytes32 _certIpfsHash
    ) public onlyOwner {
        certificates[_receiver].certIpfsHash = _certIpfsHash;
    }

    function updateCertificateDescription(
        address _receiver, 
        bytes32 _description
    ) public onlyOwner {
        certificates[_receiver].description = _description;
    }

    function setActive(
        address _receiver, 
        bool _active
    ) public onlyOwner {
        certificates[_receiver].active = _active;
    }

}