var popup=document.querySelector(".popup-overlay");
var popupbax=document.querySelector(".popup-box");
var add=document.getElementById("add-btn-popup");
add.addEventListener("click",function(){
    popup.style.display="block";
    popupbax.style.display="block";

})
var cancel = document.getElementById("cancel");
cancel.addEventListener("click",function(event){
    event.preventDefault();
    popup.style.display="none";
    popupbax.style.display="none";
}
)
var contain=document.querySelector(".container");
var add=document.getElementById("Add");
var bookname=document.getElementById("book-title-input");
var bookauthor=document.getElementById("book-author-input");
var bookdescr=document.getElementById("book-description");
add.addEventListener("click",function(event){
    event.preventDefault();
    var div=document.createElement("div");
    div.setAttribute("class","book-container");
    div.innerHTML=`<h1>${bookname.value}<br></h1>
    <h3>${bookauthor.value}<br></h3>
    <p>${bookdescr.value}</p>
    <button onclick="del(event)">Delete</button>`;
    contain.append(div)
    popup.style.display="none";
    popupbax.style.display="none";
});
function del(event){
    event.target.parentElement.remove();
}
