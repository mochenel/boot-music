function display(id){
document.getElementById("catId").innerText = document.getElementById(id).innerText;
document.getElementById("categoryName").value = document.getElementById(id).innerText;
loadData(document.getElementById(id).innerText);
funFilter2();

	
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
function loadData(val) {
            
            let childrenList = document.getElementById("t-music").children;
            let n= childrenList.length;
            for(var i = 1; i <n;i++ ){
                    childrenList[i].style.display = "";
                
            }
            for(var i = 1; i <n;i++ ){
                if(childrenList[i].getAttribute("name") == val){
               
                    childrenList[i].style.display = "";
                }
                else{
                  
                    childrenList[i].style.display = "none";
                }
            }


}
function isCategorySelected(e){
    let cat = document.getElementById("catId").innerText.trim();
    if(cat== "" || cat == "No Category selected" || cat == null){
        document.getElementById("catId").innerHTML == "Please select category";
        e.preventDefault();
    }
}
function allSongs(){
    document.getElementById("catId").innerText = "No Category selected";
    let childrenList = document.getElementById("t-music").children;
    let n= childrenList.length;
    for(var i = 1; i <n;i++ ){
            childrenList[i].style.display = "";
        
    }
    
    funFilter2();
 
}
