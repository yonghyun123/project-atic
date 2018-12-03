/*
name : companyDirRegist.js 
*/
  $("#regDir").click(function() {
      $("#com-dir-Reg").modal('show');
   });
  
  var currentDirTab = 0; // Current tab is set to be the first tab (0)
	showDirTab(currentDirTab); // Display the current tab

	function showDirTab(n) {
		// This function will display the specified tab of the form ...
		console.log('n:' + n);
		var x = document.getElementsByClassName("regDirTab");
		console.log('x='+ x.length);
		x[n].style.display = "block";
		// ... and fix the Previous/Next buttons:
		if (n == 0) {
			document.getElementById("prevBtnDirReg").style.display = "none";
			document.getElementById("nextBtnDirReg").disabled = false;
		} else {
			document.getElementById("prevBtnDirReg").style.display = "inline";
		}
		if (n == (x.length - 1)) {
			document.getElementById("nextBtnDirReg").innerHTML = "Submit";
			document.getElementById("nextBtnDirReg").disabled = true;

		} else {
			document.getElementById("nextBtnDirReg").innerHTML = "Next";
		}
		// ... and run a function that displays the correct step indicator:
		fixStepIndicatorDir(n)
	}

	function nextDirPrev(n) {
		// This function will figure out which tab to display
		var x = document.getElementsByClassName("regDirTab");
		
		// Exit the function if any field in the current tab is invalid:
		if (n == 1 && !validateDirForm())
			return false;
		// Hide the current tab:
		x[currentDirTab].style.display = "none";
		// Increase or decrease the current tab by 1:
		currentDirTab = currentDirTab + n;
		// if you have reached the end of the form... :
		if (currentDirTab >= x.length) {
			//...the form gets submitted:
			$("#com-dir-Reg").modal('hide');
			return false;
		}
		// Otherwise, display the correct tab:
		showDirTab(currentDirTab);
	}

	function validateDirForm() {
		// This function deals with validation of the form fields
		var x, y, i, valid = true;
		x = document.getElementsByClassName("regDirTab");
		y = x[currentDirTab].getElementsByTagName("input");
		// A loop that checks every input field in the current tab:
		for (i = 0; i < y.length; i++) {
			// If a field is empty...
			if (y[i].value == "") {
				// add an "invalid" class to the field:
				y[i].className += " invalid";
				// and set the current valid status to false:
				valid = false;
			}
		}
		// If the valid status is true, mark the step as finished and valid:
		if (valid) {
			document.getElementsByClassName("step")[currentDirTab].className += " finish";
		}
		return valid; // return the valid status
	}

	function fixStepIndicatorDir(n) {
		// This function removes the "active" class of all steps...
		var i, x = document.getElementsByClassName("step");
		for (i = 0; i < x.length; i++) {
			x[i].className = x[i].className.replace(" active", "");
		}
		//... and adds the "active" class to the current step:
		x[n].className += " active";
	}