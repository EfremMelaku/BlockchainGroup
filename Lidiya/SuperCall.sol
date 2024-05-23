// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

contract Mage is Hero {
    constructor() Hero(50) {

    }
    
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Spell);
        super.attack(enemy);
    }
}

contract Warrior is Hero {
    constructor() Hero(200) {

    }
    
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Brawl);
        super.attack(enemy);
    }
}
