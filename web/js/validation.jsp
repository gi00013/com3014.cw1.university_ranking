
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
}
else if (e == 'selectSubject')
{
alert("Please select subject");
}
else if (f == 'selectLocation')
{
alert("Please select location");
}
else if (g == 'selectTeaching')
{
alert("Please select Teaching Satisfaction");
}
else if (i == 'selectDifficulty')
{
alert("Please select Entry Difficulty");
}
else if (k == 'selectStudent')
{
alert("Please select Student Satisfaction");
}
else if (j == 'selectResearch')
{
alert("Please select Research");
}
else if (h == 'selectCareer')
{
alert("Please select Career Opportunities");
}
else
{
window.location.replace(href = "showResults.html");
}
}




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