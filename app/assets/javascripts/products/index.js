// Ajax call to fetch products price as per the selected currency
function changeCurrency(event){
  var currency = event.target.value;
  var xmlHttp = new XMLHttpRequest();
  xmlHttp.onreadystatechange = function() {
    if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
      var obj = JSON.parse(xmlHttp.responseText)['products'];
	    obj.forEach((element) => {
	    document.getElementById(element.id).textContent=element.price + ' ' + currency;
	    }
      );
    }
  }
xmlHttp.open("get", "/products.json?currency=" + currency); 
xmlHttp.send(); 
}




