/**
 * 
 */
 
 function comparePassword() {
	var newPassword1 = document.getElementById("newPassword1").value;
	var newPassword2 = document.getElementById("newPassword2").value;
	if (newPassword1 != newPassword2) {
		alert("Two passwords are differernt, please try again.");
		document.getElementById("newPassword1").value = "";
		document.getElementById("newPassword2").value = "";
		// document.getElementById("submit").disabled = true;
	}
}
 

	function getPassword(){
		var password= document.getElementById("db_password").value;
		var oldPassword= document.getElementById("oldPassword").value;
		if(password!=oldPassword){
			alert("The original password is wrong.");
			document.getElementById("oldPassword").value = "";
		}
		
	}
 
 