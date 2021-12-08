const CertificateEmission = artifacts.require("CertificateEmission");

contract("CertificateEmission", (accounts) => {
    // let cert;
    // let expectedActive;

    before(async () => {
        cei = await CertificateEmission.deployed();
    });

    describe("cria certificado", async () => {
        before("accounts[0] manda o certificado para accounts[1]", async () => {
            const ipfs = web3.utils.asciiToHex('ipfs da imagem');
            const desc = web3.utils.asciiToHex('Certificado');
            await cei.newCertificate(accounts[1], ipfs, desc, {from: accounts[0]});
        });
        it("accounts[1] pode visualizar seu certificado", async () => {
            const cert = await cei.certificates(accounts[1], {from: accounts[1]});
            assert.equal(cert.active, true, "Certificado visualizado e ativo.");
        });
    });
});