function publishSln{
    Param(
	      [parameter(
	            position=0
	        )]
          $SolutionFile,
	     
        $ProfilePath,
	$Config
      )

      if($ProfilePath -eq $null){
      	$ProfilePath = "localhost.pubxml"
      }

      if($SolutionFile -eq ""){
        $SolutionFile = (Get-ChildItem -Filter "*.sln").Name
      }

      if($Config -eq $null){
	$Config = "Debug"
      }	

      msbuild $SolutionFile /p:DeployOnBuild=true /p:PublishProfile=$ProfilePath /p:VisualStudioVersion=11.0  /p:Configuration=$Config
}

Set-Alias msbuild "c:\windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
