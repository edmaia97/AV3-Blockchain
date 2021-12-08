const Ownable = artifacts.require("Ownable");
const CertificateEmission = artifacts.require("CertificateEmission");

module.exports = function (deployer) {
  deployer.deploy(Ownable);
  deployer.link(Ownable, CertificateEmission);
  deployer.deploy(CertificateEmission);
};
