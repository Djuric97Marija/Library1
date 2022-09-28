function setDateDolazak() //Minimum datuma dolaska moze da bude sutrasnji dan. Sutrasnji dan se stavlja kao pocetna vrednost
{
var tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate()+1);
    
    document.getElementById("datumDolaska").value = tomorrow.getFullYear() + '-' + ('0' + (tomorrow.getMonth() + 1)).slice(-2) + '-' + ('0' + tomorrow.getDate()).slice(-2);
    document.getElementById("datumDolaska").min = tomorrow.getFullYear() + '-' + ('0' + (tomorrow.getMonth() + 1)).slice(-2) + '-' + ('0' + tomorrow.getDate()).slice(-2);
    
    
};
function setDateOdlazak()
{
    var pom = document.getElementById("datumDolaska").value;
    
   
    var datePom = new Date(pom);
    
    datePom.setDate(datePom.getDate() + 1);
    
    document.getElementById("datumOdlaska").min = datePom.getFullYear() + '-' + ('0' + (datePom.getMonth() + 1)).slice(-2) + '-' + ('0' + datePom.getDate()).slice(-2);
    document.getElementById("datumOdlaska").value = datePom.getFullYear() + '-' + ('0' + (datePom.getMonth() + 1)).slice(-2) + '-' + ('0' + datePom.getDate()).slice(-2);


}