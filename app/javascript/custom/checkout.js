document.addEventListener("turbolinks:load", () => {
    if (!Turbolinks) {
        location.reload();
        }
    var estate_select = document.getElementById("estate")
    var city = document.getElementById("address_city")

    function getEstate(town){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                var est = JSON.parse(this.responseText).estates
                for (let i = 0; i < est.length; i++){
                    var option = '<option>' + est[i] + '</option>'
                    estate_select.insertAdjacentHTML('beforeend', option);
                }   
            }
        };
        xhttp.open("GET", "/get_estate?city_name="+ town, true)
        xhttp.send();
    }  
    function setEstateOnLoad(){
            var selected_city = city.options[city.selectedIndex].text
            getEstate(selected_city)   
    }
    
    function removeChildNodes(parent){
        while(parent.firstChild){
            parent.removeChild(parent.firstChild)
        }
    }

    if (city){
        setEstateOnLoad();
    }
    if (city){
        city.addEventListener('click', function(e){
            var chosen_city = this.options[this.selectedIndex].text
            removeChildNodes(estate_select)
            getEstate(chosen_city);
            
        })
    }

    

    

    
});

    

    

   