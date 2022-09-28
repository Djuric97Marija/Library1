function osposobiGrad()
{
    
    var element = document.getElementById('slct1');
     
    if(element.options[element.selectedIndex].value !== '')
    {
        document.getElementById('slct2').disabled = false;
        
    }
    
    
    
}

function osposobiDugmeZaPretragu()
{
    
    var element = document.getElementById('slct2');
     
    if(element.options[element.selectedIndex].value !== '')
    {
        document.getElementById('hotelPrikazSubmit').disabled = false;
        
    }
    
    
    
}