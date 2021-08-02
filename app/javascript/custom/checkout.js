document.addEventListener("turbolinks:load", () => {
    if (!Turbolinks) {
        location.reload();
        }
    var estateSelect = document.getElementById("estate")
    var deliveryEstate = document.getElementById("delivery-estate")

    var city = document.getElementById("address_city")
    var deliveryCity = document.getElementById("address_city_id")
    var modal = document.getElementById("myModal")
    var triggerModal = document.getElementById("trigger-modal") 
    var span = document.getElementsByClassName("close")[0]

    function getEstate(town,estate){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                var est = JSON.parse(this.responseText).estates
                for (let i = 0; i < est.length; i++){
                    var option = '<option>' + est[i] + '</option>'
                    estate.insertAdjacentHTML('beforeend', option);
                }   
            }
        };
        xhttp.open("GET", "/get_estate?city_name="+ town, true)
        xhttp.send();
    }  
    function setEstateOnLoad(city,estate){
            var selected_city = city.options[city.selectedIndex].text
            getEstate(selected_city,estate)   
    }
    
    function removeChildNodes(parent){
        while(parent.firstChild){
            parent.removeChild(parent.firstChild)
        }
    }

    if (city){
        setEstateOnLoad(city,estateSelect);
    }

    

    if (city){
        city.addEventListener('click', function(e){
            var chosen_city = this.options[this.selectedIndex].text
            removeChildNodes(estateSelect)
            getEstate(chosen_city,estateSelect);
            
        })
    }

    if (deliveryCity){
        setEstateOnLoad(deliveryCity,deliveryEstate)
    } 

    if (deliveryCity){
        deliveryCity.addEventListener('click', function(e){
            var chosen_city = this.options[this.selectedIndex].text
            removeChildNodes(deliveryEstate)
            getEstate(chosen_city,deliveryEstate);
            
        })
    }



    triggerModal.onclick = function(){
        modal.style.display = "block";  
    }

    span.onclick = function(){
        modal.style.display ="none";
    }

    window.onclick = function(event){
        if(event.target == modal){
            modal.style.display = "none";
        }
    }
    

    
});

    

    

   