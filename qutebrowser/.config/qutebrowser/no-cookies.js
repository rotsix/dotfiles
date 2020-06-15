/*
This alternate version works by appending a CSS rule to "document.head",
then appends the given class name to each floating element.

Overcomes the problem of child nodes having "visibility:visible", faced by the original version.
*/

javascript:
if (typeof aoeuToggle != "number"){
    /* declare global variables for toggle functionality */
    var aoeuToggle;
    var aoeuFloats = [];
	/* append CSS rule */
	(function(){
		var aoeuStyle = document.createElement("style");
		aoeuStyle.type = "text/css";
		aoeuStyle.innerHTML = ".aoeuHideFloater, .aoeuHideFloater * { visibility: hidden !important; }";
		document.head.appendChild(aoeuStyle);
	})();
}
(function(){
    if (aoeuToggle != 1){
        /* generate array of floating elements to be hidden */
        var aoeuElems = document.body.getElementsByTagName("*");
        aoeuFloats=[]; /*reset for each toggle on*/
        for (var i=0;i<aoeuElems.length;i++) {
            var positionValue = window.getComputedStyle(aoeuElems[i]).getPropertyValue("position");
            if ( ["fixed","sticky"].includes(positionValue) ) {
                aoeuFloats[aoeuFloats.length]=aoeuElems[i]; /*store the relevant element, for toggle purposes*/
                aoeuElems[i].classList.add("aoeuHideFloater"); /*then hide it*/
            }
        }
        /*alert(aoeuFloats.length);*/
        aoeuToggle=1;
    } else{
        /* un-hide previously hidden elements */
        for(var i=0; i<aoeuFloats.length; i++){
            aoeuFloats[i].classList.remove("aoeuHideFloater");
        }
        aoeuToggle=0;
    }
})();
