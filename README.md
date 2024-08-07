# Findmore
Aggressive subdomain collector 

this tool is a collection of another tools like : [ subfinder , assetfinder , chaos , findomain , sublist3r ]

# Requirements
**subfinder assetfinder chaos**: 
```
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest && go install -v github.com/tomnomnom/assetfinder@latest && go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
```
>you can make this tools run from any directory with
` cd ~/go/bin `
>first navigate to Go binary directory with
`sudo cp subfinder assetfinder chaos /usr/bin`

**findomain**:
```
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip
unzip findomain-linux-i386.zip
chmod +x findomain
```
**Sublister**:
```
git clone https://github.com/aboul3la/Sublist3r.git
```
#make sure to get all requirements for sublister with
```
sudo pip install -r requirements.txt
```

# usage :
```
sudo chmod +x app.sh
./app.sh domain.com
```
# features:
this tool will collect subdomain like any tool but here's the difference:
1) collect all subdomains and subs-subdomains in output like that : *.sub.domain.com
2) recursion finding subdomains for every *.subdomain.com
3) huge number of subdomain without conflict names output
