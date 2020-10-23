# Multi Domain Check


## About
Using tools from the [GNU operating system](https://www.gnu.org/) toolchain, the Multi-Domain-Check script probes a list of domain names for:

* A record(s)
* AAAA record(s)
* CNAME
* MX record(s)
* TXT record(s)
* HTTP Status Code


## Usage
Add all domain names to check in the input file `multi-domain-dig_input.txt`, separated by newline. Run the script with `./multi-domain-check.sh`. The output is printed to `multi-domain-check_output.csv`.


## Dependencies
* `curl` - transfer a URL
* `dig` - DNS lookup utility
* `gawk` - pattern scanning and processing language
* `whois` - client for the whois directory service

---

## Mirrors

You can find this repository on:
* GitLab  
  [https://gitlab.com/jonasjacek/multi-domain-check](https://gitlab.com/jonasjacek/multi-domain-check)
* GitHub  
  [https://github.com/jonasjacek/multi-domain-check](https://github.com/jonasjacek/multi-domain-check)

---

## Warranty and Liability

[Multi-Domain-Check](https://gitlab.com/jonasjacek/multi-domain-check) is a small, private project. The author makes absolutely no claims and representations to warranties regarding the accuracy or completeness of the information provided. However, you can use the information in this repository AT YOUR OWN RISK.

## Licence

<span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" property="dct:title" rel="dct:type">Multi-Domain-Check</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://gitlab.com/jonasjacek/multi-domain-check" property="cc:attributionName" rel="cc:attributionURL">Jonas Jacek</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>. Permissions beyond the scope of this license may be available upon <a xmlns:cc="http://creativecommons.org/ns#" href="https://www.jonas.me/contact" rel="cc:morePermissions">request</a>.

---

## Contribute

Found a mistake? [Open an issue](https://gitlab.com/jonasjacek/multi-domain-check/-/issues) or [send a merge request](https://gitlab.com/jonasjacek/multi-domain-check/-/merge_requests). Want to help in another way? [Contact me](https://www.jonas.me/contact).
