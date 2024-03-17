#!/usr/bin/env python
# Python program to mimic doing multiple dig commands in bash,
# and outputting the information parsed in an easy to read format.

# Written by David M Harris on 16 March 2024
# dave@harris-services.com

# Import the normal system calls, as well as ones from
# the dnspython module.
import sys
import dns.name
import dns.resolver
import dns.reversename

# Take the domain as an argument or prompt for it.
try:
    domain_name = sys.argv[1]
except IndexError:
    domain_name = input ("Enter the domain to check: ")

# Sets the resolver to one that works with DNSSEC.
resolver = dns.resolver.Resolver()
resolver.nameservers = ['4.2.2.1']

# Print the header.
print (f"DNS for {domain_name}.\n")

# Print the A record(s) for the domain.
a_answers = resolver.resolve(domain_name, 'A')
print ("A record(s):")
for rdata in a_answers:
    print(rdata.address)
print()

# Print the SOA record for the domain.
soa_answers = resolver.resolve(domain_name, 'SOA')
print ("SOA:")
for rdata in soa_answers:
    print(f' serial: {rdata.serial} | tech: {rdata.rname} | mname: {rdata.mname}')
    print(f' refresh: {rdata.refresh} | retry: {rdata.retry} | expire: {rdata.expire} | minimum: {rdata.minimum}')
print()

# Print the nameservers for the domain with the related A record(s).
ns_answers = resolver.resolve(domain_name, 'NS')
print("Nameservers:")
for server in ns_answers:
    print(server.target)
    a_answers = resolver.resolve(server.target, 'A')
    for rdata2 in a_answers:
        print(rdata2.address)
    print()

# Print the MX records for the domain with the related A record(s).
mx_answers = resolver.resolve(domain_name, 'MX',)
print ("MX:")
for rdata in mx_answers:
    print('Host', rdata.exchange, 'has preference', rdata.preference)
    a_answers = resolver.resolve(rdata.exchange, 'A')
    for rdata3 in a_answers:
        reverse_addr = dns.reversename.from_address(rdata3.address)
        print(rdata3.address, 'PTR:', resolver.resolve(reverse_addr, "PTR")[0])
    print()

# Print the TXT record(s) for the domain.
txt_answers = resolver.resolve(domain_name, 'TXT')
print ("TXT:")
for rdata in txt_answers:
    for txt_string in rdata.strings:
        txt_value = str(txt_string)
        trimmed_txt_value = txt_value[1:]
        print (trimmed_txt_value)