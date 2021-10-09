
[array]$Sites = @("http://192.168.33.10:80",
"http://192.168.33.11:80")
$Loadbalancer = "http://localhost:8888"
$islbon=0
$request=Invoke-WebRequest -Uri $Loadbalancer
$i=1

foreach($url in $Sites) {

   try {
      Write-host "Verifying $url" -ForegroundColor Yellow
      $checkConnection = Invoke-WebRequest -Uri $url
      if ($checkConnection.StatusCode -eq 200) {
         Write-Host "Connection Verified!" -ForegroundColor Green
      }

   } 
   catch [System.Net.WebException] {
      $exceptionMessage = $Error[0].Exception
      if ($exceptionMessage -match "503") {
         Write-Host "Server Unavailable" -ForegroundColor Red
         break
      }
      elseif ($exceptionMessage -match "404") {
         Write-Host "Page Not found" -ForegroundColor Red
         break
      else break
      }


   }
}

Write-Host "Making requests..."

while($i -ne 10)
    {$i++
     $request2=Invoke-WebRequest -Uri $Loadbalancer
     if ($request2.Content -ne $request1.Content) {
     $islbon++
     $request=$request2
     $request.Content
     }
    }
 if ($islbon -eq 0){
    Write-Host "Loadbalancer doesnt work" -ForegroundColor Red
    break
    }
 else {
 Write-Host "Responses are different. Loadbalancer works fine" -ForegroundColor Green
    }