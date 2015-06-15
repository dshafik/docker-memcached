dockps()  {
  docker ps ${@:2} | awk '
  NR==1{
    FIRSTLINEWIDTH=length($0)
    IDPOS=index($0,"CONTAINER ID");
    IMAGEPOS=index($0,"IMAGE");
    COMMANDPOS=index($0,"COMMAND");
    CREATEDPOS=index($0,"CREATED");
    STATUSPOS=index($0,"STATUS");
    PORTSPOS=index($0,"PORTS");
    NAMESPOS=index($0,"NAMES");
    #UPDATECOL();
  }
  function UPDATECOL () {
    ID="     ID: " substr($0,IDPOS,IMAGEPOS-IDPOS-1) "\n";
    IMAGE="  IMAGE: " substr($0,IMAGEPOS,COMMANDPOS-IMAGEPOS-1) "\n";
    COMMAND="COMMAND: " substr($0,COMMANDPOS,CREATEDPOS-COMMANDPOS-1) "\n";
    CREATED="CREATED: " substr($0,CREATEDPOS,STATUSPOS-CREATEDPOS-1) "\n";
    STATUS=" STATUS: " substr($0,STATUSPOS,PORTSPOS-STATUSPOS-1) "\n";
    PORTS="  PORTS: " substr($0,PORTSPOS,NAMESPOS-PORTSPOS-1) "\n";
    NAMES="   NAME: " substr($0, NAMESPOS) "\n";
  }
  function PRINT () {
    print '"${1//|/ }"';
  }
  NR==2{
    NAMES=sprintf("%s%*s",NAMES,length($0)-FIRSTLINEWIDTH,"");
    PRINT();
  }
  NR>1{
    UPDATECOL();
    PRINT();
  }' | tee;
}
dps() { dockps "ID|NAMES|IMAGE|COMMAND|CREATED|STATUS|PORTS" $@; }
dpsa() { dps -a $@; }
dports() { docker inspect --format="{{(index (index .NetworkSettings.Ports \"$1/tcp\") 0).HostPort}}" $2; }
alias docker-ps=dps
alias docker-port=dports
