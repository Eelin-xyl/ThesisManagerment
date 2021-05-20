function verify() {
	var phone = document.getElementById("phone").value;
	if (phone.length == 11) {

	} else {
		alert("The length of the contact numbers should be 11 digits.")
		document.getElementById("phone").value = "";
	}
}