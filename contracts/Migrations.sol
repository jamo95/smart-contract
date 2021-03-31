pragma solidity ^0.5.16;
contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function initMigrations() private {
    owner = msg.sender;
  }

  function setCompleted(uint completed) private {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) private {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}
