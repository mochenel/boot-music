function addCategory(e){
	let category = document.getElementById("category").value.trim().toUpperCase();
	let childrenListElement = document.getElementById("categories");
	let childrenList = childrenListElement.children;
	let n = childrenList.length;
	for(let i = 0; i <n; i++){
		let text = childrenList[i].textContent.toUpperCase();
		if(text == category){
			
			e.preventDefault();
			return false;
		}
	}

	return true;
}
function appendCategory(e){
	if(!addCategory(e)){
		document.getElementById("catAlert").style.visibility = "visible";
		document.getElementById("catAlert").style.height = "30px";
		
	}else{
	
		let category = document.getElementById("category").value.trim().toUpperCase();
		let childrenListElement = document.getElementById("categories");
		let childrenList = childrenListElement.children;
		let n = childrenList.length + 1;
		let element = document.createElement("li");
		element.innerHTML = category;
		element.setAttribute("id","cat"+n);
		element.setAttribute("onclick",`display('cat${n}')`);
		childrenListElement.appendChild(element);
	}
	

}

