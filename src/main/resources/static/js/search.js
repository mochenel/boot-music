function funFilter(){
var id = 'query2';
var list = 'categories';

let filter = document.getElementById(id).value.trim();
let childrenList = document.getElementById(list).children;
for(let i = 1; i <childrenList.length; i++){
	let text = childrenList[i].textContent.toUpperCase();
	if(text.indexOf(filter.toUpperCase()) == -1){
		childrenList[i].style.display = "none";
	}
	else{
		childrenList[i].style.display = "";
	}
}
}

function funFilter2(){
let val = document.getElementById("catId").innerText;	
let filter = document.getElementById("query1").value;
let tr = document.getElementsByTagName("tr");
for(let i = 1; i <tr.length; i++){
	let td = tr[i].children[1].textContent;
	if(td.toUpperCase().indexOf(filter.toUpperCase()) == -1 ){
		tr[i].style.display = "none";
	}

	else{
		tr[i].style.display = "";
	}

	if(tr[i].getAttribute("name") != val && val != "No Category selected"){
		tr[i].style.display = "none";
	}
}
}
function funFilterPerson(){
let filter = document.getElementById("person").value;
let tr = document.getElementsByTagName("tr");
for(let i = 1; i <tr.length; i++){
	let td = tr[i].children[0].textContent;
	if(td.toUpperCase().indexOf(filter.toUpperCase()) == -1){
		tr[i].style.display = "none";
	}
	else{
		tr[i].style.display = "";
	}
}
}
function inputValue(){
	allSongs();
	let val = document.getElementById("DataList-from").value.toUpperCase();
	console.log("val");
	let songs = document.getElementById("datalistOptions-songs").children;
	
	let tr = document.getElementsByTagName("tr");
	let j = 0;
	for(let i = 1; i < tr.length; i++){
		if(tr[i].getAttribute("name") != val){
			songs[j].style.display = "none";
			songs[j].disabled = true;
		}
		else{
			songs[j].style.display = "";
			songs[j].disabled = false;
		}
		j ++;
	}



	// remove selected value(source-:from) from destination
	let songsTo = document.getElementById("datalistOptions-to").children;
	for(let j = 0; j < songsTo.length; j++){
		if(songsTo[j].value.toUpperCase() == val){
			songsTo[j].style.display = "none";
			songsTo[j].disabled = true;
			let inputval = document.getElementById("DataList-to").value.toUpperCase();
		
			// avoid source and destination from being the same
			if(inputval == val)
			document.getElementById("DataList-to").value = "";
		}
		else{
			songsTo[j].style.display = "";
			songsTo[j].disabled = false;
		}
	}
}
function validateMoveFile(){

	let val = document.getElementById("DataList-from").value.toUpperCase();
	let songs = document.getElementById("datalistOptions-songs").children;
	let valTo = document.getElementById("DataList-to").value.toUpperCase();
	let song = document.getElementById("DataList-songs").value;
	if(!val || !song || !valTo){
		return false;
	}

	let tr = document.getElementById("categories").children;
	let foundFrom = false, foundTo = false,foundSong = false;

	// check validity of categories
	for(let i = 0; i < tr.length; i++){
		if(tr[i].getAttribute("id").toUpperCase() == val){
			foundFrom = true;
			
		}
		if(tr[i].getAttribute("id").toUpperCase()  == valTo){
			foundTo = true;
		}
		
		
	
	}
	for(let j = 0; j < songs.length; j++){
		if(songs[j].style.display == "none"){

		}
		else{
			if(songs[j].value == song){
				foundSong = true;
			}
		}
	}

	if(!foundFrom ){
		alert(val + " is invalid, Please select from dropdown list")
		event.preventDefault();
	}
	else if(!foundSong){
		alert(song + " is invalid, Please select from dropdown list")
		event.preventDefault();
	}
	else if(!foundTo){
		alert(valTo + " is invalid, Please select from dropdown list")
		event.preventDefault();
	}
	else{

	}
}