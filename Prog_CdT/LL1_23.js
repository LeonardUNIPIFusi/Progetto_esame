//Seleziona immagine1
function gestoreSelezionaImg1() {
	try {
        nodoImg1.setAttribute("class", "lato_img");
        nodoImg2.setAttribute("class", "hide");
        nodoDot1.setAttribute("class", "dot_targ");
        nodoDot2.setAttribute("class", "dot");

    } catch(e) {
		alert("gestoreSelezionaImg1"+e);
    }
}

function gestoreSelezionaImg2() {
	try {
        nodoImg2.setAttribute("class", "lato_img");
        nodoImg1.setAttribute("class", "hide");
        nodoDot1.setAttribute("class", "dot");
        nodoDot2.setAttribute("class", "dot_targ");

    } catch(e) {
		alert("gestoreSelezionaImg1"+e);
    }
}


function gestoreSelVersD () {
  try{
      hdiplo = Array.from(document.getElementsByClassName("hide_diplo"));
      interp =  Array.from(document.getElementsByClassName("interp"));
      nodoBDiplo.setAttribute("class", "target");
      nodoBInterp.setAttribute("class", "none");
      var l = hdiplo.length;
      var l1 = interp.length;
      var i = 0;
      
      while (i<l){
        hdiplo[i].setAttribute("class" , "diplo");
        i++;
      }
      
      var a = 0;
      while (a<l1){
        interp[a].setAttribute("class" , "hide_interp");
        a++;
      }
  }catch(e){
    alert("gestoreSelVersD" + e);
  }
}

function gestoreSelVersI (){
  try{
      
      hinterp = Array.from(document.getElementsByClassName("hide_interp"));
      diplo = Array.from(document.getElementsByClassName("diplo"));
      nodoBDiplo.setAttribute("class", "none");
      nodoBInterp.setAttribute("class", "target");
      var l = diplo.length;
      var l1 = hinterp.length;
      var i = 0;
      while (i< l ){
          
          diplo[i].setAttribute("class" , "hide_diplo");
          i++;
      }
      
      var a = 0;
      while (a<l1){
        hinterp[a].setAttribute("class" , "interp");
        a++;
      }
  }catch(e){
    alert("gestoreSelVersI" + e);
  }
}


// Variabili
var nodoDot1;
var nodoDot2;
var nodoImg1;
var nodoImg2;
var nodoBDiplo;
var nodoBInterp;
var hdiplo;
var interp;
var hinterp;
var diplo; 


//Gestore load
function gestoreLoad(){
    try {
        nodoDot1 = document.getElementById("dot_1");
        nodoDot2 = document.getElementById("dot_2");
        nodoDot1.setAttribute("class", "dot_targ");
        nodoDot2.setAttribute("class", "dot");
        nodoDot1.onclick = gestoreSelezionaImg1;
        nodoDot2.onclick = gestoreSelezionaImg2;
        nodoBDiplo = document.getElementById("b_diplo");
        nodoBInterp = document.getElementById("b_interp");
        nodoBDiplo.setAttribute("class", "target");
        nodoBInterp.setAttribute("class", "none");
        nodoBDiplo.onclick = gestoreSelVersD;
        nodoBInterp.onclick = gestoreSelVersI;
        nodoImg1 = document.getElementById("img_1");
        nodoImg2 = document.getElementById("img_2");
        nodoImg2.setAttribute("class", "hide");
        
        
    } catch(e) {
		alert("gestoreLoad" + e); 
	}
}

window.onload = gestoreLoad;