
pragma solidity ^0.4.24;
contract TechnologyBallot {

    
    
    struct Technology {
        uint id;
        bytes32 name;
        uint votes;
    }
    
    Technology[] public techs;
    
    function addTechnology(bytes32 _name) public {
        techs.push(Technology({
          id :  techs.length,
          name : _name,
          votes : 0
        }));
    }
    
    
    function vote(uint id) public {
        techs[id].votes += 1;
    }
    
     
    function Poll() public view returns (bytes32) {
        Technology storage tech = techs[0];
        for(uint i = 1; i < techs.length; i ++){
            if(tech.votes < techs[i].votes){
                tech = techs[i];
            }
        }
        return tech.name;
    }
}