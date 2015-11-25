function timevalidate() {
var start = document.getElementById("st").value;
var end = document.getElementById("et").value;
var dtStart = new Date("November 13, 2013 " + start);
dtStart=dtStart.getTime();
var dtEnd = new Date("November 13, 2013 " + end);
dtEnd=dtEnd.getTime();
var difference_in_milliseconds = end - start;
if (difference_in_milliseconds < 0)
{
alert("End Time must be greater then Start Time!");
}
}

function isAlpha(a) 
{
  
  
    var value=a.value;
  var id=a.id;
    if (!value.match(/^[a-zA-Z]+$/)) 
    {
        alert('Only alphabets are allowed');
        document.getElementById(id).value="";

        return false;
    }
    
    return true;
}

function isNumeric(a) 
{
  
  
    var value=a.value;
  var id=a.id;

    if (!value.match(/^[0123456789-]+$/)) 
    {
        alert('Only numbers are allowed');
        document.getElementById(id).value="";

        return false;
    }
    
    return true;
}
function isNumeric1(a) 
{
  
  
    var value=a.value;
  var id=a.id;
  alert(a.id);
    if (!value.match(/^[0123456789:.]+$/)) 
    {
        alert('Only numbers are allowed');
        document.getElementById(id).value="";

        return false;
    }
    
    return true;
}
function date_check()
{
	var trans_date = document.form1.selectmonth.value + "-" + document.form1.selectday.value + "-" + document.form1.selectyear.value;
	var d = new Date();
	var today = (d.getMonth()+1) + "-" + d.getDate() + "-" + d.getFullYear();
	if(new Date(trans_date) < new Date(today)){
		window.alert("The shipping date cannot be in the past, please enter a valid shipping date.");
		return false;

}
}

function dateValidate(inputField)
{
    var pickeddate =  new Date(inputField.value);
    var todayDate =  new Date();
    if( pickeddate > todayDate )
    {
       return true;
    }
    else
    {
        alert("Enter a valid Date");
    } 
}

function notgreaterthenstart() {
	

    var startDate = document.getElementById("stdt").value;
    var endDate = document.getElementById("eddt").value;
 
    if ((Date.parse(startDate) >= Date.parse(endDate))) {
        alert("End date should be greater than Start date");
        document.getElementById("EndDate").value = "";
    }
}
