//Seleziona immagine1
function gestoreSelezionaImg1() {
	try {
        nodoImg1.setAttribute("class", "lato_img");
        nodoImg2.setAttribute("class", "hide");


    } catch(e) {
		alert("gestoreSelezionaImg1"+e);
    }
}

function gestoreSelezionaImg2() {
	try {
        nodoImg2.setAttribute("class", "lato_img");
        nodoImg1.setAttribute("class", "hide");


    } catch(e) {
		alert("gestoreSelezionaImg1"+e);
    }
}



// Variabili
var nodoDot1;
var nodoDot2;
var nodoImg1;
var nodoImg2;


//Gestore load
function gestoreLoad(){
    try {
        nodoDot1 = document.getElementById("dot_1");
        nodoDot2 = document.getElementById("dot_2");
        nodoDot1.onclick = gestoreSelezionaImg1;
        nodoDot2.onclick = gestoreSelezionaImg2;
        nodoImg1 = document.getElementById("img_1");
        nodoImg2 = document.getElementById("img_2");
        nodoImg2.setAttribute("class", "hide");
    } catch(e) {
		alert("gestoreLoad" + e); 
	}
}

window.onload = gestoreLoad;