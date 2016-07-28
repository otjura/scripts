function Get-Uptime {
    
    function AddZero([string]$arg) {
        if($arg.Length -eq 1) {
            return "0"+$arg
        } else {
            return $arg
        }
    }

    function DayN([string]$arg) {
        if($arg -eq "1") {
            return " day, "
        } else {
            return " days, "
        }
    }

    $date = Get-Date
    $os = Get-WmiObject win32_operatingsystem
    $uptime = $date - ($os.ConvertToDateTime($os.LastBootUpTime))
    $dsecond = AddZero($date.Second.ToString())
    $dminute = AddZero($date.Minute.ToString())
    $dhour = AddZero($date.Hour.ToString())
    $dayss = DayN($uptime.Days)
    $date = $dhour + ":" + $dminute + ":" + $dsecond

    $display = $date + ", up " + $uptime.Days + $dayss + $uptime.Hours + ":" + $uptime.Minutes
    Write-Output $display

    
}