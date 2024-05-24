<<<<<<< HEAD
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
=======
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
>>>>>>> 2834b257ea2ef923bdce34b2f2b55ae6c70276a8
