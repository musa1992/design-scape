document.addEventListener("turbolinks:load", () => {
    if (!Turbolinks) {
        location.reload();
        }
    var checkOutForm = document.getElementById("checkout-form")
    var estateSelect = document.getElementById("estate")
    var deliveryEstate = document.getElementById("delivery-estate")
    var stationSelect = document.getElementById("pick-up-station")
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
    
    function getPickUpStation(estate){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function(){
            if(this.readyState ==4 && this.status == 200){
                
                var station = JSON.parse(this.responseText).stations
                
                for (let i = 0; i < station.length; i++){
                    var station_name = station[i].name
                    var station_street = station[i].street
                    var id = "stations" + i.toString();
                    var div = document.createElement('div')
                    div.className = "form-check"
                    var radio =document.createElement('input')
                    radio.className = "form-check-input"
                    radio.type = "radio"
                    radio.value = station_name
                    radio.name = "delivery_station"
                    radio.id = id
                    var label = document.createElement('label')
                    label.className = "form-check-label"
                    label.setAttribute("for", id)
                    label.innerHTML = station_name
                    div.appendChild(radio)
                    div.appendChild(label)
                    stationSelect.appendChild(div)
                }
            }
        };
        xhttp.open("GET", "/get_station?estate_name="+ estate, true)
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

    function checkOutFormSubmit(){
        checkOutForm.submit();
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

    if(deliveryEstate){
        deliveryEstate.addEventListener('click', function(e){
            var estate = this.options[this.selectedIndex].text
            removeChildNodes(stationSelect)
            getPickUpStation(estate)
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

    

    

   