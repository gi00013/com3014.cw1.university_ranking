//gets values from input fileds and assign them to a variable. Then checks if a value is being used twice. 
//Also checks if the user did not choose a number.constructor. I anything of that is trure it return an alert message.
//if nothing is wrong, redirect to the showResults page.
function validate() {
e = document.getElementById("subject").value;
f = document.getElementById("location").value;
g = document.getElementById("teachingSatisfaction").value;
h = document.getElementById("careerOpportunities").value;
i = document.getElementById("entryDifficulty").value;
j = document.getElementById("research").value;
k = document.getElementById("student").value;

if (f == g || f == h || f == i || f == j || f == k || g == h ||  g == i || g == j || g == k || h == i || h == j || h == k ||  i == j || i == k || j == k)
{
alert("Please use each number once");
return false;
}
else if (e == 'selectSubject')
{
alert("Please select subject");
return false;
}
else if (f == 'selectLocation')
{
alert("Please select location");
return false;
}
else if (g == 'selectTeaching')
{
alert("Please select Teaching Satisfaction");
return false;
}
else if (i == 'selectDifficulty')
{
alert("Please select Entry Difficulty");
return false;
}
else if (k == 'selectStudent')
{
alert("Please select Student Satisfaction");
return false;
}
else if (j == 'selectResearch')
{
alert("Please select Research");
return false;
}
else if (h == 'selectCareer')
{
alert("Please select Career Opportunities");
return false;
}
else
{
window.location.href = '../jsp/showResult.jsp';
}
}


//Function to show or hide the div in the hidden in the index page.
function showHide(shID) {
if (document.getElementById(shID)) {
if (document.getElementById(shID + '-show').style.display != 'none') {
document.getElementById(shID + '-show').style.display = 'none';
document.getElementById(shID).style.display = 'block';
}
else {
document.getElementById(shID + '-show').style.display = 'inline';
document.getElementById(shID).style.display = 'none';
}
}
}
//function to validate the registration form. Assign the value of the input field to a variable.
//Then checks if there is any empty fields. Also checks the length of the username, check the email filed and the password
//to contain a number, a leeter, a capital letter, if the two passwords are the same and the length of the password
  function validateForm() {
    var x = document.forms["myForm"]["email"].value;
    var n = document.forms["myForm"]["fname"].value;
    var l = document.forms["myForm"]["lname"].value;
    var p1 = document.forms["myForm"]["pass"].value;
    var p2 = document.forms["myForm"]["pass2"].value;
    var e = document.forms["myForm"]["uname"].value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
    if (n==null || n=="") {
        alert("First name must be filled out");
        return false;
    }
    if (l==null || l=="") {
        alert("Last name must be filled out");
        return false;
    }
    if (p1!= "" || p1 != null) {
        if(p1 != p2) {
           alert("Error: Passwords do not match!");
           return false;
        }
      if(p1 < 6) {
        alert("Error: Password must contain at least six characters!");
        return false;
      }
      re = /[0-9]/;
      if(!re.test(p1)) {
        alert("Error: password must contain at least one number (0-9)!");
        return false;
      }
      re = /[a-z]/;
      if(!re.test(p1)) {
        alert("Error: password must contain at least one lowercase letter (a-z)!");
        return false;
      }
      re = /[A-Z]/;
      if(!re.test(p1)) {
        alert("Error: password must contain at least one uppercase letter (A-Z)!");
        return false;
      }
    } else {
      alert("Error: Please check that you've entered and confirmed your password!");
      return false;
    }
    if(e < 3) {
        alert("Error: Username must contain at least three characters!");
        return false;
    }
    return true;
  }
