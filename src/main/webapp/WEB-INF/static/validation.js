console.log("seems fine")
function validateForm(){
    console.log("reached in validation.js")
    
    var validName= validateName();
    var validEmail = validateEmail();
    var validUsername= validateUsername();
    var validPassword= validatePassword();
    
    console.log(validName)
    console.log(validEmail)
    console.log(validUsername)
    console.log(validPassword)
    
    if( validName == validEmail == validUsername == validPassword == true){
        console.log("valid")
        return true;
    }else{
        console.log("invalid")
        return false;
    }
    
    
}
function validateName() {
  var fullName = document.getElementById('name').value;
  var elementBorder = document.getElementById("nameDiv");
  let elementError = document.getElementById('nameError');
  
  if (fullName === '') { 
    elementBorder.classList.remove("success");
    elementBorder.classList.add("error");
    elementError.innerHTML = 'name field is blank.';
    return false;
    } else {
      elementError.innerHTML = '';
      elementBorder.classList.remove("error");
      elementBorder.classList.add("success");
      return true;
   
    }
}
function validateEmail() {
  var email = document.getElementById('email').value;
  var elementBorder = document.getElementById("emailDiv");
  let elementError = document.getElementById('emailError');
  //email validation
  if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email))) {
    elementBorder.classList.remove("success");
    elementBorder.classList.add("error");
    elementError.innerHTML = 'please enter a valid email.';
    return false;
  }else{
    elementError.innerHTML = '';
    elementBorder.classList.remove("error");
    elementBorder.classList.add("success");
    return true;
  } 
}

function validateUserType(){
  var UserType = document.getElementById('UserType').value;
  var elementBorder = document.getElementById("usertypeDiv");
  let elementError = document.getElementById('usertypeError');
  
  if (UserType === '') {
    elementBorder.classList.remove("success");
    elementBorder.classList.add("error");
    elementError.innerHTML = 'Please select Usertype.';
  } else {
    elementError.innerHTML = '';
    elementBorder.classList.remove("error");
    elementBorder.classList.add("success");
  }
}
function validateUsername(){
  var username = document.getElementById('username').value;
  var elementBorder = document.getElementById("usernameDiv");
  let elementError = document.getElementById('usernameError');
  if (username === '') { 
    elementBorder.classList.remove("success");
    elementBorder.classList.add("error");
    elementError.innerHTML = 'Please enter your Username.';
    return false;
  } else {
    elementError.innerHTML = '';
    elementBorder.classList.remove("error");
    elementBorder.classList.add("success");
    return true;
  }
}
function validatePassword(){
  var password = document.getElementById('password').value;
  var elementBorder = document.getElementById("passwordDiv");
  let elementError = document.getElementById('passwordError');
  //password validation
 if (!(/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/.test(password))) {
  elementBorder.classList.remove("success");
  elementBorder.classList.add("error");
  elementError.innerHTML = 'Please enter a valid password.';
  return false;
  } else {
    elementError.innerHTML = '';
    elementBorder.classList.remove("error");
    elementBorder.classList.add("success");
    return true;
  }}
