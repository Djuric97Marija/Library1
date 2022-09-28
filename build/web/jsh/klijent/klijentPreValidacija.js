function datumValidacija()
{
    var datumOdlaska = document.getElementById("datumOdlaska").value;
    
    if(datumOdlaska=== "")
    {
    alert('Molim Vas, unesite datum odlaska.');
    document.getElementById("datumOdlaska").focus();
    return false;
    }
    
}