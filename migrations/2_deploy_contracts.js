const Conference = artifacts.require("Conference");

module.exports = function(deployer) {
  deployer.deploy(Conference);
  //deployer.autolink(); // for linking imports of other contracts
};
