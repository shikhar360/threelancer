//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error NotRegistered();

contract Users {
    uint private uid = 0 ;

    uint private pid = 0 ;




  struct User {
    uint256 userId;
    string userName;
    string bio;
    string[] acomplishments;
    uint[] myProjs;
    uint[] appliedProjs;
    address useradd;
  }


    
    enum STATUS {
        NOT_STARTED,
        ACTIVE ,
        ENDED
    }


   struct Project {
       uint projectId ;
       string pname;
       string desc;
       STATUS condition;
       string deadline ;
       uint bountyAmount ;
       address projOwner;

   }
    //    address assignedTo;
   

   

    User[] private usersArr; 
    Project[] private projArr;

 //   mapping(uint => uint) private userToProj;
    mapping(address => bool) private hasRegistered; 
    mapping(address => uint) private addToId;
    

    function userReg(string memory _userName, string memory _bio) external {
        string[] memory acomp ;
        uint[] memory  mproj; 
        uint[] memory  appliedproj; 
        usersArr.push(User(uid , _userName , _bio , acomp , mproj, appliedproj,  msg.sender  )) ;
        hasRegistered[msg.sender] = true;
        addToId[msg.sender] = uid; //for getter
        uid ++;
    
    }

    function addProj( string memory _name , string memory _desc , string memory _deadline , uint _amount  ) external {
    if (!(hasRegistered[msg.sender])){
        revert NotRegistered();
    }
    projArr.push(Project(pid , _name , _desc , STATUS.NOT_STARTED , _deadline , _amount , msg.sender));

    usersArr[addToId[msg.sender]].myProjs.push(pid);

    pid ++ ;
    }



    function applytoproj(uint _projId) external { // applybutton for all projects
        usersArr[addToId[msg.sender]].appliedProjs.push(_projId);
    }

    function getAppliedProjs() external view returns (uint[] memory){
    return usersArr[addToId[msg.sender]].appliedProjs ; // filter from allprojs arr in frontend
    }

    function getAllProjs() external view returns(Project[] memory){
        return projArr;
    }

    function getMyProjs() external view returns(uint[] memory){
        return usersArr[addToId[msg.sender]].myProjs;  //will use filter function in frontend
    }



}



// reg => seeallproj => apply to added proj(add + apply) => seeappliedproj => 


//pages
// landing
// login page
// projects page ()

// project submission page (edit )

////////////////////////////////
//user

// user registeration (modal (user or client))
// user will (check out proj ,  )
// project assign project will be completed in dur time (keepers)
// page where user can see all of his submission
// user will be able to edit its projects 


// client
// submitted projects checkout 
// will be ablr to post the projects 
// will giv some type of rating to the project
// projects will get some type of nft after completion
// mark as completed after giving nft 
