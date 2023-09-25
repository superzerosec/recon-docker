# recon-docker
Reconnaissance and vulnerability assessment toolset in a docker. This project serve multiple use cases, such as:
1. Internet asset reconnaissance
2. Vulnerability assessment

# Building docker
```bash
git clone https://github.com/superzerosec/recon-docker.git
cd recon-docker
docker build -t superzerosec/recon-docker:0.1 .
```

# Running docker
```bash
docker build -t superzerosec/recon-docker:0.1 .
```

# Usage
## Internet asset reconnaissance
Recon single target on `tesla.com`
```bash
subfinder -silent -d tesla.com | dnsx -silent | httpx -silent | katana -silent | tee -a recons.txt
```

For multiple target in file, create a `domains.txt`
```bash
bugcrowd.com
tesla.com
uber.com
```

Recon multiple target on `domains.txt`
```bash
subfinder -silent -dL domains.txt | dnsx -silent | httpx -silent | katana -silent | tee -a recons.txt
```

## Vulnerability assessment
Vulnerability assessment single target on `tesla.com`
```bash
subfinder -silent -d tesla.com | dnsx -silent | httpx -silent | katana -silent | nuclei -silent
```


# Credit
* [amass](https://github.com/owasp-amass/amass)
* [theHarvester](https://github.com/laramies/theHarvester)
* [waybackurls](https://github.com/tomnomnom/waybackurls)
* [assetfinder](https://github.com/tomnomnom/assetfinder)
* [anew](https://github.com/tomnomnom/anew)
* [gf](https://github.com/tomnomnom/gf)
* [qsreplace](https://github.com/tomnomnom/qsreplace)
* [dnsx](https://github.com/projectdiscovery/dnsx)
* [httpx](https://github.com/projectdiscovery/httpx)
* [subfinder](https://github.com/projectdiscovery/subfinder)
* [uncover](https://github.com/projectdiscovery/uncover)
* [tlsx](https://github.com/projectdiscovery/tlsx)
* [katana](https://github.com/projectdiscovery/katana)
* [nuclei](https://github.com/projectdiscovery/nuclei)
* [OWASP Amass](https://github.com/OWASP/Amass)
* [gau](https://github.com/lc/gau)
* [hakrawler](https://github.com/hakluke/hakrawler)
* [unew](https://github.com/dwisiswant0/unew)
# Special Thanks
* [KingOfBugBountyTips](https://github.com/KingOfBugbounty/KingOfBugBountyTips)
